import time
import logging
from cleverClub.utils import GenerateAnything
# from .forms import GenerateMusicForm
from .models import *
from .forms import *
import json
from django_rq import job

# @job
# def generate_music0(prompt_data="success"):
#     # ... your music generation logic using prompt_data ...

#     # You can access Django models here if needed:
#     # from myapp.models import MyModel 

#     print("Generating music with prompt:", prompt_data)

#     time.sleep(20)

#     print("20 seconds has passed")

#     return "Music generated for: {}".format(prompt_data)

@job
def generate_tones(args): 

    # user = args['user']
    print("Generating ...")
    try:
        musicmodel = GeneratedMusic()

        musicmodel.title = args['title']
        musicmodel.style = args['style']
        musicmodel.key = args['key']
        musicmodel.tempo = args['tempo']
        musicmodel.timeSignature = args['timeSignature']
        musicmodel.feel = args['feel']
        musicmodel.rhythm = args['rhythm']
        musicmodel.user_id = args['user_id']
        musicmodel.admin_id = args['admin_id']

        gem = GenerateAnything()
        prompt = gem.getPrompt(musicmodel, "Music", args['instruments'], args['drums'])
        #print(prompt)
        jsonContents = gem.callgemini(prompt)

        print(jsonContents)
        musicmodel.jsonContents = json.dumps(jsonContents)
        musicmodel.save()

        print("generation done")

        result = {"jsonContents": jsonContents, 'id': musicmodel.id, "title": musicmodel.title, "error": False}
        print(result)
        return result 
    
    except Exception as e:
        print("got error", e)
        result = {"error": e.__traceback__}
        return result 
    

