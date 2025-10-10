
import Quickshell
import QtQuick
import Quickshell.Wayland
//import QtMultimedia

PanelWindow {
	id: root
	
	anchors.right: true
	anchors.bottom: true

	color: "#00000000"

	implicitWidth: teto.width
	implicitHeight: teto.height

	mask: Region {}

	WlrLayershell.layer: WlrLayer.Bottom

	AnimatedImage { id: teto; source: "teto.gif" }


	Rectangle {
		property int frames: teto.frameCount

		width: 4
		height: 8
		x: (teto.width - width) * teto.currentFrame / frames
		y: teto.height
	}
}
