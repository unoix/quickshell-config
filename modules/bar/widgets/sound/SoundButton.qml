
import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Pipewire

Rectangle {

	readonly property var volumePercent: Math.round(Pipewire.defaultAudioSink?.audio.volume*100)
	readonly property var animSpeed: 500
	readonly property var sliderWidth: 120

	PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}

	property bool isHovered: false
	

	id: root

	radius: 12

	color: "red" //isHovered ? "red" : "transparent"
	border {
		width: 1
		color: "red"
	}

	MouseArea {
		anchors.fill: parent
		hoverEnabled: true
		onEntered: isHovered = true
		onExited: hideTimer.running = true
		propagateComposedEvents: true
	}

	Timer {
		id: hideTimer
		interval: 1000
		onTriggered: isHovered = false
	}

	Behavior on width {
		NumberAnimation { duration: animSpeed; easing.type: Easing.OutQuad}
	}

	height: 24
	width: isHovered ? (audioRow.spacing + audioRow.leftPadding * 2 + speakerIcon.implicitSize + sliderWidth) : (audioRow.leftPadding * 2 + speakerIcon.implicitSize)
	Row {	
		id: audioRow
		anchors.fill: parent
		layoutDirection: Qt.RightToLeft
		spacing: 4
		leftPadding: 10
		rightPadding: leftPadding

		IconImage {
			visible: true
			id: speakerIcon
			anchors.verticalCenter: parent.verticalCenter
			implicitSize: 20
			source: Pipewire.defaultAudioSink?.audio.muted ? "root:assets/Mute_Icon.svg" : "root:assets/Speaker_Icon.svg"
		}

			
		Slider {
			state: isHovered ? "Visible" : "Invisible" 
			states: [
				State {
					name: "Visible"
					PropertyChanges{target: volumeSlider; opacity: 1.0}
					PropertyChanges{target: volumeSlider; visible: true}
					PropertyChanges{target: volumeSlider; width: sliderWidth}
				},
				State {
					name: "Invisible"
					PropertyChanges{target: volumeSlider; opacity: 0.0}
					PropertyChanges{target: volumeSlider; visible: false}
					PropertyChanges{target: volumeSlider; width: 0}
				}
			]
			transitions: [
				Transition {
					from: "Visible"
					to: "Invisible"
					SequentialAnimation {
						ParallelAnimation{
							NumberAnimation {
								target: volumeSlider
								property: "opacity"
								duration: animSpeed
								easing.type: Easing.InOutQuad
							}
							NumberAnimation {
								target: volumeSlider
								property: "width"
								duration: animSpeed
								easing.type: Easing.InOutQuad
							}
						}
						NumberAnimation {
							target: volumeSlider
							property: "visible"
							duration: 0
						}
					}
				},
				Transition {
					from: "Invisible"
					to: "Visible"
					SequentialAnimation {
						NumberAnimation {
							target: volumeSlider
							property: "visible"
							duration: 0
						}
						ParallelAnimation{
							NumberAnimation {
								target: volumeSlider
								property: "opacity"
								duration: animSpeed
								easing.type: Easing.InOutQuad
							}
							NumberAnimation {
								target: volumeSlider
								property: "width"
								duration: animSpeed
								easing.type: Easing.InOutQuad
							}
						}
					}
				}
			]
			id: volumeSlider
			anchors.verticalCenter: parent.verticalCenter
			width: sliderWidth
			height: 15
			from: 0 
			to: 100
			value: volumePercent

			background: Rectangle {
				anchors.verticalCenter: volumeSlider.verticalCenter
				height: 4
				radius: 2
				color: "black"
				border.width: 1
				border.color: "red"

				Rectangle {
					width: volumeSlider.visualPosition * parent.width
					height: parent.height
					radius: parent.radius
					color: "black"
				}
			}

			handle: Rectangle {
				anchors.verticalCenter: volumeSlider.verticalCenter
				x: volumeSlider.visualPosition * (volumeSlider.width - width)
				width: 16
				height: 12
				radius: 6
				color: "black"
			}

			onMoved: Pipewire.defaultAudioSink.audio.volume = value/100
		}
		//}

	}
}
