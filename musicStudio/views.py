from django.shortcuts import render
from django.http import HttpResponse, JsonResponse

import pathlib
import textwrap

import google.generativeai as genai

from IPython.display import display
from IPython.display import Markdown

import json

from dotenv import load_dotenv

#from django.conf.urls.static import static

import os

staticDir = os.path.join(os.path.dirname(__file__), 'static')

def to_markdown(text):
  text = text.replace('•', '  *')
  return Markdown(textwrap.indent(text, '> ', predicate=lambda _: True))

def studio(request):
    return render(request, 'studio.html')

def native(request):
    return render(request, 'native.html')


def promptText(musicType) :
    p = """make a json that holds 120 seconds of """+musicType+""" music,
            the json should contains parts and intstuments as given in the example,
            each element associated with tones in alphabetical notation,
            numerical durations between 0 and 1000 ms,
            and pitch between 0 and 127
            numerecal offset in seconds
            the example
            {
                "part0": {
                    "InstrumentName" :
                    [{
                    "tone": "",
                    "duration": ,
                    "pitch": ,
                    "offset": ,
                    }, ... ],
                }
                "part1": {
                    "InstrumentName" :
                    [{
                    "tone": "",
                    "duration": ,
                    "pitch": ,
                    "offset": ,
                    }, ... ],
                }

            }
            pick instruments names from this list :
            [
                "BassDrum",
                "SnareDrum",
                "RideCymbal",
                "HighTom1",
                "MidTom1",
                "LowTom2",
                "HihatOpen",
                "HihatClosed",
                "Clap",
                "BassGuitar",
                "ElectricGuitar",
                "JazzBassGuitar",
                "AcousticGuitar",
                "Organ",
                "Violin",
                "Viola",
                "Harp",
                "Cello",
                "Contrabass",
                "Piano",
                "Saxophone",
                "LeadSynth",
                "BassSynth",
                "PadSynth",
                "AcousticBass",
                "ElectricOrgan",
                "Trumpet",
                "AltoSaxophone",
                "Trombone",
                "Glockenspiel",
            ]
            each part has one instrument
            the rhythm should be fast
            try to generate trimed json no extra spaces or line jumps
            make sure that the stringyfied json is less than 14061 characters
            and make sure to use the right instrument name instead of the example's InstrumentName
            without textual explanations turn only the json object"""
    structuredP = """
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
    return structuredP


def callgemini(request): 
    load_dotenv()
    GOOGLE_API_KEY = os.getenv("GEMINI_API_KEY", default="")
    exit()
    genai.configure(api_key=GOOGLE_API_KEY)
    model = genai.GenerativeModel('gemini-1.5-pro')
    response = model.generate_content(promptText("trance"), generation_config={"response_mime_type": "application/json"})
    textResponse = response.text
    jsonResponseFromText = textResponse.replace("```json", "")
    jsonResponseFromText = jsonResponseFromText.replace("```", "") 
    print(textResponse)
    #print("**********************************")
    #print(textResponse[8:len(textResponse)-3])
    i = 12
    fileName = "test"+str(i)+".json"
    staticFilePath = "/jsonfiles/"+fileName
    filePath = staticDir +staticFilePath 
    with open(filePath, "w") as outputFile:
        json.dump(jsonResponseFromText, outputFile)

    return JsonResponse({"file": staticFilePath,"data":jsonResponseFromText}, safe=False)




