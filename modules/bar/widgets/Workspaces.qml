
import QtQuick
import Quickshell
import Quickshell.Hyprland

Row {
	id: workspacesRow

	readonly property var animSpeed: 250

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
			anchors.verticalCenter: parent.verticalCenter
			width: modelData.active ? 54 : 30
			height: modelData.active ? 24 : 24
			radius: 12
			color: modelData.active ? "#ffff0000" : "transparent"
			border.color: "#ff0000"
			border.width: 2

			Behavior on width {
                		NumberAnimation { duration: animSpeed; easing.type: Easing.InOutQuad }
			}
			Behavior on height {
				NumberAnimation { duration: animSpeed; easing.type: Easing.InOutQuad }
			}
            		Behavior on color {
                		ColorAnimation { duration: animSpeed; easing.type: Easing.InOutQuad }
            		}

			MouseArea {
				anchors.fill: parent
				onClicked: Hyprland.dispatch("workspace " + modelData.id)
			}

			Text {
				anchors.centerIn: parent
				color: modelData.active ? "black" : "white"
				font.family: "Iosevka Nerd Font"
				font.bold: true
				font.pixelSize: modelData.active ? 24 : 12 
				text: modelData.id
				
				Behavior on font.pixelSize {
					NumberAnimation { duration: animSpeed; easing.type: Easing.InOutQuad }
				}

				Behavior on color {
					ColorAnimation { duration: animSpeed; easing.type: Easing.InOutQuad }
				}

			}
		}
	}
}
