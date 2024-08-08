from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse

import pathlib
import textwrap

import google.generativeai as genai

from IPython.display import display
from IPython.display import Markdown

import json

from dotenv import load_dotenv
# from cleverClub.utils import GenerateAnything

from .models import *
from .forms import GenerateMusicForm
#from django.conf.urls.static import static

import os

from django.contrib.auth.decorators import login_required
import time
from .tasks import generate_tones
from django_rq import get_queue


staticDir = os.path.join(os.path.dirname(__file__), 'static')

def create_music(request):
    if request.method == 'GET':
        prompt_data = 'A catchy tune!'  # Get prompt data from the request
        queue = get_queue('default')  # Get the default queue
        job = queue.enqueue(generate_tones, prompt_data)
        return redirect('musicStudio:task_status', job_id=job.id)

def task_status(request, job_id):
    queue = get_queue('default')
    job = queue.fetch_job(job_id)
    result = job.result if job.is_finished else None

    context = {
        'job': job,
        'result': result, 
    }
    return render(request, 'task_status.html', context)

def get_task_status(request, job_id):
    queue = get_queue('default')
    job = queue.fetch_job(job_id)
    if job != None:
        result = job.result if job.is_finished else None

        context = {
            'job': {
                'id': job.id,
                'is_finished': job.is_finished,
            },
            'result': result, 
        }
        return JsonResponse(context)
    else:
        return JsonResponse({"error": "None job"})

def getSelectedTones(request, generated_id):
    
    getGenerated = GeneratedMusic.objects.get(id=generated_id, user_id=request.user.id).jsonContents
 
    return JsonResponse({"selected": json.loads(getGenerated), 'error': False})
  
def generateMusic(request):
   
    if request.method == 'POST':
        form = GenerateMusicForm(request.POST)
        print(form)
        if form.is_valid():

            queue = get_queue('default')  # Get the default queue

            args = {
                "user_id": request.user.id,
                "admin_id": "NULL",
                "title": form.cleaned_data['title'],
                'style': form.cleaned_data['style'],
                'key': form.cleaned_data['key'], 
                'tempo': form.cleaned_data['tempo'], 
                'timeSignature': form.cleaned_data['timeSignature'], 
                'feel': form.cleaned_data['feel'], 
                'rhythm': form.cleaned_data['rhythm'],
                'instruments': form.cleaned_data['instruments'],
                'drums': form.cleaned_data['drums'],
            }
            if request.user.is_staff:
                args['admin_id'] = request.user.id
            print(args)
            #exit(0)
            job = queue.enqueue(generate_tones, args, result_ttl=3600)

            return JsonResponse({'success': True, "job":job.id}, safe=False)
            #return JsonResponse({'success': True, "job":False}, safe=False)
        else:
            print(form.errors)
            return JsonResponse({'success': False, 'errors': "Invalid form bad request!"})

    else:
        return JsonResponse({'success': False, 'errors': "Method not allowed!"})
  

def getLatestGenerated(request):
    user = request.user
    latest = GeneratedMusic.objects.filter(userID=user.id).order_by('-id').first()
    return JsonResponse({"data":latest.jsonContents}, safe=False)





def to_markdown(text):
  text = text.replace('•', '  *')
  return Markdown(textwrap.indent(text, '> ', predicate=lambda _: True))

def studio(request):
    generateForm = GenerateMusicForm()
    allGenerated = GeneratedMusic.objects.all().filter(user_id=request.user.id).values('id', 'title')
    return render(request, 'studio.html', {"generater": generateForm, 'allGenerated': allGenerated})

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
