
import QtQuick
import Quickshell
import Quickshell.Hyprland

Row {
	id: workspacesRow

/*	anchors {
		verticalCenter: parent.verticalCenter
		left: parent.left
		leftMargin: 10
		rightMargin: 10
	}
	*/
	spacing: 8

	Repeater {
		model: Hyprland.workspaces

		anchors {
			verticalCenter: parent.verticalCenter
			horizontalCenter: parent.horizontalCenter
		}

		Rectangle {
			width: modelData.active ? 36 : 16
			height: 16
			radius: 8
			color: modelData.active ? "#ffff0000" : "#303030"
			border.color: "#ffffff"
			border.width: 1

			MouseArea {
				anchors.fill: parent
				onClicked: Hyprland.dispatch("workspace " + modelData.id)
			}
		}
	}
}
