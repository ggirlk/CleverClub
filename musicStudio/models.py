from django.db import models
from django.conf import settings


class Studio(models.Model):

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class Intstrument(models.Model):
    channelID = models.IntegerField()
    fullName = models.CharField(max_length=30)
    jsonName = models.CharField(max_length=30)
    types = models.CharField(max_length=30, choices=enumerate(["instruments", "drums"]))
    variable = models.CharField(max_length=30)
    link = models.CharField(max_length=200)

class MusicSymbols(models.Model) :
    symbol = models.CharField(max_length=30)
    symbolName = models.CharField(max_length=30)
    uniCodeHex = models.CharField(max_length=30)
    htmlCode = models.CharField(max_length=30)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class GeneratedMusic(models.Model) :
    adminID = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='admin_profile', on_delete=models.CASCADE)
    userID = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='user_profile', on_delete=models.CASCADE)

    jsonFilePath = models.CharField(max_length=100)
    style = models.CharField(max_length=30)
    key = models.CharField(max_length=30)
    tempo = models.IntegerField()
    timeSignature = models.CharField(max_length=10)
    feel = models.CharField(max_length=100)
    rythm = models.CharField(max_length=30)
    maxOffset = models.DecimalField(max_digits=5, decimal_places=3) # in seconds
    fullDurationInSeconds = models.DecimalField(max_digits=5, decimal_places=2)#

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class GeneratedInstruments(models.Model) : # instruments tagged along with the generated music
    instrumentID = models.ForeignKey("Intstrument", on_delete=models.CASCADE)
    generatedMusicID = models.ForeignKey("GeneratedMusic", on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)