from django import forms
from .models import GeneratedMusic

FEELS = (
    ("Straight","Straight"),
    ("Swing","Swing"),
    ("Shuffle","Shuffle"),
    ("Syncopated","Syncopated"),
    ("Groovy","Groovy"),
    ("Laid-back","Laid-back"),
    ("Energetic","Energetic"),
    ("Driving","Driving"),
    ("Happy","Happy"),
    ("Sad","Sad"),
    ("Melodic","Melodic"),
    ("Aggressive","Aggressive"),
    ("Atmospheric","Atmospheric"),
)
KEYS = ( 
        ("C", "C"),
        ("G", "G"),
        ("D", "D"),
        ("A", "A"),
        ("E", "E"),
        ("B", "B"),
        ("F#", "F#"),
        ("C#", "C#"),
        ("Ab", "Ab"),
        ("Eb", "Eb"),
        ("Bb", "Bb"),
        ("F", "F"),
        ("Aminor", "A minor"),
        ("Eminor", "E minor"),
        ("Bminor", "B minor"),
        ("F#minor", "F# minor"),
        ("F#minor", "F# minor"),
        ("C#minor", "C# minor"), 
        ("G#minor", "G# minor"),
        ("D#minor", "D# minor"),
        ("A#minor", "A# minor"),
        ("Dminor", "D minor"),
        ("Gminor", "G minor"),
        ("Cminor", "C minor"),
        ("Fminor", "F minor"),
    )

TIME_SIGNATURES = (
    ("4/4","4/4 (common time)"),
    ("3/4","3/4 (waltz time)"),
    ("2/4","2/4 (march time)"),
    ("6/8","6/8 (compound duple)"),
    ("9/8","9/8 (compound triple)"),
    ("12/8","12/8 (blues shuffle)"),
)

STYLES = (
    ("Classical", "Classical"),
    ("Jazz", "Jazz"),
    ("Rock", "Rock"),
    ("Pop", "Pop"),
    ("Electronic", "Electronic"),
    ("Folk", "Folk"),
    ("Blues", "Blues"),
    ("Country", "Country"),
    ("Hip-hop", "Hip-hop"),
    ("Metal", "Metal"),
)
RHYTHMS = (
    ("Slow", "Slow"),
    ("Medium", "Medium"),
    ("Fast", "Fast"),
    ("Simple", "Simple"),
    ("Complex", "Complex"),
    ("Syncopated", "Syncopated"),
    ("Polyrhythmic", "Polyrhythmic"),
)

INSTRUMENTS = (
        ("BassGuitar", "Bass Guitar"),
        ("ElectricGuitar", "Electric Guitar"),
        ("ElectricJazzGuitar", "Electric Jazz Guitar"),
        ("JazzBassGuitar", "Jazz Bass Guitar"),
        ("AcousticGuitar", "Acoustic Guitar"),
        ("Organ", "Organ"),
        ("Violin", "Violin"),
        ("Viola", "Viola"),
        ("Harp", "Harp"),
        ("Cello", "Cello"),
        ("Contrabass", "Contrabass"),
        ("Piano", "Piano"),
        ("Saxophone", "Saxophone"),
        ("LeadSynth", "Lead Synth"),
        ("BassSynth", "Bass Synth"),
        ("PadSynth", "Pad Synth"),
        ("AcousticBass", "Acoustic Bass"),
        ("ElectricOrgan", "Electric Organ"),
        ("Trumpet", "Trumpet"),
        ("AltoSaxophone", "AltoSaxophone"),
        ("Trombone", "Trombone"),
        ("Glockenspiel", "Glockenspiel"),
    )

DRUMS = (
    ("BassDrum", "Bass Drum"),
    ("SnareDrum", "Snare Drum"),
    ("RideCymbal", "Ride Cymbal"),
    ("HighTom1", "High Tom 1"),
    ("MidTom1", "Mid Tom 1"),
    ("LowTom2", "Low Tom 2"),
    ("HihatOpen", "Hihat Open"),
    ("HihatClosed", "Hihat Closed"),
    ("Clap", "Clap"),
)

class GenerateMusicForm(forms.ModelForm):
    key = forms.ChoiceField(choices=KEYS, label="Key")
    style = forms.ChoiceField(choices=STYLES, label="Style")
    tempo = forms.IntegerField(label="Tempo", widget=forms.TextInput(attrs={'placeholder': 'number between 40 and 200', 'value': 124}))
    timeSignature = forms.ChoiceField(choices=TIME_SIGNATURES, label="Time Signature")
    
    feel = forms.MultipleChoiceField(choices=FEELS, widget=forms.CheckboxSelectMultiple)
    #help(forms.MultipleChoiceField)
    instruments = forms.MultipleChoiceField(choices=INSTRUMENTS, widget=forms.CheckboxSelectMultiple, required=False )
    drums = forms.MultipleChoiceField(choices=DRUMS, widget=forms.CheckboxSelectMultiple, required=False)
    rhythm = forms.ChoiceField(choices=RHYTHMS, label="Rhythm", initial="Medium")

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
        if self.instance and self.instance.pk:
            self.fields['feel'].initial = self.instance.feel.split(',')
            self.fields['instruments'].initial = self.instance.instruments.split(',') if self.instance.instruments != None else ""
            self.fields['drums'].initial = self.instance.drums.split(',') if self.instance.drums != None else ""


    def clean_feel(self):
        feel = self.cleaned_data['feel']
        return ','.join(feel)
    
    def clean_instruments(self):
        instruments = self.cleaned_data['instruments']
        return ','.join(instruments)

    def clean_drums(self):
        drums = self.cleaned_data['drums']
        return ','.join(drums)
    
    class Meta:
        model = GeneratedMusic

        fields = ["title", 'style', 'key', 'tempo', 'timeSignature',  'rhythm', 'feel']

