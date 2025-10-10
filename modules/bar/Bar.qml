import QtQuick
import Quickshell
import Quickshell.Hyprland
import "./widgets"

PanelWindow {
	id: root
	color: "#00000000"
	anchors {
		top: true
		left: true
		right: true
	}

	implicitHeight: 24
	margins {
		top: 2
		left: 5
		right: 5
		bottom: 2
	}

	Rectangle {
		id: bar
		anchors.fill: parent
		color: "#00000000"


		//widgets
		//left
		Row {
			id: leftRow
			spacing: 12
			leftPadding: 12
			rightPadding: 12
			anchors {
				verticalCenter: parent.verticalCenter
				left: parent.left
			}

			Workspaces {}
		}
		//right
		Row {
			id: rightRow
			spacing: 12
			leftPadding: 12
			rightPadding:12
			anchors {
				verticalCenter: parent.verticalCenter
				right: parent.right
			}

			Battery {}
		}
	}
}
