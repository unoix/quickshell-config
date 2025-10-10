
import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.UPower

ClippingRectangle {
	id: root
	height: 16
	width:	48
	radius: 8
	border.width: 1
	border.color: "#ffffff"
	color: "#00000000"
//	clip: true

	
	Rectangle {
		id: fillLevel
		width: parent.width
		height: 12
		
		color: "#ff0000"

		anchors {
			bottom: parent.bottom
		}

		/*Rectangle {
			id: frame

			anchors {
				centerIn: parent.parent
			}

			height: 16
			width:	48
			radius: 8
			border.color: "#ffffff"
			color: "#00000000"
		}*/
	}
}
