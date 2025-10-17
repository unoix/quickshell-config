
import QtQuick
import Quickshell

Rectangle {
	id: root

	SystemClock {
		id: clock
		precision: SystemClock.Seconds;
	}

	Text {	
		anchors.centerIn: parent
		text: Qt.formatDateTime(clock.date, "< hh \\ mm \\ ss >")
		font.family: "Iosevka Nerd Font"
		font.bold: true
		font.pixelSize: 20
		color: "white"
	}
}
