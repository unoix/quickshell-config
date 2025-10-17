//@ pragma UseQApplication

import QtQuick
import Quickshell

import "./modules/"
import "./modules/bar/"
import "./modules/stickr/"
import "./modules/line/"


ShellRoot { 
	id: root
	Line {}
	Bar {}
//	Stickr {}
//	BatteryPopup {}
}

