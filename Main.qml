import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import NoFlipFlops 1.0

Pane{
    id: root
	
	Relay {
		id: relay
	}
	
	
	
	ColumnLayout{
    spacing: 2
		Label {
			text: "Relay Device Name: " + relay.name
		}
		
		Label {
			text: "Relay Device Connected: " + relay.connected
		}
	
		Button {
			text: "Relay ON"
			onClicked: relay.wire(true)
		}
		
		Button {
			text: "Relay OFF"
			onClicked: relay.wire(false)
		}
	}
}
