import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import NoFlipFlops 1.0

Pane{
	id: root
	
	Relay {
		property var hysteresisLow: -2.0
		property var hysteresisHi: -1.0
		id: relay
		
		wired: {
			thermometer.connected ?
			(
				(thermometer.temperature < (targetTemperatureSlider.value + hysteresisLow)) ? true :
				((thermometer.temperature > (targetTemperatureSlider.value + hysteresisHi)) ? false : thermometer.connected)
			
			) : false
			
		}
	}
	
	InfraredThermometer {
		id: thermometer
	}
	
	Column{
		anchors.fill: parent
		Label {
			text: "Thermometer Connected: " + thermometer.connected
		}
		
		Label {
			text: "Relay Connected: " + relay.connected
		}
		
		Label {
			text: "Relay Wired: " + relay.wired
		}

		
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			font.pixelSize: 75
			padding: 50
			color: thermometer.temperature < targetTemperatureSlider.value ? "dodgerblue" : "orangered"
			text: thermometer.temperature.toFixed(1)+" C°"
		}
		
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			font.pixelSize: 40
			text: "target: "+targetTemperatureSlider.value.toFixed(1)+" C°"
		}
		
		Slider {
			id: targetTemperatureSlider
			width: parent.width
			from: 0
			to: 100
			stepSize: 0.5
		}
	}
}
