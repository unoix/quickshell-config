pragma Singleton

import QtQuick
import Quickshell.Io

import "./"


QtObject {
	
//	id: root

	//bar
	readonly property int barHeight: 35
	readonly property int barWidth: 1920
	property int borderWidth: 0

	property Process hyprctl: Process {
		running: true

		command: ["hyprctl", "getoption", "general:bordersize", "-j"]

		stdout: StdioCollector {
			onStreamFinished: {
				var data = JSON.parse(text)
				parent.borderWidth = data.int
			}
		}
	}
}
