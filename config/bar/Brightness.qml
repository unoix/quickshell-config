import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Io
import qs.modules


Valuer {
	id: root
	property int current: 0
	property int max: 1515

    	percentage: max > 0 ? (current / max) : 0

    	readonly property string devicePath: "/sys/class/backlight/intel_backlight"

	FileView {
        	id: currentBrightnessFile
        	path: root.devicePath + "/brightness"
        	onLoaded: root.current = parseInt(text().trim())
    	}

    	FileView {
        	path: root.devicePath + "/max_brightness"
		onLoaded: root.max = parseInt(text().trim())
    	}

    	Process {
        	command: ["udevadm", "monitor", "--subsystem-match=backlight"]
       		running: true

        	stdout: SplitParser {
            		onRead: {
                	currentBrightnessFile.reload()
            		}
        	}
    	}

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
