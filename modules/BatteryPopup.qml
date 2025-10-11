
import QtQuick
import Quickshell
import Quickshell.Services.UPower
import Quickshell.Wayland

Scope {
	id: root

	readonly property var charge: UPower.displayDevice.percentage*100
	property bool isVisible: false

	Timer {
		running: true
		repeat: true
		id: checkLevel
		interval: 60000
		onTriggered: {isVisible = (charge < 10); if(isVisible){hideTimer.running = true}}
	}


	Timer {
		id: hideTimer
		interval: 1000
		onTriggered: root.isVisible = false
	}

	LazyLoader {
		active: root.isVisible

		PanelWindow {
			
			WlrLayershell.layer: WlrLayer.Overlay
			implicitWidth: screen.width
			implicitHeight: screen.height
			
			mask: Region {}

			SequentialAnimation on color {
				running: root.isVisible
				alwaysRunToEnd: true
				ColorAnimation {from: "#ff0000"; to: "#00000000"; duration: 900; easing: OutCubic}
			}
		}
	}
}

			

