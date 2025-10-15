
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
		running: (Math.round(percentage*100) < 15 && !isCharging)
		alwaysRunToEnd: true
		loops: Animation.Infinite
		ColorAnimation { from: "#ff0000"; to: "transparent"; duration: 2000; easing: InOutCubic }
	}

	id: battery
	height: 24
	width:	60
	radius: 12
	border.width: 1
	border.color: "red"
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
		visible: !isCharging
		id: batteryText
		antialiasing: false
		anchors.centerIn: parent
		y: 2
		text: Math.round(percentage*100)
		color: "white"
		font.family: "Iosevka Nerd Font"
		font.pixelSize: 20
		font.bold: true
	}
	
	IconImage {
		visible: isCharging
		id: batteryIcon
		implicitSize: 20
		source: "root:assets/Triangle.svg"
		//antialiasing: false
		anchors.horizontalCenter: parent.horizontalCenter
		y: 3
		/*text: isCharging ? "" : Math.round(percentage*100)
		color: "white"
		font.family: "Iosevka Nerd Font"
		font.pixelSize: 20
		font.bold: true */
		
		SequentialAnimation on opacity {
			running: isCharging
			alwaysRunToEnd: true
			loops: Animation.Infinite
			NumberAnimation {from: 0.0; to: 1.0; duration: 1000; easing.type: Easing.OutCubic }
			NumberAnimation {from: 1.0; to: 1.0; duration: 500 }
			NumberAnimation {from: 1.0; to: 0.0; duration: 1000; easing.type: Easing.InCubic }
		}

	}

}
