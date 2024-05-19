import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
Item {

    property int clickCount: 0
    property int clickCount2: 0
    Rectangle {
        id: background
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#abdbe3" }
            GradientStop { position: 1.0; color: "#abdbe3" }
        }
    }
    MenuButton {
        id: rosa
        anchors {
            left: parent.left
            top: parent.top
            topMargin: 50
            leftMargin: 80
        }
        width: parent.width * .5
        Text {
            text: "ROSA Module"
            anchors.centerIn: parent
        }
        onButtonClick: stackView.push("RosaModule.qml")
    }
    Onoffbutton {
        id: rosa_onoff
        anchors {
            left: rosa.right
            leftMargin: 20
            top: rosa.top
            topMargin: 10
        }
        width: rosa.height - 20
        Image {
            id: onoff
            source: "assets/power-on.png"
            height: rosa_onoff.height/2
            width: height
            anchors.centerIn: rosa_onoff
        }
        MouseArea {
            anchors.fill: rosa_onoff
            onClicked: {
                clickCount++
                rosa_onoff.color = (clickCount % 2 === 0) ? "#47cb47" : "#Ea2a2a"
                rosa.color = (clickCount % 2 === 0) ? "#EEEEDE" : "#bfbfb0"
                rosa.enabled = !rosa.enabled
            }
        }
    }

    MenuButton {
        id: kosa
        anchors {
            top: rosa.bottom
            left: parent.left
            topMargin: 30
            leftMargin: 80
        }

        width: parent.width * .5
        Text {
            text: "KOSA Module"
            anchors.centerIn: parent
        }
    }
    Onoffbutton {
        id: kosa_onoff
        anchors {
            left: kosa.right
            leftMargin: 20
            top: kosa.top
            topMargin: 10
        }
        width: kosa.height - 20
        Image {
            id: onoff2
            source: "assets/power-on.png"
            height: kosa_onoff.height/2
            width: height
            anchors.centerIn: kosa_onoff
        }
        MouseArea {
            anchors.fill: kosa_onoff
            onClicked: {
                clickCount2++
                kosa_onoff.color = (clickCount2 % 2 === 0) ? "#47cb47" : "#Ea2a2a"
                kosa.color = (clickCount2 % 2 === 0) ? "#EEEEDE" : "#bfbfb0"
                kosa.enabled = !kosa.enabled
            }
        }
    }
    MenuButton {
        id: setdelay
        anchors {
            top: kosa.bottom
            left: parent.left
            topMargin: 30
            leftMargin: 80
        }

        width: parent.width * .5
        height: width/5
        Text {
            id: textdelay
            text: "Set delay (ms)"
            anchors.centerIn: parent
        }
        Image {
            id: delaytime
            source: "assets/time.png"
            height: onoff.height/1.5
            width: onoff.width/1.5
            anchors {
                top: setdelay.top
                topMargin: 20
                left: textdelay.right
                leftMargin: 10
            }
        }
    }
    MenuButton {
        id: save
        anchors {
            top: setdelay.bottom
            left: parent.left
            topMargin: 20
            leftMargin: 160
        }

        width: 100
        height: width/4
        Text {
            id: textsave
            text: "Save"
            anchors.centerIn: parent
        }
        onButtonClick: console.log("test")
    }
}
