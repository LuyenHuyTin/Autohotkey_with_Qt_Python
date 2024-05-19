import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 540
    height: 380
    visible: true
    title: qsTr("Keystroke")
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "MainMenuPage.qml"
    }
}
