import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower

import "root:/"

Rectangle {
	height: Config.barHeight
	width: Config.barHeight
	color: "transparent"
	border {
		color: Colors.borderActive 
	}

	Text {
		id: batLevel
		anchors.centerIn: parent
		color: "black"

		text: UPower.displayDevice.percentage*100
	}


/*	Process {
		id: batProc

		command: ["cat", "/sys/class/power_supply/BAT0/capacity"]
		running: true

		stdout: StdioCollector {
			onStreamFinished: batLevel.text = this.text
		}
	}

	Timer {
		interval: 1000
		running: true
		repeat: true

		onTriggered: batProc.running = true
	}*/
	
}
