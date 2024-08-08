// const audioContext = new (window.AudioContext || window.webkitAudioContext)();

const baseScallar = 440; //440 Hz A4 base == 69 midi pitch

const instrumentSamples = {
    Piano: new Tone.Player("/static/wavfiles/Ensoniq-VFX-SD-Classic-Piano-C2.wav").toDestination(),
    AcousticGuitar: new Tone.Player("/static/wavfiles/Alesis-Fusion-Steel-String-Guitar-C4.wav").toDestination(),
    AcousticBass: new Tone.Player("/static/wavfiles/Kawai-K1r-Acoustic-Bass-C2.wav").toDestination(),
    
    ElectricGuitar: new Tone.Player("/static/wavfiles/Kawai-K11-CleanGtr-C3.wav").toDestination(), // clean
    ElectricJazzGuitar: new Tone.Player("/static/wavfiles/Korg-01W-JazzGuitar-C4.wav").toDestination(),
    ElectricRockGuitar: new Tone.Player("/static/wavfiles/Korg-M3R-Rock-Mutes-C3.wav").toDestination(),
    
    BassGuitar: new Tone.Player("/static/wavfiles/Ensoniq-ESQ-1-Electric-Bass-C2.wav").toDestination(), 
    BassSlapMutedGuitar: new Tone.Player("/static/wavfiles/Muted-Bass-Slap.wav").toDestination(),
    BassSlapGuitar: new Tone.Player("/static/wavfiles/Roland-SC-88-Slap-Bass-C2.wav").toDestination(),

    Organ: new Tone.Player("/static/wavfiles/Kawai-K3-Organ-C2.wav").toDestination(),
    
    Violin: new Tone.Player("/static/wavfiles/20_Em_Violin_03_112_SP.wav").toDestination(),

    Viola: new Tone.Player("/static/wavfiles/Kawai-K5000W-Viola-C4.wav").toDestination(),

    Cello: new Tone.Player("/static/wavfiles/Kawai-K5000W-Cello-C2.wav").toDestination(),

    Harp: new Tone.Player("/static/wavfiles/Kawai-K11-Harp-C3.wav").toDestination(),

    Saxophone: new Tone.Player("/static/wavfiles/Ensoniq-SD-1-Saxophone-C5.wav").toDestination(),

    ElectricOrgan: new Tone.Player("/static/wavfiles/34_Gm_Organ_SP_222_09.wav").toDestination(),

    Trumpet: new Tone.Player("/static/wavfiles/Kawai-K5000W-Trumpet-C5.wav").toDestination(),
    AltoSaxophone: new Tone.Player("/static/wavfiles/Kawai-K5000W-Trombone-C4.wav").toDestination(),
    Trombone: new Tone.Player("/static/wavfiles/Kawai-K5000W-Trombone-C4.wav").toDestination(),
    Brass: new Tone.Player("/static/wavfiles/34_Fsharpm_Brass_SP_222_03.wav").toDestination(),

    LeadSynth: new Tone.Player("/static/wavfiles/Lead_11_46_A4_SP_414_SP.wav").toDestination(),    
    BassSynth: new Tone.Player("/static/wavfiles/Kawai-K5000W-SynBass4-C3.wav").toDestination(),
    PadSynth: new Tone.Player("/static/wavfiles/Cm_Pad_306_01.wav").toDestination(),

    // Drums
    BassDrum: new Tone.Player("/static/wavfiles/Bass-Drum-1.wav").toDestination(),
    KickDrum: new Tone.Player("/static/wavfiles/Bass-Drum-1.wav").toDestination(),
    SnareDrum: new Tone.Player("/static/wavfiles/Yamaha-DX7-Snare-Drum.wav").toDestination(),
    
    HitHat: new Tone.Player("/static/wavfiles/Yamaha-RM50-Pedal-Hi-Hat-1.wav").toDestination(), // pedal

    //OpenHat: new Tone.Player("/static/wavfiles/Ensoniq-SD-1-Saxophone-C5.wav").toDestination(),
    HihatOpen: new Tone.Player("/static/wavfiles/Yamaha-FS1r-Drum-Kit-1-Open-Hi-Hat.wav").toDestination(),
    HihatClosed: new Tone.Player("/static/wavfiles/Yamaha-FS1r-Drum-Kit-1-Closed-Hi-Hat.wav").toDestination(),
    Clap: new Tone.Player("/static/wavfiles/Korg-TR-Rack-Standard-Kit-Clap.wav").toDestination(),
    
    Glockenspiel: new Tone.Player("/static/wavfiles/E-Mu-Proteus-2-Glockenspiel-C4.wav").toDestination(), //
    PercussionAgogo: new Tone.Player("/static/wavfiles/Kawai-K5000W-Agogo-C6.wav").toDestination(),
};

async function loadSample(url, audioContext) {
    const response = await fetch(url);
    const arrayBuffer = await response.arrayBuffer();
        return await audioContext.decodeAudioData(arrayBuffer);
}

function midiToFrequency(midiNote) {
    return 440 * Math.pow(2, (midiNote - 69) / 12);
}

async function loadAll (audioContext) {
    const instrumentSamples = {
        Piano: await loadSample("/static/wavfiles/Ensoniq-VFX-SD-Classic-Piano-C2.wav", audioContext),
        AcousticGuitar: await loadSample("/static/wavfiles/Alesis-Fusion-Steel-String-Guitar-C4.wav", audioContext),
        AcousticBass: await loadSample("/static/wavfiles/Kawai-K1r-Acoustic-Bass-C2.wav", audioContext),
        
        ElectricGuitar: await loadSample("/static/wavfiles/Kawai-K11-CleanGtr-C3.wav", audioContext), // clean
        ElectricJazzGuitar: await loadSample("/static/wavfiles/Korg-01W-JazzGuitar-C4.wav", audioContext),
        ElectricRockGuitar: await loadSample("/static/wavfiles/Korg-M3R-Rock-Mutes-C3.wav", audioContext),
        
        BassGuitar: await loadSample("/static/wavfiles/Ensoniq-ESQ-1-Electric-Bass-C2.wav", audioContext), 
        BassSlapMutedGuitar: await loadSample("/static/wavfiles/Muted-Bass-Slap.wav", audioContext),
        BassSlapGuitar: await loadSample("/static/wavfiles/Roland-SC-88-Slap-Bass-C2.wav", audioContext),

        Organ: await loadSample("/static/wavfiles/Kawai-K3-Organ-C2.wav", audioContext),
        
        Violin: await loadSample("/static/wavfiles/120_Gm_VlnRhythm_05_235_SP.wav", audioContext),

        Viola: await loadSample("/static/wavfiles/Kawai-K5000W-Viola-C4.wav", audioContext),

        Cello: await loadSample("/static/wavfiles/Kawai-K5000W-Cello-C2.wav", audioContext),

        Harp: await loadSample("/static/wavfiles/Kawai-K11-Harp-C3.wav", audioContext),

        Saxophone: await loadSample("/static/wavfiles/Ensoniq-SD-1-Saxophone-C5.wav", audioContext),

        ElectricOrgan: await loadSample("/static/wavfiles/34_Gm_Organ_SP_222_09.wav", audioContext),

        Trumpet: await loadSample("/static/wavfiles/Kawai-K5000W-Trumpet-C5.wav", audioContext),
        AltoSaxophone: await loadSample("/static/wavfiles/Kawai-K5000W-Trombone-C4.wav", audioContext),
        Trombone: await loadSample("/static/wavfiles/Kawai-K5000W-Trombone-C4.wav", audioContext),
        Brass: await loadSample("/static/wavfiles/34_Fsharpm_Brass_SP_222_03.wav", audioContext),
        
        LeadSynth: await loadSample("/static/wavfiles/Lead_11_46_A4_SP_414_SP.wav", audioContext),    
        BassSynth: await loadSample("/static/wavfiles/Kawai-K5000W-SynBass4-C3.wav", audioContext),
        PadSynth: await loadSample("/static/wavfiles/Cm_Pad_306_01.wav", audioContext),

        // Drums
        KickDrum: await loadSample("/static/wavfiles/Bass-Drum-1.wav", audioContext),
        SnareDrum: await loadSample("/static/wavfiles/Yamaha-DX7-Snare-Drum.wav", audioContext),
        
        HitHat: await loadSample("/static/wavfiles/Yamaha-RM50-Pedal-Hi-Hat-1.wav", audioContext), // pedal

        //OpenHat: await loadSample("/static/wavfiles/Ensoniq-SD-1-Saxophone-C5.wav", audioContext),
        HihatOpen: await loadSample("/static/wavfiles/Yamaha-FS1r-Drum-Kit-1-Open-Hi-Hat.wav", audioContext),
        HihatClosed: await loadSample("/static/wavfiles/Yamaha-FS1r-Drum-Kit-1-Closed-Hi-Hat.wav", audioContext),
        Clap: await loadSample("/static/wavfiles/Korg-TR-Rack-Standard-Kit-Clap.wav", audioContext),
        
        Glockenspiel: await loadSample("/static/wavfiles/E-Mu-Proteus-2-Glockenspiel-C4.wav", audioContext), //
        PercussionAgogo: await loadSample("/static/wavfiles/Kawai-K5000W-Agogo-C6.wav", audioContext),
    };
    return instrumentSamples
}

const timelineContainer = document.getElementById('timeline-container');
  const timeScaleFactor = 0.5; // Adjust to control note width 

  function updatePlayhead(currentTime) {
    const playheadPosition = (currentTime / 1000) * 100 * timeScaleFactor;
    playhead.style.left = `${playheadPosition}px`;
  }
  function startPlay() {
    const audioCtx = new (window.AudioContext || window.webkitAudioContext)(); 
    playheadInterval = setInterval(() => {
        const currentTime = audioCtx.currentTime * 1000; // Time in milliseconds

        // Update the playhead position
        updatePlayhead(currentTime);

        // Check if the music has reached the end
        if (currentTime >= totalDuration) {
            stopMusic();
        }
        }, 20); // Update every 20ms 
  }
  function stopMusic() {
    clearInterval(playheadInterval); // Stop the playhead animation
    playhead.style.left = '0'; // Reset playhead position
  }


  function createTimeline(musicData) {
    for (const part in musicData) { 
      for (const instrument in musicData[part]) {
        const track = document.createElement('div');
        track.innerHTML = "<span class='instrument-name'>"+instrument+"</span>"

        track.classList.add('track');
        timelineContainer.appendChild(track);

        const instr = document.createElement('div');
        instr.innerText = instrument
        musicData[part][instrument].forEach(noteData => {
          if (noteData.pitch != "0") {
            const note = document.createElement('div');
            
            note.classList.add('note');
            note.style.left = (noteData.offset * 100 * timeScaleFactor) + 'px'; // Position the note
            note.style.width = (noteData.duration * timeScaleFactor) + 'px'; // Set note width
            track.appendChild(note);
          }
        });
      }
    }
  }


async function playPiece(jsonData) {
    Tone.start(); 
    const audioContext = new (window.AudioContext || window.webkitAudioContext)();
    const currentTime = audioContext.currentTime
    
    playheadInterval = setInterval(() => {
        const currentTime = audioContext.currentTime * 1000; // Time in milliseconds

        // Update the playhead position
        updatePlayhead(currentTime);

        // Check if the music has reached the end
        if (currentTime >= totalDuration) {
            stopMusic();
        }
    }, 20); // Update every 20ms 

    if (jsonData["JazzPiece"] != undefined)
        jsonData = jsonData["JazzPiece"]
    if (jsonData["SmoothMusicPiece"] != undefined)
        jsonData = jsonData["SmoothMusicPiece"]

    for (let i = 0; i < Object.keys(jsonData).length; i++) {
        const part = Object.keys(jsonData)[i];
        const instrumentName = Object.keys(jsonData[part])[0];
        //playInstrument(jsonData[part], instrumentName);
        //if (instrumentName == "Violin")
            playNotes(jsonData[part][instrumentName], instrumentName, audioContext, currentTime)
    }
}

async function playNotes1(notes, instrument, audioContext, currentTime) {
    // const audioContext = new (window.AudioContext || window.webkitAudioContext)();
    audioContext.resume()
    const instrumentSamples = await loadAll (audioContext)

    const reverbBuffer = await loadSample('/static/wavfiles/reverb-89603.mp3', audioContext);

    //const fadeTime = 0.005; // 5 milliseconds fade time

    var index = 0
    // for (let index = 0; index < notes.length; index++) {
    let gainsNodes = []
    if (notes.length > 0) {
        let StartPlay = setInterval (async function () {
            const offset = 0
            const note = notes[index];
            
            //audioContext.createConvolver
            const source = audioContext.createBufferSource();
            // const source = audioContext.createConvolver();

            const fadeTime = 0.001//(currentTime + note.offset + (note.duration / 1000))/2

            source.buffer = instrumentSamples[instrument];

            const frequency = midiToFrequency(note.pitch);
            
            const playbackRate = frequency/ baseScallar;
            source.playbackRate.setValueAtTime(playbackRate, offset);
            //os.frequency.setValueAtTime(frequency, offset);//oscillator

            const gainNode = audioContext.createGain();
            if (instrument == "Glockenspiel")
                gainNode.gain.value = 0.3
            gainNode.gain.setValueAtTime(0, currentTime + offset);
            //gainNode.gain.setValueAtTime(0, currentTime +offset + ((note.duration) / 1000));
            
            gainNode.gain.linearRampToValueAtTime(0.6, currentTime +offset + fadeTime);

            gainNode.gain.linearRampToValueAtTime(0.8, currentTime +offset);

            // Fade-out 
            gainNode.gain.linearRampToValueAtTime(0, currentTime +offset + ((note.duration) / 1000) - fadeTime); 

            // const reverbNode = audioContext.createConvolver();
            // reverbNode.buffer = reverbBuffer;

            //os.connect(gainNode);
            source.connect(gainNode);
            gainNode.connect(audioContext.destination);

            //gainNode.connect(reverbNode);
            //everbNode.connect(audioContext.destination);
            
            //os.start(currentTime + note.offset);

            source.start(currentTime+note.offset);
            //os.stop(currentTime + note.offset + ((note.duration) / 1000));
            gainNode[index] = source
            // source.stop(currentTime + note.offset + ((note.duration) / 1000));
            index ++
            if (index >= notes.length) {
                clearInterval(StartPlay)
                //source.stop(currentTime + note.offset + ((note.duration) / 1000));
            }
        }, currentTime + notes[index] + (notes[index].duration)) //currentTime + notes[index] + (notes[index].duration)
    }
}



async function playInstrument(jsonData, instrumentName) {
    // ... Load other instruments
    
    // Wait for all samples to load
    await Tone.loaded(); 
  
    const Notes = jsonData[instrumentName];
    scheduleNotes(Notes, instrumentSamples[instrumentName]);
    // ... Schedule other instruments
  
    // Start playback 
    Tone.Transport.start(); 
  }
  
  function scheduleNotes(notes, instrument) {
    //Tone.Transport.bpm.value = 228;
  
    
    //notes.forEach(note => {
    for (let index = 0; index < notes.length; index++) {
      const note = notes[index];
      var startTime = note.offset;
      const duration = note.duration / 1000;
      const frequency = Tone.Frequency(note.pitch, "midi");
  
      Tone.Transport.scheduleOnce(prev => {
        console.log(prev)
        instrument.playbackRate = frequency.toFrequency() / baseScallar
        instrument.start(prev);
        instrument.stop(prev + duration);
        startTime += prev
      }, startTime );
    }//);
  }
  
  

//

async function playNotes(notes, instrument, audioContext, currentTime) {
    // const audioContext = new (window.AudioContext || window.webkitAudioContext)();
    audioContext.resume()
    
    const instrumentSamples = await loadAll (audioContext)

    const reverbBuffer = await loadSample('/static/wavfiles/reverb-89603.mp3', audioContext);

    //const fadeTime = 0.005; // 5 milliseconds fade time

    var index = 0
    // for (let index = 0; index < notes.length; index++) {
    let gainsNodes = []
    if (notes.length > 0) {
        let StartPlay = setInterval (async function () {
        
            const note = notes[index];
            
            //audioContext.createConvolver
            const source = audioContext.createBufferSource();
            // const source = audioContext.createConvolver();

            const fadeTime = 0.009//(currentTime + note.offset + (note.duration / 1000))/2

            source.buffer = instrumentSamples[instrument];

            const frequency = midiToFrequency(note.pitch);
            
            const playbackRate = frequency/ baseScallar;
            source.playbackRate.setValueAtTime(playbackRate, note.offset);
            //os.frequency.setValueAtTime(frequency, note.offset);//oscillator

            const gainNode = audioContext.createGain();
            if (instrument == "Glockenspiel")
                gainNode.gain.value = 0.3
            gainNode.gain.setValueAtTime(0, currentTime + note.offset);
            //gainNode.gain.setValueAtTime(0, currentTime +note.offset + ((note.duration) / 1000));
            
            gainNode.gain.linearRampToValueAtTime(0.6, currentTime +note.offset + fadeTime);

            gainNode.gain.linearRampToValueAtTime(0.8, currentTime +note.offset);

            // Fade-out 
            gainNode.gain.linearRampToValueAtTime(0, currentTime +note.offset + ((note.duration) / 1000) - fadeTime); 

            // const reverbNode = audioContext.createConvolver();
            // reverbNode.buffer = reverbBuffer;

            //os.connect(gainNode);
            source.connect(gainNode);
            gainNode.connect(audioContext.destination);

            //gainNode.connect(reverbNode);
            //everbNode.connect(audioContext.destination);
            
            // os.start(currentTime + note.offset);

            source.start(currentTime+note.offset);
            //os.stop(currentTime + note.offset + ((note.duration) / 1000));
            gainNode[index] = source
            // source.stop(currentTime + note.offset + ((note.duration) / 1000));
            index ++
            if (index >= notes.length) {
                clearInterval(StartPlay)
                source.stop(currentTime + note.offset + ((note.duration) / 1000));
            }
        }, currentTime + notes[index] + (notes[index].duration)) //currentTime + notes[index] + (notes[index].duration)
    }
}
