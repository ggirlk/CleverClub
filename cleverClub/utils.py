import pathlib
import textwrap

import google.generativeai as genai

from IPython.display import display
from IPython.display import Markdown

import json
import json5

from dotenv import load_dotenv

import os
import re

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
        # model = genai.GenerativeModel('gemini-1.5-flash')
        
        response = model.generate_content(promptText, generation_config={"response_mime_type": "application/json"})
        
        print("generated json", response.text)
        
        return response.text
    
    def getPrompt(self, obj, contentType, instruments="", drums=""):
        """ get prompt depending on content type """
        if contentType == "Music":

            # "drums": ["BassDrum", "SnareDrum", "RideCymbal", "HighTom1", "MidTom1", "LowTom2", "HihatOpen", "HihatClosed", "Clap"],
            # ["BassGuitar", "ElectricGuitar", "ElectricJazzGuitar", "AcousticGuitar", "Organ", "Violin", "Viola", "Harp", "Cello", "Contrabass", "Piano", "Saxophone", "LeadSynth", "BassSynth", "PadSynth", "AcousticBass", "ElectricOrgan", "Trumpet", "AltoSaxophone", "Trombone", "Glockenspiel"]
            return """
                    {
                        "description": "make a json that holds music tones following the prompt details, the json should contains parts and intstuments as given in the output_format, each element associated with tones in alphabetical notation, numerical durations between 0 and 1000 millisecondes, and pitch between 0 and 127, a numerecal offset in seconds",
                        "prompt": {
                            "key": '"""+obj.key+"""',
                            "tempo": '"""+str(obj.tempo)+"""',
                            "time_signature": '"""+obj.timeSignature+"""',
                            "style": '"""+obj.style+"""',
                            "feel": '"""+obj.feel+"""',
                            "rhythm": '"""+obj.rhythm+"""',
                            "instruments": ["""+instruments+"""],
                            "drums": ["""+drums+"""],
                            "max_offset": 180,
                            "full_duration_in_seconds": 180,
                            "important": "use the exact same names as in the instruments and drums names without spaces so that they match my dict keys, and make sure that the overall duration is 60 seconds"
                        },
                        "output_format": {
                            "InstrumentPart_i":{
                                "InstrumentName": [
                                    {
                                    "tone": "C",
                                    "duration": 125,
                                    "pitch": 36,
                                    "offset": 0.0
                                    }
                                ]
                            },
                            "InstrumentPart_i+1": {
                                "InstrumentName": [
                                    {
                                    "tone": "C",
                                    "duration": 125,
                                    "pitch": 36,
                                    "offset": 0.0
                                    }
                                ]
                            },
                            "Drums": {
                                "InstrumentName": [
                                    {
                                    "tone": "hihat",
                                    "duration": 125,
                                    "pitch": 42,
                                    "offset": 0.0
                                    }
                                ]
                            }
                        }
                    }
                """
        if contentType == "Puzzle":
            inspirationalExample = """
            <!DOCTYPE html>
                <html>
                <head>
                <title>Number Balloons</title>
                <style>
                body { 
                margin: 0; 
                overflow: hidden;
                font-family: Arial, sans-serif;
                background-color: #e0f7fa; /* Light blue background */
                }

                #game-container {
                position: relative;
                width: 400px;
                height: 600px;
                margin: 50px auto;
                border: 2px solid #ccc;
                overflow: hidden;
                background-image: url('sky.jpg'); /* Replace with an actual sky background */
                background-size: cover;
                }

                .balloon {
                position: absolute;
                width: 50px;
                height: 70px;
                border-radius: 50% 50% 50% 0;
                transform: rotate(-90deg);
                background-color: hsl(0, 70%, 70%); /* Light red */
                text-align: center;
                line-height: 70px; 
                font-size: 20px;
                font-weight: bold;
                cursor: pointer;
                }

                .balloon::before {
                content: "";
                position: absolute;
                top: 65px;
                left: 20px;
                width: 5px;
                height: 20px;
                background-color: hsl(0, 70%, 50%); /* Darker red */
                }

                #problem {
                position: absolute;
                bottom: 20px;
                left: 50%;
                transform: translateX(-50%);
                background-color: rgba(255, 255, 255, 0.8);
                padding: 10px;
                border-radius: 5px;
                font-size: 24px;
                }
                </style>
                </head>
                <body>
                <div id="game-container">
                <div id="problem"></div>
                </div>

                <script>
                const gameContainer = document.getElementById('game-container');
                const problemElement = document.getElementById('problem');
                let score = 0;
                let speed = 1; // Adjust balloon speed

                function getRandomNumber(min, max) {
                return Math.floor(Math.random() * (max - min + 1)) + min;
                }

                function generateProblem() {
                const num1 = getRandomNumber(1, 10); 
                const num2 = getRandomNumber(1, 10);
                const correctAnswer = num1 + num2;
                const problemText = `${num1} + ${num2} = ?`;
                problemElement.textContent = problemText;

                // Create balloons, one with the correct answer
                createBalloon(correctAnswer);
                for (let i = 0; i < 2; i++) { // Create 2 incorrect balloons
                    let wrongAnswer;
                    do {
                    wrongAnswer = getRandomNumber(1, 20); 
                    } while (wrongAnswer === correctAnswer); 
                    createBalloon(wrongAnswer);
                }
                }

                function createBalloon(number) {
                const balloon = document.createElement('div');
                balloon.classList.add('balloon');
                balloon.textContent = number;
                balloon.style.left = `${getRandomNumber(10, gameContainer.offsetWidth - 60)}px`;
                balloon.style.bottom = '-70px'; // Start offscreen

                balloon.addEventListener('click', () => {
                    checkAnswer(number, balloon);
                });

                gameContainer.appendChild(balloon);

                // Animate the balloon upwards
                let balloonInterval = setInterval(() => {
                    let currentBottom = parseInt(balloon.style.bottom);
                    balloon.style.bottom = `${currentBottom + speed}px`;

                    if (currentBottom > gameContainer.offsetHeight) {
                    clearInterval(balloonInterval); 
                    balloon.remove(); 
                    }
                }, 20); 
                }

                function checkAnswer(clickedNumber, balloon) {
                let problemParts = problemElement.textContent.split(' ');
                let correctAnswer = parseInt(problemParts[0]) + parseInt(problemParts[2]); 

                if (clickedNumber === correctAnswer) {
                    // Correct answer!
                    score++;
                    balloon.style.backgroundColor = 'green'; // Visual feedback
                    setTimeout(() => {
                    balloon.remove();
                    generateProblem(); 
                    }, 500); 
                } else {
                    // Incorrect answer
                    balloon.style.backgroundColor = 'red'; // Visual feedback
                    setTimeout(() => {
                    balloon.style.backgroundColor = 'hsl(0, 70%, 70%)'; // Reset color
                    }, 500); 
                }
                }

                generateProblem(); 
                </script>
                </body>
                </html>

            """
            output_format0 = """
            {
                "tags": [
                    { "tag": "h2", "innerText": "Puzzle Title" }, // Example title
                    { "tag": "p", "innerText": "description and insights" }, // Description
                    { "tag": "ul", "innerText": [ // game rules
                        { "tag": "li", "data-choice": "a", "innerText": "Rule 1" },
                        { "tag": "li", "data-choice": "b", "innerText": "Rule 2" },
                        // ... more Rules
                    ]
                    },
                    { "tag": "div", "id": "puzzle-container", "innerText": [
                        { "tag": "canvas", "id": "puzzle-canvas", "style": "canvas needed style" }, // if there is a moving elements for more interactivity
                        // Puzzle grid, elements, or visual representation here 
                        { "tag": "div", "class": "grid-row", "innerText": [ 
                            // use editable div tags as:
                            { "tag": "div", "class": "grid-cell", "data-value": "5", "innerText": "5", "style": "needed style", "contenteditable": "true or false as needed"  }, 
                            // or use input tags as:
                            { "tag": "input", "class": "grid-cell", "data-value": "5", "value": "5", "style": "needed style"  }, 
                            // ... more grid cells, add style with height and width attributes when needed
                        ]
                        },
                        // ... more grid rows 
                    ] 
                    },
                    { "tag": "input", "type": "text", "id": "user-answer", "placeholder": "Enter your answer" }, // Example input field
                    { "tag": "button",  "innerText": "Check Answer", "onclick": "checkAnswer()", "id": "check-answer-button"},
                    { "tag": "p", "id": "feedback" }, // Placeholder for feedback 
                    {"tag": "script", "type": "text/javascript", 
                                    "innerText": "full JavaScript implementation depending on the generated puzzle logic\n\
                                                function checkAnswer() {\
                                                write code to validate the answer \
                                                and update the 'feedback' element\
                                                and if answer validated push a success message else a sweet warning message to try again\
                                                using sweet alert (version 2.1.2) instead of classical alert to show messages\
                                                here is an Example of success swal("Yay 🎉🎉", "Well done! congratulation you've solved the puzzle!", "success")"
                                    },
                ]
                }
            }
            """
            output_format = """
                            {
                                "html": '\
                                <h2>Puzzle Title</h2>\n\
                                <p>Puzzle description and insights</p>\n\
                                <ul> <h5> Puzzle rules</h5>\n\
                                    <li>Rule 1</li>\n\
                                    <li>Rule 2</li>\n\
                                    // other rules\n\
                                </ul>\n\
                                <div id="puzzle-container" style="">\n\
                                    <canvas id="puzzle-canvas" height="" width="" style=""> //add canvas for interactive puzzles like Numbers Balloon and fill height and width and if needed more style\n\
                                    <p style="">tex or equation </p> // text or anything if needed 
                                    <div id="puzzle-grids"> // this is and example for puzzle that rely on grids like sudoku\n\
                                        <div id="row_i" style="display:flex;"> // this row has 3 sub rows called box_row \n\
                                            <div class="box" id="box_i_j"> // \n\
                                                <div class="box_row_i_j_k" style="display:flex;">\n\
                                                    <input type="number" max-length=1 value="" id="cell_k_m" >\n\
                                                    <input type="number" max-length=1 value="" id="cell_k_m+1" >\n\
                                                    <input type="number" max-length=1 value="" id="cell_k_m+2" >\n\
                                                </div>\n\
                                                <div class="box_row_i_j_k+1" style="display:flex;">\n\
                                                    <input type="number" max-length=1 value="" id="cell_k+1_m" >\n\
                                                    <input type="number" max-length=1 value="" id="cell_k+1_m+1" >\n\
                                                    <input type="number" max-length=1 value="" id="cell_k+1_m+2" >\n\
                                                </div>\n\
                                                <div class="box_row_i_j_k+2" style="display:flex;">\n\
                                                    <input type="number" max-length=1 value="" id="cell_k+2_m" >\n\
                                                    <input type="number" max-length=1 value="" id="cell_k+2_m+1" >\n\
                                                    <input type="number" max-length=1 value="" id="cell_k+2_m+2" >\n\
                                                </div>\n\
                                            </div>\n\
                                            // and more row boxes\n\
                                        </div>\n\
                                        // and more puzzle rows\n\
                                    <div>\n\
                                    <button onclick="checkAnswer()" id="puzzle-checker" ></button> // only if a puzzle needs validation by click event\n\
                                </div>\n\
                                <script type='text/javascript'>\n\
                                    function checkAnswer() {\n\
                                        javascript full code to check the player answer when needed depending on the puzzle logic and becarefull of infinite loops\
                                        and if answer validated push a success message else a sweet warning message to try again\
                                                using sweet alert (version 2.1.2) instead of classical alert to show messages\
                                                here is an Example of success swal("Yay 🎉🎉", "Well done! congratulation you've solved the puzzle!", "success")\n\
                                    }\n\
                                    other script for interactivity like manipulating the canvas or generating different numbers or words depending on the puzzle\n\
                                </script>
                                '
                            }
                """
            prompt ="""{
                     "description": "Generate a html contents for a puzzle as described in the prompt details in the form of json as in the output format",
                     "prompt_details": {
                        "Content_Type":  """+ obj.contentType +""",
                        "Section": """+ obj.category.section.title  +""",
                        "Category": """+ obj.category.title  +""",
                        "title": """+ obj.title +"""
                        "description": """+ obj.description +"""
                        "level": """+ obj.level  +""",
                        
                        "levels number": "3 levels: 1 easy, 2 medium, 3 difficult",
                        "length": "Medium",
                        "audience": "kids and teenagers",
                        "important_notes": "make sure to generate only the output json starting by {'html' : "..."} \
                            and make sure the json is valide, write the full javascript to check the answers \
                                depending on the generated puzzle, make sure that the script is well done \
                                    and does not make errors, don't add extra " around the tag name, \
                                        when a tag have a data-value make sure it's in its value attribute \
                                            if it's input or in its innerText so that it can be visible\
                                                apply styles only on the generated tags",
                        "output_format": """+output_format+"""
                    }
                 """
            return prompt
        else:
            output_format0 = """ 
                {
                "tags": [ 
                    { "tag": "h1", "innerText": "Course Title" }, // Example title
                    { "tag": "p", "innerText": "A brief description of the course." },

                    // Section 1
                    { "tag": "h2", "innerText": "Section 1 Title" },
                    { "tag": "p", "innerText": "Some introductory text for the section." },
                    { "tag": "img", "src": "/images/section1-image.jpg", "alt": "Section 1 Image" },
                    { "tag": "pre", "innerText": [ // Example code block
                        { "tag": "code", "innerText": "console.log('Hello, world!');" }
                    ] 
                    },

                    // Section 2 (and so on)
                    { "tag": "h2", "innerText": "Section 2 Title" }, 
                    // ... add more content elements as needed ...

                    // Quiz (if applicable)
                    { "tag": "h3", "innerText": "Quiz Time!" },
                    { "tag": "p", "id": "question_i", "innerText": "Question 1: What is...?" },
                    { "tag": "ul", "innerText": [
                        { "tag": "li", "data-choice": "a", "innerText": "a) Option A" },
                        { "tag": "li", "data-choice": "b", "innerText": "b) Option B (Correct)" },
                        // ... more options
                    ]
                    },
                    { "tag": "input", "type": "text", "id": "answer_i", "placeholder": "Enter your answer" },
                    // ... (More quiz questions using the same structure)

                    { "tag": "script", "type": "text/javascript", "innerText": 
                    "// JavaScript for interactivity, answer checking, etc.\n\
                    // Example: Function to check answers for multiple-choice questions \n\
                    function checkAnswer(questionNumber, correctChoice) {\n\
                        let selectedChoice = document.querySelector(`li[data-question='${questionNumber}']:checked`);\n\
                        if (selectedChoice && selectedChoice.dataset.choice === correctChoice) {\n\
                        // Handle correct answer\n\
                        } else {\n\
                        // Handle incorrect answer\n\
                        }\n\
                    }" 
                    }
                ]
                }
            """
            output_format = """
                            {
                            "tags": [
                                { "tag": "h1", "innerText": "Content Title" }, // Example title
                                { "tag": "p", "innerText": "A brief description of the content." },

                                // Section 1
                                { "tag": "h2", "innerText": "Section 1 Title" },
                                { "tag": "p", "innerText": "Some introductory text for the section." },
                                { "tag": "img", "src": "/images/section1-image.jpg", "alt": "Section 1 Image" },
                                { "tag": "pre", "innerText": [ // Example code block
                                        { "tag": "code", "innerText": "console.log('Hello, world!');" }
                                    ] 
                                },

                                // Section 2 (and so on)
                                { "tag": "h2", "innerText": "Section 2 Title" }, 
                                // ... add more content elements as needed ...

                                // Quiz (if applicable)
                                { "tag": "h3", "innerText": "Quiz Time!" },

                                {"tag": "h3", "id": "question_i", "innerText": "text"},
                                {"tag": "ul", "innerText": [
                                    {"tag": "li", "data-choice": "a", "innerText": "a) - text"},
                                    {"tag": "li", "data-choice": "b", "innerText": "b) - text"},
                                    // ..
                                    ]
                                },
                                {"tag": "input", "type": "text", "id": "student-answer_i", "innerText": ""},          
                                {"tag": "button", "class": "btn-question", "data-question": "i", "innerText": "Check my answer"},
                                {"tag": "p", "id": "answer_i", "hidden": "True", "innerText": "the right choice"},

                                {"tag": "script", "type": "text/javascript", 
                                    "innerText": "add inputs tags with each question dynamically
                                                    declare btn-question, 
                                                    define event on button click;
                                                        get attribute data-question number and compare student-answer_i value (which should contain the choice a or b or c ..) with answer_i innerText value which should be the correct choice a or b or c ..,
                                                        if the values are alike push a success message else a sweet warning message to try again
                                                        using sweet alert (version 2.1.2) instead of classical alert to show messages
                                                        // Example of success swal("title", "message", "success")
                                                        "
                                    },
                                // ..

                            ]
                            }
                            """

        output_format = """ 
                        { 
                         "html": '<div class="my-content">
                                <h2>Title</h2>
                                <p>description</p>
                                <section>
                                    <h3>Paragraph 1 title</h3>
                                    <p>paragraph 2 text</p>
                                    <div><img src="link_to_image" alt="" ></div>
                                    <div><canvas id="content_canvas"></canvas></div> // only if needed
                                    <ul><h5>list</h5> // list if needed
                                        <li>element 1</li>
                                        <li>element 2</li>
                                        <li>element 3</li>
                                    </ul>
                                    // ... add more content elements as needed ...
                                </section>
                                // .. other paragraphs ...
                                <section>
                                    <h3>Quiz time</h3>
                                    <p>Quiz text</p>
                                    <ul><h4 id="question_i">Question 1 What is ...?</h4>
                                        <li data-choice="a">a) option a</li>
                                        <li data-choice="b">b) option b</li>
                                        <li data-choice="c">c) option c</li>
                                        <li><input id="student-answer_i"></li>
                                        <li><p id="answer_i" hidden="True">the right choice which can be only a or b or c (don't put the whole option)</p></li>
                                        <li><button onclick=""checkMyAnswer()>Check My Answer</button></li>
                                    </ul>
                                    // .. other 5 quuestions ...
                                </section>
                           </div>
                           <script type="text/javascript">
                                    use the canvas to draw shapes when needed
                                    declare btn-question, 
                                    define event on button click;
                                        get attribute data-question number and compare student-answer_i value (which should contain the choice a or b or c ..) with answer_i innerText value which should be the correct choice a or b or c ..,
                                        if the values are alike push a success message else a sweet warning message to try again
                                        using sweet alert (version 2.1.2) instead of classical alert to show messages
                                        // Example of success swal("title", "message", "success")
                                        if the generated content needs reading contents use web api audio
                            </script>'
                        """
        prompt ="""{
                     "description": "Generate a """+ obj.contentType +""" that follows the prompt details, the """+ obj.contentType +""" can contain well linked existing images, links code sections, any specialchars or symbols, as a generated json make sure to follow the output format sample and combine as you need",
                     "prompt_details": {
                        "Content_Type":  """+ obj.contentType +""",
                        "Section": """+ obj.category.section.title  +""",
                        "Category": """+ obj.category.title  +""",
                        "title": """+ obj.title +"""
                        "description": """+ obj.description +"""
                        "level": """+ obj.level  +""",
                        "question number": "if the Content_Type is Quiz make sure to generate a minimum of 5 questions",
                        "length": "Medium",
                        "audience": "kids and teenagers",
                        "extra_notes": "use emojies, and generate images for it",
                        "important_note": "make sure to generate only the output json starting by {'html' : '...'} and to add \ before each " so that we don't get parsing errors and make sure the json is valide",
                        "output_format": """+output_format+"""
                    }
                 """
        # need to fix prompts for all and fix the music generator page urgently
        return prompt

    def replaceRepeatedSubstrings(self, sentence, substring, odd_replacement, even_replacement):
        """ """

        matches = [match for match in re.finditer(re.escape(substring), sentence)]

        new_sentence = sentence
        offset = 0
        for i, match in enumerate(matches):
            start, end = match.start() + offset, match.end() + offset
            replacement = odd_replacement if i % 2 == 0 else even_replacement
            new_sentence = new_sentence[:start] + replacement + new_sentence[end:]
            offset = len(replacement) - (len(odd_replacement) if i % 2 == 0 else len(even_replacement))
            #offset += len(replacement) - len(substring)
        
        return new_sentence

    # def jsonToHTML0(self, jsonContent):
    #     """  """
    #     html = ""
    #     if (type(jsonContent) == str):
    #         jsonContent = json.loads(jsonContent.encode('utf-8'))

    #     if type(jsonContent) != list:
    #         keys = list(jsonContent.keys())
    #         if keys[0] != "tags":
    #             jsonContent = jsonContent[keys[0]]
    #         if "tags" in keys:
    #             jsonContent = jsonContent["tags"]
    #     print(jsonContent)
    #     for elem in jsonContent: 
    #         print(elem)
    #         # print(elem['tag'], elem['innerText'], type(elem['innerText']))
    #         if "innerText" in elem.keys():
    #             if type(elem['innerText']) == str:
    #                 html += "<"+elem['tag']
    #                 for attribute in list(elem.keys()):
    #                     elem['innerText'] = self.replaceRepeatedSubstrings(elem['innerText'], "**", "<strong>", "</strong>")
                        
    #                     if attribute != 'innerText':
    #                         html += " "+attribute+"="+elem[attribute]
    #                 html += ">"+elem['innerText']+"</"+elem['tag']+">"

    #             if type(elem['innerText']) == list:
    #                 for li in elem['innerText']:
    #                     li['innerText'] = self.replaceRepeatedSubstrings(li['innerText'], "**", "<strong>", "</strong>")

    #                     html += "<"+li['tag']+">"+li['innerText']+"</"+li['tag']+">"
    #         else:
    #             html += "<"+elem['tag']
    #             for attribute in list(elem.keys()):
    #                 if attribute == 'data-value' and 'value' not in list(elem.keys()):
    #                     html += ' value='+elem[attribute]
    #                 if attribute != 'innerText':
    #                     html += " "+attribute+"="+elem[attribute]
    #             html += "></"+elem['tag']+">"
    #     return html, jsonContent
    
    def jsonToHTML(self, jsonContent):
        """  """
        html = ""
        if (type(jsonContent) == str):
            try:
                jsonContent = json.loads(jsonContent.encode('utf-8'))
            except Exception as e :
                try:
                    jsonContent = json5.loads(jsonContent)
                except Exception as e :
                    print("error occured:", e)
                    return None, None
        if jsonContent != None:
            print("type jsonContent", type(jsonContent))
            if type(jsonContent) != list:
                keys = list(jsonContent.keys())
                print("keys", keys)
                if 'html' in keys:
                    html = jsonContent["html"]
                    return html, jsonContent
                if "tags" in keys:
                    jsonContent = jsonContent["tags"]
                
            #print(jsonContent)
            for elem in jsonContent: 
                #print(elem)
                # print(elem['tag'], elem['innerText'], type(elem['innerText']))
                html += self.convert(elem)
        return html, jsonContent
    
    def convert(self, elem, html=""):
        #print("elem:", elem, type(elem))
        if type(elem) == str:
            elem = json5.loads(elem)
        if type(elem) == dict:
            if "innerText" in elem.keys():
                if type(elem['innerText']) == str:
                    html += "<"+elem['tag']
                    for attribute in list(elem.keys()):
                        elem['innerText'] = self.replaceRepeatedSubstrings(elem['innerText'], "**", "<strong>", "</strong>")
                        #print("attribute1", attribute, type(attribute))
                        if attribute != 'innerText' and attribute != "tag" and attribute != None and elem[attribute] != None:
                            html += " "+attribute+"="+elem[attribute]
                    html += ">"+elem['innerText']+"</"+elem['tag']+">"
                elif type(elem['innerText']) == list:
                    for subElem in elem['innerText']:
                        html += self.convert(subElem)
                elif type(elem['innerText']) == dict:
                    html += self.convert(elem['innerText'])
            else:
                html += "<"+elem['tag']
                for attribute in list(elem.keys()):
                    #if attribute == 'data-value' and 'value' not in list(elem.keys()) and elem[attribute] != "":
                    #    html += ' value='+elem[attribute]
                    #print("attribute2", attribute, type(attribute))
                    if attribute != 'innerText' and attribute != "tag" and attribute != None and elem[attribute] != None:
                        html += " "+attribute+"="+elem[attribute]
                html += "></"+elem['tag']+">"
                
        return html
    
