# Music Composer notes

## orDrumbox
> https://www.ordrumbox.com/features.php

- Each track is composed of notes, one or more notes by beat (allowing chords).
- On each note, you can independently control pitch (in semitones) and volume.
- On each track you can use either an automatic fill engine or a random engine.
- You can import your own sound files and use them as instruments with the orDrumbox.
- Online Drum Machine
	- https://www.ordrumbox.com/jsdrumbox/index.html

## LinuxSampler
> http://www.linuxsampler.org/

***

## Hydrogen
> http://hydrogen-music.org/documentation/manual/manual_en.html
> https://freewavesamples.com/hydrogen-drum-kits

## Interesting
	- https://www.meldaproduction.com/MDrummer%20Small
	- http://www.beatassist.eu/nastylooper.htm
	- https://www.looperman.com/loops/tags/royalty-free-hydrogen-loops-samples-sounds-wavs-download
	- https://github.com/hydrogen-music/hydrogen/wiki/Drumkit-patterns
		- https://github.com/hydrogen-music/Song-and-pattern-repository/tree/master/Patterns
	- New instrument from sample
		- https://steemit.com/utopian-io/@buckydurddle/hydrogen-drum-machine-new-instruments-loading-samples-and-multiple-sample-sounds
		- see `9.4. Creating an Instrument and Layers`
	- http://hydrogen-music.org/faq/#i-copied-my-song-to-another-pc-and-there-is-no-sound-why-is-that

- Default Locations
	- `/usr/share/hydrogen/data/drumkits/`
	- `$HOME/.hydrogen/data/songs`
	- `$HOME/.hydrogen/data/patterns/drumkit_name`
	- `$HOME/.hydrogen/data/library_name`
	- `$HOME/.hydrogen/data/songs`
	-

### Working Notes
- 6.4. Pattern Editor Note Properties


- Instruments → "Save library"

- ADSR Envelope Generator
	- An Attack/Decay/Sustain/Release envelope generator.
	- After you trigger a note, Hydrogen will
		- attack the note by increasing its volume from 0 to the full velocity of the note.
		- After reaching full velocity, it will decay the note by lowering the volume until it reaches the sustain level.
		- When the note is released, Hydrogen reduces the volume from the sustain level back down to 0.
	- Velocity
		- How hard you hit a note.
	- 9.3.1. Envelope Parameters
		- When the instrument is triggered, its volume is run through an ADSR Envelope.
		- The parameters operate as follows:
		- **Attack**
			- the amount of time that the volume of the sample goes from 0 to the full velocity of the note.
			- If the value is 0, the sample will play immediately at full velocity.
			- If the value is 1.0, the sample volume will use the maximum time available for the attack parameter. [1]
		- **Decay**
			- the amount of time for the volume of the sample to go from full velocity down to the sustain volume.
			- If the value is 0, the sample will immediately skip from the attack volume to the sustain volume.
			- If the value is 1.0, the sample volume will use the maximum time available for the decay parameter.[1]
		- **Sustain**
			- the volume to play the note after the decay phase is over, and until the note is released.
			- If set to 0, the note will be silent.
			- If set to 1.0, the note will play at full velocity.
		- **Release**
			- the time to fade out the note from the sustain volume back down to 0 (silent).
			- If set to 0, the note will fade out in the minimum amount of time (about 5 ms).
			- If set to 1, it will fade out for the maximum time available.[1]
		- If the sample is shorter than the times that you specify, the sample will end, regardless of which phase of the ADSR it is in.
		- If the note is sustained, it does not draw out the note while you are holding it. It only holds the gain (volume) parameter during that time.


	- Attack
		- The amount of time to go from 0 to full velocity.
	- Decay
		- The amount of time to go from full velocity to the sustain volume.
	- Sustain
		- The level (how loud) to hold the note between the sustain and the release.
		- It is a percentage of the velocity.
		- It does not depend on time.
	- Release
		- The amount of time to go from the sustain volume back down to 0.

- "Song" mode and "Pattern" mode


### Drumkits
> https://opensource.com/article/17/11/how-create-hydrogen-drumkit-fun-and-profit

***
