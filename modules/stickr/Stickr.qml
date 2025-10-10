
import Quickshell
import QtQuick
//import QtMultimedia

FloatingWindow {
	id: root
	title: "teto"

	color: "#00000000"

	AnimatedImage { id: teto; source: "teto.gif" }
	maximumSize: "498x498"


	Rectangle {
		property int frames: teto.frameCount

		width: 4
		height: 8
		x: (teto.width - width) * teto.currentFrame / frames
		y: teto.height
	}
}
