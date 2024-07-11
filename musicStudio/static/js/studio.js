window.onload = function() {
const bodyc = document.getElementById("bodyc")

const generateBtn = document.getElementById("generate")
const playBtn = document.getElementById("play")
const stopBtn = document.getElementById("stop")

generateBtn.addEventListener('click', function() {
    generateSound(this.getAttribute("data-url"))
});

playBtn.addEventListener('click', function() {
    StartPlay("static/jsonfiles/unknown.json", "")
});

stopBtn.addEventListener('click', function() {
    stop()
});

const allInstruments = {
    //Drums
    "BassDrum": _drum_35_17_JCLive_sf2_file,
    "SnareDrum": _drum_40_1_JCLive_sf2_file,
    //"HiHat": _drum_42_1_JCLive_sf2_file,
    "RideCymbal": _drum_51_1_JCLive_sf2_file,
    "HighTom1": _drum_50_1_JCLive_sf2_file,
    "MidTom1": _drum_48_1_JCLive_sf2_file,
    "LowTom2": _drum_41_1_JCLive_sf2_file,
    "HihatOpen": _drum_46_0_SBLive_sf2, 
    "HihatClosed": _drum_42_0_SBLive_sf2,
    "Clap": _drum_39_0_SBLive_sf2,

    // Bass (finguer)
    "BassGuitar": _tone_0360_FluidR3_GM_sf2_file,
    // Electric
    "ElectricGuitar":  _tone_0270_FluidR3_GM_sf2_file,
    //jazz
    "ElectricJazzGuitar": _tone_0260_FluidR3_GM_sf2_file,// _tone_0270_FluidR3_GM_sf2_file,
    "JazzBassGuitar": _tone_0260_FluidR3_GM_sf2_file,// _tone_0270_FluidR3_GM_sf2_file,
    // Acoustic
    "AcousticGuitar": _tone_0270_FluidR3_GM_sf2_file,
    // Organ
    "Organ": _tone_0160_FluidR3_GM_sf2_file,
    // violin
    "Violin": _tone_0401_Aspirin_sf2_file,// _tone_0400_FluidR3_GM_sf2_file  
    // violin
    "Viola": _tone_0410_Aspirin_sf2_file, // _tone_0270_FluidR3_GM_sf2_file,// 
    // Harp
    "Harp":_tone_0460_Aspirin_sf2_file, // _tone_0270_FluidR3_GM_sf2_file,// 
    // Cello
    "Cello": _tone_0420_Aspirin_sf2_file, // _tone_0270_FluidR3_GM_sf2_file,//
    // Contrabass
    "Contrabass": _tone_0430_Aspirin_sf2_file,
    //
    "Piano": _tone_0000_Aspirin_sf2_file,
    //
    "Saxophone": _tone_0670_FluidR3_GM_sf2_file,// _tone_0670_Aspirin_sf2_file, // Baritone
    //LeadSynth
    "LeadSynth": _tone_0870_Aspirin_sf2_file,
    // same as bass for the moment
    "BassSynth": _tone_0380_FluidR3_GM_sf2_file,

    "PadSynth": _tone_0910_Aspirin_sf2_file,
    
    "AcousticBass": _tone_0320_Aspirin_sf2_file,
    "ElectricOrgan": _tone_0180_Aspirin_sf2_file,
    "Trumpet": _tone_0560_Aspirin_sf2_file,
    "AltoSaxophone": _tone_0650_Aspirin_sf2_file,
    "Trombone": _tone_0570_Aspirin_sf2_file,
    "Glockenspiel": _tone_0090_Aspirin_sf2_file,
    
}

const lenInstruments = Object.keys(allInstruments).length

var Players = {}, allGains = {}
Players["player"] = new WebAudioFontPlayer();

function loadAndMakeAudioNodes (audioContext) {
    
    for (let i = 0; i < lenInstruments; i++) {
        const instrumentName = Object.keys(allInstruments)[i]
        const instFile = allInstruments[instrumentName]
        const varToStr = Object.keys({instFile})[0]
        Players["player"].loader.decodeAfterLoading(audioContext, varToStr);

        allGains[instrumentName] = audioContext.createGain();
        allGains[instrumentName].connect(audioContext.destination)
    }
    //return allGains
}

console.log(Players)

async function generateSound(path) {
    
    //StartPlay("static/jsonfiles/gematrial.json", "", audioContext)
    timer = 0
    step = 2000
    max = step * 5
    // var loop = setInterval(function () {
    //     StartPlay("static/jsonfiles/gematrial.json", "")
    //     timer += step 
    //     if (timer >= max) {
    //         clearInterval(loop)
    //     }
    // }, step )
    
    //*
    $.getJSON({
        url: path,
        success: function ( data ) {
            console.log(data)
            if (data != undefined) {
                //gemResp = data["data"]
                if (data["data"] != undefined && data["data"] != "") {
                    jsonPath = data["file"]
                    jsonData = data["data"]
                    StartPlay(jsonPath, jsonData)
                }
                
            }
            
            console.log(data)
            // should save to database
        }
    })
        // */

}

async function StartPlay(jsonPath, jsonData) {
    console.log("i confirm the click")
    
    var AudioContextFunc = window.AudioContext || window.webkitAudioContext;
    var audioContext = new AudioContextFunc();
    //audioContext.resume()
    
    loadAndMakeAudioNodes (audioContext)

    //await fetch("static/jsonfiles/trials/paganini.json")
    $.getJSON({
        url: jsonPath,// "static/jsonfiles/trials/caprice3.json",
        success:function ( data ) { 
            //console.log(data)
            if (typeof(data) == "string") {
                data = JSON.parse(data)
            }
            keys = Object.keys(data)
            // if (keys.length == 1 && keys[0]!="DrumsPart") {
            //     data = data[keys[0]]
            // }
            console.log(data)
            playPiece(data, audioContext)
       
        },
        error: function (e) {
            console.log("jsonPath load failed:", e.status)
            if (jsonData != "") {
                if (typeof(jsonData) == "string") {
                    jsonData = JSON.parse(jsonData)
                }
                playPiece(jsonData, audioContext)
            }
        }
    })

}

async function playPiece(Notes, audioContext) {
    //audioContext.resume()
   
    //const Notes = await fetchJSONData()
    console.log("Notes", Notes)
    const lenParts = Object.keys(Notes).length
    const currentTime = audioContext.currentTime
    for (let i = 0; i < lenParts; i++) {
    
        const part = Object.keys(Notes)[i];
        const lenInstruments = Object.keys(Notes[part]).length
        for (let j = 0; j < lenInstruments; j++) {
            const instrumentName = Object.keys(Notes[part])[j];
            const notesPerInstr = Notes[part][instrumentName]
            //if (instrumentName == "BassDrum")
            await playNotes(notesPerInstr, instrumentName, audioContext, currentTime)
        }
    }
}

async function playNotes(Notes, instrumentName, audioContext, currentTime) {
    audioContext.resume()
    
    const lenNotes = Object.keys(Notes).length

    const gainNode = await allGains[instrumentName]

    const toneFile = await allInstruments[instrumentName]
    var i = 0

    console.log(Notes)
    var playInterval = setInterval(async function () {

        const note = Notes[i]
        console.log(note)
        if (note != undefined) {
            const pitch = note.pitch
            let startTime = currentTime + note.offset
            //if (instrumentName == "BassDrum" || instrumentName == "ElectricGuitar" ) {startTime = startTime/1.5}
            const duration = note.duration/1000
            console.log("currentTime + offset", startTime, "pitch", pitch, "instrumentName", instrumentName)
            playNote(audioContext, gainNode, toneFile, startTime, pitch, duration)
            if (i >= lenNotes) {
                clearInterval(playInterval)
            }
        }
        i++
    }, 50)//}
}
function playNote(audioContext, gainNode, tonefilePreset, startTime, pitch, duration) {//, volume=0.9
    Players["player"].queueWaveTable(audioContext, gainNode, tonefilePreset, startTime, pitch, duration)
}
//console.log(window["BassDrum"])


//console.log("len", )


}
