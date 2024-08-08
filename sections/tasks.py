import time
import logging
from cleverClub.utils import GenerateAnything
# from .forms import GenerateMusicForm
from .models import *
import json
from django_rq import job


@job
def generate_contents(args): 

    # user = args['user']
    print("Generating ...")
    try:
        gem = GenerateAnything()
        html, jsonContent = None, None
        obj = args['obj']
        if args['generate'] == True:

            prompt = gem.getPrompt(obj, obj.contentType)
            
            jsonContent = gem.callgemini(prompt)

            print("generated json", type(jsonContent), jsonContent)

            html, jsonContent = gem.jsonToHTML(jsonContent)        
            
        else:
            html, jsonContent = gem.jsonToHTML(obj.json)
        print("jsonContent", jsonContent)
        print("html", html)
        if html == None and jsonContent == None:
            print("Oops an error has occured!") 
            result = {"error": "Oops an error has occured!"}
            return result 
        obj.json = json.dumps(jsonContent)
        obj.text = html
        obj.save() 

        result = {"jsonContent": jsonContent, 'id': obj.id, "title": obj.title, "error": False}
        print(result)
        return result 
    except Exception as e:
        print("got error", e)
        result = {"error": e.__traceback__}
        return result 
    

