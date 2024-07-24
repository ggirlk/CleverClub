import pathlib
import textwrap

import google.generativeai as genai

from IPython.display import display
from IPython.display import Markdown

import json

from dotenv import load_dotenv

import os

staticDir = os.path.join(os.path.dirname(__file__), 'static')

class GenerateAnything():

    def __init__(self):
        pass

    def to_markdown(self, text):
        text = text.replace('•', '  *')
        return Markdown(textwrap.indent(text, '> ', predicate=lambda _: True))

    def callgemini(self, promptText, jsonResult=True): 
        load_dotenv()
        GOOGLE_API_KEY = os.getenv("GEMINI_API_KEY", default="")

        genai.configure(api_key=GOOGLE_API_KEY)

        model = genai.GenerativeModel('gemini-1.5-pro')
        
        response = model.generate_content(promptText, generation_config={"response_mime_type": "application/json"})
        
        print("generated json", response.text)
        
        return response.text
    
    def getPrompt(self, obj, contentType):
        """ get prompt depending on content type """
        if contentType == "Music":
            return """
                    {
                        "description": "make a json that holds music tones following the prompt details, the json should contains parts and intstuments as given in the output_format, each element associated with tones in alphabetical notation, numerical durations between 0 and 1000 millisecondes, and pitch between 0 and 127, a numerecal offset in seconds",
                        "prompt": {
                            "key": "G minor",
                            "tempo": 124,
                            "time_signature": "2/4",
                            "style": "metal",
                            "feel": "energetic, syncopated and groovy",
                            "rhythm": "fast",
                            "instruments": ["BassGuitar", "ElectricGuitar", "ElectricJazzGuitar", "AcousticGuitar", "Organ", "Violin", "Viola", "Harp", "Cello", "Contrabass", "Piano", "Saxophone", "LeadSynth", "BassSynth", "PadSynth", "AcousticBass", "ElectricOrgan", "Trumpet", "AltoSaxophone", "Trombone", "Glockenspiel"],
                            "drums": ["BassDrum", "SnareDrum", "RideCymbal", "HighTom1", "MidTom1", "LowTom2", "HihatOpen", "HihatClosed", "Clap"],
                            "max_offset": 180
                            "full_duration_in_seconds": 180
                        },
                        "output_format": {
                            "InstrumentPart0":{
                                "InstrumentName": [
                                    {
                                    "tone": "C",
                                    "duration": 125,
                                    "pitch": 36,
                                    "offset": 0.0
                                    }
                                ]
                            }
                            "DrumsPart0": {
                                "InstrumentName": [
                                    {
                                    "tone": "C",
                                    "duration": 125,
                                    "pitch": 36,
                                    "offset": 0.0
                                    }
                                ]
                            } 
                        }
                    }
                """
        elif contentType == "Puzzle":
            output_format = """
                            {
                            "tags": [
                                {"tag": "h1", "innerText": "text"},
                                {"tag": "h2", "innerText": "text"},
                                // .....
                                {"tag": "h6", "id": "question_i", "innerText": "text"},
                                {"tag": "ul", "innerText": [
                                    {"tag": "li", "innerText": "text"},
                                    {"tag": "li", "innerText": "text"},
                                    // ..
                                                ]},
                                {"tag": "input", "type": "text", "id": "student-answer_i", "innerText": ""},          
                                {"tag": "button", "class": "btn-question", "data-question": "i", "innerText": "Check my answer"},
                                {"tag": "p", "innerText": "text"},
                                {"tag": "a", "href": "link", "innerText": "text"},
                                {"tag": "img", "src": "image_link", "alt":"picture title", "innerText": "text"},
                                {"tag": "p", "id": "answer_i", "hidden": "True", "innerText": "text"},

                                {"tag": "script", "type": "text/javascript", 
                                    "innerText": "add inputs tags with each question dynamically
                                                    declare btn-question, 
                                                    define event on button click;
                                                        get attribute data-question number and compare student-answer_i value with answer_i innerText value,
                                                        if the values are alike push a success message else a sweet warning message to try again
                                                        using sweet alert (version 2.1.2) instead of classical alert to show messages
                                                        "
                                    },
                                // ..

                            ]
                            }
                            """
        else:
            output_format = """
                            {
                            "tags": [
                                {"tag": "h1", "innerText": "text"},
                                {"tag": "h2", "innerText": "text"},
                                // .....
                                {"tag": "h6", "innerText": "text"},
                                {"tag": "ul", "innerText": [
                                    {"tag": "li", "innerText": "text"},
                                    {"tag": "li", "innerText": "text"},
                                    // ..
                                                ]},
                                {"tag": "input", "type": "text", "id": "student-answer_i", "innerText": ""},          
                                {"tag": "button", "class": "btn-question", "data-question": "i", "innerText": "Check my answer"},
                                {"tag": "p", "innerText": "text"},
                                {"tag": "a", "href": "link", "innerText": "text"},
                                {"tag": "img", "src": "image_link", "alt":"picture title", "innerText": "text"},
                                // ..
                             ]
                            }
                            """
        prompt ="""{
                     "description": "Generate a """+ obj.contentType +""" that follows the prompt details, the """+ obj.contentType +""" can contain well linked existing images, links code sections, any specialchars or symbols, as a json make sure to follow the output format sample and combine as you need",
                     "prompt_details": {
                        "Content_Type":  """+ obj.contentType +""",
                        "Section": """+ obj.category.section.title  +""",
                        "Category": """+ obj.category.title  +""",
                        "title": """+ obj.title +"""
                        "description": """+ obj.description +"""
                        "level": """+ obj.level  +""",
                        "question number": "if the Content_Type is Puzzle make sure to generate a minimum of 5 questions",
                        "length": "Medium",
                        "audience": "kids and teenagers",
                        "extra_notes": "use html icons from fontawesome or emojies when you can't refer to images, add the input tags using javascript",
                        "important_note": "make sure to generate only the output json starting by {'tags' : [....]}",
                        "output_format": """+output_format+"""
                    }
                 """
        # need to fix prompts for all and fix the music generator page urgently
        return prompt

