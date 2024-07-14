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

    def callgemini(self, promptText, jsonResult=False): 
        load_dotenv()
        GOOGLE_API_KEY = os.getenv("GEMINI_API_KEY", default="")

        genai.configure(api_key=GOOGLE_API_KEY)

        model = genai.GenerativeModel('gemini-1.5-pro')
        if jsonResult:
            response = model.generate_content(promptText, generation_config={"response_mime_type": "application/json"})
        else:
            response = model.generate_content(promptText)
            
        print(response.text)
        

        return response.text

