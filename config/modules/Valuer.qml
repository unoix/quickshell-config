import QtQuick
import QtQuick.Shapes
import QtQuick.Effects
import Quickshell
import qs

Item {	
	id: valuer
	width: Config.barHeight
	height: Config.barHeight

	property real strokeWidth: 4
	property url iconSource
	readonly property bool hasIcon: iconSource.toString() !== ""
	required property real percentage

	Item {
		width: Config.barHeight
		height: Config.barHeight
		visible: valuer.hasIcon
		anchors.centerIn: parent

		Image {
			width: parent.width * 0.5
			height: parent.height * 0.5
			anchors.centerIn: parent

			id: icon
			visible: true
			source: valuer.iconSource

			sourceSize.width: width 
			sourceSize.height: height

			layer.enabled: true
			layer.effect: MultiEffect {
				brightness: 1.0
				colorization: 1.0
				colorizationColor: Colors.fg
			}
		}
/*
		MultiEffect {
			anchors.centerIn: parent
			source: icon
			colorization: 1.0
			colorizationColor: "#f0e2d6"
		}*/
	}

	Shape {
		width: Config.barHeight
		height: Config.barHeight 
		anchors.centerIn: parent
		preferredRendererType: Shape.CurveRenderer
		
		//Background
		ShapePath {
			strokeWidth: valuer.strokeWidth
			strokeColor: Qt.alpha(Colors.bg, 0.15) 
			fillColor: "transparent"

			PathAngleArc {
				centerX: Config.barHeight/2
				centerY: Config.barHeight/2
				radiusX: centerX - valuer.strokeWidth
				radiusY: centerY - valuer.strokeWidth
				startAngle: 0
				sweepAngle: 360
			}
		}
		//Value
		ShapePath {
			strokeWidth: valuer.strokeWidth
			strokeColor: Colors.fg
			fillColor: "transparent"
			capStyle: ShapePath.RoundCap

			PathAngleArc {
				centerX: Config.barHeight/2
				centerY: Config.barHeight/2
				radiusX: centerX - valuer.strokeWidth
				radiusY: centerY - valuer.strokeWidth
				startAngle: 270
				sweepAngle: percentage * 360
			}
		}	
	}
}
