import QtQuick
import QtQuick.Layouts
import Quickshell
import "root:/" 

PanelWindow {
	id: root

	anchors {
		top: true
		left: true
		right: true
	}

	height: Config.barHeight
//	width: Config.barWidth

	color: "transparent"

	RowLayout {
		anchors {
			fill: parent
			leftMargin: 6
			rightMargin: 6

		}

		Battery {}

		Item {}

		Item {}
	}

}
