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

class MusicSymbols(models.Model):
    symbol = models.CharField(max_length=30)
    symbolName = models.CharField(max_length=30)
    uniCodeHex = models.CharField(max_length=30)
    htmlCode = models.CharField(max_length=30)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class GeneratedMusic(models.Model) :
    
    admin = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='admin_profile', on_delete=models.CASCADE, null=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='user_profile', on_delete=models.CASCADE, null=True)
    title = models.CharField(max_length=30, null=True, verbose_name="My song title")
    jsonContents= models.TextField(null=True, blank=True, verbose_name="Generated Json")
    style = models.CharField(max_length=30, verbose_name="Style")

    key = models.CharField(max_length=30, verbose_name="Key")
    tempo = models.IntegerField(verbose_name="Tempo")
    timeSignature = models.CharField(max_length=10, verbose_name="Time Signature")
    feel = models.CharField(max_length=512, verbose_name="Music Feels")
    instruments = models.CharField(max_length=512, verbose_name="Instruments", null=True)
    drums = models.CharField(max_length=512, verbose_name="Drums", null=True)
    rhythm = models.CharField(max_length=30, verbose_name="Rhythm", default="Medium")
    maxOffset = models.DecimalField(max_digits=7, decimal_places=3, default=180.00) # in seconds
    fullDurationInSeconds = models.DecimalField(max_digits=7, decimal_places=2, verbose_name="Time in seconds (example 60)", default=180.00)#

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__ (self):
        return f"{self.title}"
    
    class Meta:
        ordering = ["-id"]


class GeneratedInstruments(models.Model) : # instruments tagged along with the generated music
    instrumentID = models.ForeignKey("Intstrument", on_delete=models.CASCADE)
    generatedMusicID = models.ForeignKey("GeneratedMusic", on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)