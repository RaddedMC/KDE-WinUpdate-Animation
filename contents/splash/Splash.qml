import QtQuick 2.5


Image {
    id: root
    source: "images/background.png"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }


    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        AnimatedImage {
            id: logo
            //match SDDM/lockscreen avatar positioning
            //property real size: units.gridUnit * 8

            anchors.centerIn: parent

            source: "images/loadingDots.gif"

            //sourceSize.width: size
            //sourceSize.height: size
        }

		Text {
			text: "Working on updates: " + Math.round(stage/6*100) + "%\nDon't turn off your PC... This will take a while."
			font.family: "Segoe"
			font.pointSize: 18
			color: "white"
			horizontalAlignment: Text.AlignHCenter
		    y: parent.height - (parent.height - logo.y) / 4 * 3
		    anchors.horizontalCenter: parent.horizontalCenter
		}
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
