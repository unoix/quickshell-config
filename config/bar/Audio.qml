import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import qs.modules

Valuer {

	PwObjectTracker {
        	objects: [Pipewire.defaultAudioSink]
	}

	readonly property PwNode sink: Pipewire.defaultAudioSink

	percentage: sink?.audio?.volume ?? 0

	iconSource: {
		const audio = sink?.audio

		if ( !audio  || audio.muted ) {
			return Quickshell.configDir + "/assets/volume-x.svg"
		}

		const p = audio.volume * 100
        	if (p < 15)  return Quickshell.configDir + "/assets/volume.svg"
        	if (p < 60) return Quickshell.configDir + "/assets/volume-1.svg"
		return Quickshell.configDir + "/assets/volume-2.svg"
    }
}
