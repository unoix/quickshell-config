
import QtQuick
import QtQuick.Effects
import QtQuick.Shapes

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.UPower

ClippingRectangle {

	readonly property real percentage: UPower.displayDevice.percentage
	readonly property var chargeState: UPower.displayDevice.state
	readonly property bool isCharging: chargeState == UPowerDeviceState.Charging;
	
	SequentialAnimation on color {
		running: (Math.round(percentage*100) < 10 && !isCharging)
		alwaysRunToEnd: true
		loops: Animation.Infinite
		ColorAnimation { from: "#90ff0000"; to: "transparent"; duration: 1500 }
	}

	id: battery
	height: 24
	width:	60
	radius: 12
	border.width: 1
	border.color: "white"
	color: "transparent"
//	clip: true

	
	ClippingRectangle {
		id: fillLevel
		width: parent.width
		height:	Math.round(parent.height * percentage) 
		color: "#ff0000"

		anchors {
			bottom: parent.bottom
		}
	}

	Text {
		id: batteryText
		antialiasing: false
		anchors.centerIn: parent
		text: isCharging ? "c" : Math.round(percentage*100)
		color: "white"
		font.family: "Departure Mono"
		font.pixelSize: 20
		font.bold: true
	}

}
