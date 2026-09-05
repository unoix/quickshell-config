import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower

import "root:/"

Item {
    id: root

    property real collapsedSize: Config.barHeight
    property real expandedSize: Config.barHeight * 2

    height: Config.barHeight
    width: Config.barHeight

    // 1. Container for the fill, masked to the circle shape
    Item {
        anchors.fill: parent

        Rectangle {
            id: fill
            color: Colors.textAlt
            width: parent.width
            // Optional chaining safely handles percentage on startup
            height: root.height * (UPower.displayDevice?.percentage ?? 0)
            anchors.bottom: parent.bottom
        }

        layer.enabled: true
        layer.effect: MultiEffect {
            maskEnabled: true
            maskSource: maskTexture
        }
    }

    // 2. Offscreen texture source for MultiEffect
    ShaderEffectSource {
        id: maskTexture
        sourceItem: maskShape
        hideSource: true // Offscreen render: keeps texture active without drawing maskShape to screen
    }

    // 3. The shape used as the mask
    Rectangle {
        id: maskShape
        anchors.fill: parent
        radius: height / 2
        color: "white" // Opaque white provides full alpha for the mask
    }

    // 4. Border overlay drawn on top
    Rectangle {
        anchors.fill: parent
        color: "transparent"
        radius: height / 2
        border {
            color: Colors.borderActive
            width: 2
        }
    }

    // 5. Battery percentage text
    Text {
        id: batLevel
        anchors.centerIn: parent
        color: Colors.text
        text: Math.round((UPower.displayDevice?.percentage ?? 0) * 100)
    }
}
