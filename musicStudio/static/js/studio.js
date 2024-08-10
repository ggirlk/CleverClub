window.onload = () => {
    const generateBtn = document.getElementById("generate");
    const playBtn = document.getElementById("play");
    const loopBtn = document.getElementById("play-loop");
    const stopBtn = document.getElementById("stop");
    const musicList = document.getElementById("select-tone");
    const loading = document.getElementById("loading-song");
    
    const timelineContainer = document.getElementById('timeline-container');
    let playhead = document.getElementById('playhead');
    //const timeScaleFactor = 0.5; // 
    let playheadInterval;
    let playInterval;
    let totalDuration = 0;
    let currentAudioCtxt;
    
    let getJsonData;

    generateBtn.addEventListener('click', function (e) {
        this.setAttribute('disabled', true)
        console.log("I'm generate!");
        e.preventDefault();
        generateSound(this.getAttribute("data-url"));
    });

    playBtn.addEventListener('click', async () => {
        const jsonData = getJsonData
        //console.log("this 1", jsonData);
        //console.log("this 2", getJsonData);
        if (jsonData != undefined) {
            if (jsonData.error != false) {
                console.log(jsonData);
                StartPlay("", jsonData);
            }
            else
                swal(jsonData.error);
        }
        else
            swal("", "You have to generate a song first!", "error");

    });
    let stopLoop = false
    loopBtn.addEventListener('click', async () => {
        const jsonData = getJsonData
        //console.log("this 1", jsonData);
        //console.log("this 2", getJsonData);
        if (jsonData != undefined) {
            if (jsonData.error != false) {
                stopLoop = false
                let loop = setInterval(function () {
                    // playhead = document.getElementById('playhead');
                    // playhead.style.left = '0';
                    if (stopLoop == true) {clearInterval(loop)}
                    if (stopLoop == false) { StartPlay("", jsonData)};

                }, totalDuration-20)
                console.log(jsonData);
            }
            else
                swal(jsonData.error);
        }
        else
            swal("An Error has occured!");

    });

    stopBtn.addEventListener('click', () => {
        stopMusic();
    });
    async function DrawSelected()  {
        const selectedTone = document.getElementById('select-tone');
        const selectedIndex = selectedTone.options.selectedIndex;

        try {
            const url = selectedTone.options[selectedIndex].getAttribute('data-url');
            console.log("this 1", url);
        
            getJsonData = await getGenerated(url);

            
            // console.log("this 1", jsonData);
            //console.log("this getJsonData", typeof(getJsonData), getJsonData);
            if (getJsonData != undefined) {
                if (getJsonData.error != false) {
                    createTimeline(getJsonData);
                }
                else
                    swal(getJsonData.error);
            }
            else
                swal("An Error has occured!");
            
        } catch (e) {
            swal("Welcome to the music generator, have fun!!");

        }

    }
    DrawSelected()
    musicList.addEventListener("change", DrawSelected)

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
        "ElectricGuitar": _tone_0270_FluidR3_GM_sf2_file,
        //jazz
        "ElectricJazzGuitar": _tone_0260_FluidR3_GM_sf2_file, // _tone_0270_FluidR3_GM_sf2_file,
        "JazzBassGuitar": _tone_0260_FluidR3_GM_sf2_file, // _tone_0270_FluidR3_GM_sf2_file,

        // Acoustic
        "AcousticGuitar": _tone_0270_FluidR3_GM_sf2_file,
        // Organ
        "Organ": _tone_0160_FluidR3_GM_sf2_file,
        // violin
        "Violin": _tone_0401_Aspirin_sf2_file, // _tone_0400_FluidR3_GM_sf2_file  

        // violin
        "Viola": _tone_0410_Aspirin_sf2_file, // _tone_0270_FluidR3_GM_sf2_file,// 

        // Harp
        "Harp": _tone_0460_Aspirin_sf2_file, // _tone_0270_FluidR3_GM_sf2_file,// 

        // Cello
        "Cello": _tone_0420_Aspirin_sf2_file, // _tone_0270_FluidR3_GM_sf2_file,//

        // Contrabass
        "Contrabass": _tone_0430_Aspirin_sf2_file,
        //
        "Piano": _tone_0000_Aspirin_sf2_file,
        //
        "Saxophone": _tone_0670_FluidR3_GM_sf2_file, // _tone_0670_Aspirin_sf2_file, // Baritone

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
    };

    const lenInstruments = Object.keys(allInstruments).length;

    var Players = {}, allGains = {};
    Players["player"] = new WebAudioFontPlayer();

    function loadAndMakeAudioNodes(audioContext) {

        for (let i = 0; i < lenInstruments; i++) {
            const instrumentName = Object.keys(allInstruments)[i];
            const instFile = allInstruments[instrumentName];
            const varToStr = Object.keys({ instFile })[0];
            Players["player"].loader.decodeAfterLoading(audioContext, varToStr);

            allGains[instrumentName] = audioContext.createGain();
            allGains[instrumentName].connect(audioContext.destination);
        }
        //return allGains
    }

    console.log(Players);
    

    function updatePlayhead(currentTime) {
        playhead = document.getElementById('playhead'); // 
        const playheadPosition = ((currentTime)/(totalDuration)) * 100
        //console.log("playheadPosition", playheadPosition)
        playhead.style.left = `${playheadPosition}%`;
    }

    function stopMusic() {
        stopLoop = true // Stop loop
        clearInterval(playheadInterval); // Stop the playhead animation
        clearInterval(playInterval); // Stop the player
        playhead = document.getElementById('playhead');
        playhead.style.left = '0'; // Reset playhead position
        Players["player"].cancelQueue(currentAudioCtxt); // remove tones from player queue
    }

    function createTimeline(musicData) {
        console.log("I am createTimeline")
        let container = document.getElementById('timeline-container');
        container.innerHTML = '<div id="playhead"></div>';
        for (const part in musicData) {
            for (const instrument in musicData[part]) {
                if (instrument in allInstruments) {
                    if (musicData[part][instrument].length != 0) {
                        musicData[part][instrument].forEach(noteData => {
                            const endTime = noteData.offset * 1000 + noteData.duration;
                            if (endTime > totalDuration) {
                                totalDuration = endTime;
                            }
                        })
                    }
                }
                
            }
        }
        for (const part in musicData) {
            for (const instrument in musicData[part]) {
                if (instrument in allInstruments) {
                    if (musicData[part][instrument].length != 0) {
                        const track = document.createElement('div');
                        track.innerHTML = "<span class='instrument-name'>" + instrument + "</span>";

                        track.classList.add('track');
                        timelineContainer.appendChild(track);

                        const instr = document.createElement('div');
                        instr.innerText = instrument;
                        musicData[part][instrument].forEach(noteData => {
                            const note = document.createElement('div');
                            note.innerHTML = `<span class="tone-span">${noteData.tone}</span>`
                            note.classList.add('note');
                            //note.style.left = (noteData.offset * 100 * timeScaleFactor) + 'px'; // Position the note
                            note.style.left = (noteData.offset*1000/totalDuration * 100 ) + '%'; // Position the note
                            note.style.width = (noteData.duration /1000) *100 + '%'; // Set note width
                            // console.log(instrument, musicData[part][instrument].length, noteData.pitch)
                            if (noteData.pitch != "0") {
                                note.style.background = "radial-gradient(circle, rgba(251,153,137,1) 0%, rgba(137,105,255,1) 100%)"; //"rgb(112, 151, 244)"
                            }
                            track.appendChild(note);

                            
                    
                        });
                    }
                }
            }
        }
        
    }

    function moveHead(audioContext) {
        //console.log("I'm moving")
        
        // animation: playhead-animation 12s linear infinite

        //audioContext.resume()
        playheadInterval = setInterval(() => {
             // Time in milliseconds
            //console.log("I'm moving inside")
            const currentTime = currentAudioCtxt.currentTime * 1000;

            // Update the playhead position
            updatePlayhead(currentTime);
            // console.log(currentTime, totalDuration)

            // Check if the music has reached the end
            if (currentTime == undefined || currentTime >= totalDuration) {
                clearInterval(playheadInterval)
                playhead = document.getElementById('playhead');
                playhead.style.left = '0';
            }
        }, 20); // Update every 20ms 
    }

    function fetchJob(job) {
        //job = data["job"];
        if (job != false) {
            let helper = document.getElementById('helper').getAttribute('href');
            const checkJob = setInterval(() => {
                jobpath = helper.replace(":job", job);
                fetch(jobpath)
                    .then(response => response.json())
                    .then(data => {
                    
                        if (data.error != false) {
                            if (data.job.is_finished == true) {
                                console.log("the result", data.result);
                                loading.style.display = "none"
                                this.setAttribute('disabled', false)

                                clearInterval(checkJob)

                                //if (job.result != null) {
                                    //if (job.result.error == false) {
                                try {
                                        getJsonData = JSON.parse(data.result.jsonContents)
                                        let newOption = document.createElement("option");
                                        newOption.text = data.result.title;
                                        newOption.value = data.result.id;
                                        
                                        newOption.setAttribute("data-url", `studio/getSelectedTones/${data.result.id}`);
                                        console.log("newOption", newOption)
                                        // Add the new option to the select list
                                        musicList.add(newOption);
                                        
                                        // Set the new option as selected
                                        musicList.value = data.result.id;
                                        createTimeline(getJsonData);
                                        //if (getJsonData == data.result) {clearInterval(checkJob)}
                                        swal("Done", "Your song is ready!", "success")
                                    // } else {
                                    //     console.log("null result"); 
                                    //     swal("Something went wrong!")
                                    // }
                                } catch (e) {
                                    clearInterval(checkJob)
                                    swal("Oops!", "Something went wrong!", "error")
                                }
                            } else {
                                loading.style.display = "block"
                                console.log("still waiting"); 
                            } 
                        } else {
                            loading.style.display = "none"
                            this.setAttribute('disabled', false)
                            clearInterval(checkJob)
                            swal("Error!", "There was an error!!", "error")
                            console.log(data.error);
                        }
                    });
            }, 1000);
        }

    }
    fetchJob(false)
    function generateSound(path) {

        const formData = $('#generate-form').serialize()
        
        console.log(formData);

        $.getJSON({
            url: path,
            method: "POST",
            data: formData,
            dataType: "json",
            success: function (data) {
                console.log(data);
                if (data != undefined && data["success"] == true) {
                    loading.style.display = "block"
                    console.log("generating process started");
                    job = data["job"];
                    fetchJob(job)
                }

                console.log(data);
            },
            error: function (x) {
                loading.style.display = "none"
                swal('Oops! an error has occured')
                console.log("error", x);

            }
        });
    }
    async function getGenerated(jsonPath = "") {

        console.log("I am getGenerated");

       try {
            const response = await fetch(jsonPath);
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            const data_1 = await response.json();
            console.log(data_1);
            if (typeof(data_1['selected']) == "string") {
                return JSON.parse(data_1['selected'])
            }
            return data_1['selected'];
        } catch (error) {
            return console.error('There was a problem with the fetch operation:', error);
        }
    }
    async function StartPlay(jsonPath = "", jsonData = "") {
        console.log("i confirm the click");
        var AudioContextFunc = window.AudioContext || window.webkitAudioContext;
        var audioContext = new AudioContextFunc();
        currentAudioCtxt = audioContext // for the stop funtion
        await loadAndMakeAudioNodes(audioContext);

        if (jsonData != "") {
            if (typeof (jsonData) == "string") {
                jsonData = JSON.parse(jsonData);
            }
            moveHead(audioContext);
            // createTimeline(jsonData);
            playPiece(jsonData, audioContext);
        }

    }

    async function playPiece(Notes, audioContext) {
  
        const lenParts = Object.keys(Notes).length;
        const currentTime = audioContext.currentTime;
        for (let i = 0; i < lenParts; i++) {

            const part = Object.keys(Notes)[i];
            const lenInstruments = Object.keys(Notes[part]).length;
            for (let j = 0; j < lenInstruments; j++) {
                const instrumentName = Object.keys(Notes[part])[j];
                if (instrumentName in allInstruments) {
                    const notesPerInstr = Notes[part][instrumentName];
                    //if (instrumentName == "BassDrum")
                    console.log("part", part, instrumentName)
                    await playNotes(notesPerInstr, instrumentName, audioContext, currentTime);
                }
               
            }
        }
    }

    async function playNotes(Notes, instrumentName, audioContext, currentTime) {
        audioContext.resume();

        const lenNotes = Object.keys(Notes).length;

        const gainNode = await allGains[instrumentName];

        const toneFile = await allInstruments[instrumentName];
        var i = 0;

        console.log(Notes);
        playInterval = setInterval(async function () {

            const note = Notes[i];
            if (note != undefined) {
                console.log(note);
                const pitch = note.pitch;
                let startTime = currentTime + note.offset;
                //if (instrumentName == "BassDrum" || instrumentName == "ElectricGuitar" ) {startTime = startTime/1.5}
                const duration = note.duration / 1000;
                //console.log("currentTime + offset", startTime, "pitch", pitch, "instrumentName", instrumentName);
                playNote(audioContext, gainNode, toneFile, startTime, pitch, duration);
                
            }
            if (i >= lenNotes) {
                
                clearInterval(playInterval);
            }
            i++;
        }, 50); //}
    }
    function playNote(audioContext, gainNode, tonefilePreset, startTime, pitch, duration) {
        Players["player"].queueWaveTable(audioContext, gainNode, tonefilePreset, startTime, pitch, duration);
    }
    //console.log(window["BassDrum"])
    //console.log("len", ) 
}
