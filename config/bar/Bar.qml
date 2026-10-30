import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower
import qs 
import qs.modules

PanelWindow {
	id: root

	anchors {
		top: true
		left: true
		right: true
	}

	height: Config.barHeight + 2
//	width: Config.barWidth

	color: "#ff7c11"

	RowLayout {
		anchors {
			fill: parent
			leftMargin: 6
			rightMargin: 6
			topMargin: 2
		}

		Battery {}

		Audio {}

		Brightness {}

		Text {
			text: Quickshell.configDir
		}
	}

}
