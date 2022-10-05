import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import NoFlipFlops 1.0

Pane{
    id: root
	
	Relay {
		id: relay
	}
	
	InfraredThermometer {
		id: thermometer
	}
	
	ColumnLayout{
    spacing: 2
	
		Label {
			text: "Thermometer Device Name: " + thermometer.name
		}
		
		Label {
			text: "Thermometer Device Connected: " + thermometer.connected
		}
		Label {
			text: "Temperature: " + thermometer.temperature
		}
		
		
		Label {
			text: "Relay Device Name: " + relay.name
		}
		
		Label {
			text: "Relay Device Connected: " + relay.connected
		}
		
		Label {
			text: "Relay Device Wired: " + relay.wired
		}
	
		Button {
			text: "Relay ON"
			onClicked: relay.wired = true
		}
		
		Button {
			text: "Relay OFF"
			onClicked: relay.wired = false
		}
	}
}
