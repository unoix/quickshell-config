import QtQuick
import Quickshell
import Quickshell.Hyprland
import "./widgets"
import "./widgets/sound/"

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
		top: 4
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
		//center
		Clock { anchors.centerIn: parent }
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
			SoundSelector {xOffset: (1920-implicitWidth); yOffset: 30; anchor.window: root}
			SoundButton { id: soundButton }
			Battery {}
		}
	}
}
