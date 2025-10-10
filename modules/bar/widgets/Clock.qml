
import QtQuick
import Quickshell

Rectangle {
	id: root

	SystemClock {
		id: clock
		precision: SystemClock.Minutes;
	}

	Text {
		anchors.centerIn: parent
		text: Qt.formatDateTime(clock.date, "hh\\mm")
		font.family: "Departure Mono"
		font.pixelSize: 20
		color: "white"
	}
}
