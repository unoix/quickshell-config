//@ pragma UseQApplication

import QtQuick
import Quickshell

import "./modules/"
import "./modules/bar/"
import "./modules/stickr/"


ShellRoot { 
	id: root
	Bar {}
	Stickr {}
//	BatteryPopup {}
}

