import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    signal buttonClick()
    height: width/4
    radius: width/12
    color: "#EEEEDE"
    border.color: "black"
    border.width: 2
    MouseArea {
        anchors.fill: parent
        onPressed: parent.color = "#bfbfb0"
        onReleased: parent.color = "#EEEEDE"
        onClicked: parent.buttonClick()
    }
}


