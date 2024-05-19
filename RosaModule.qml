import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts

Item {
    Rectangle {
        id: background
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#abdbe3" }
            GradientStop { position: 1.0; color: "#abdbe3" }
        }

        Rectangle {
            id: imageContainer
            anchors.centerIn: parent
            width: uploadedImage.width
            height: uploadedImage.height
            Image {
                id: uploadedImage
                anchors.fill: parent
                visible: false
            }
        }
    }

    RowLayout {
        id: rowLayout
        anchors {
            right: parent.right
            top: parent.top
            topMargin: 80
            rightMargin: 20
        }
        Button {
            text: "Upload Image"
            onClicked: {
                fileDialog.visible = true
                fileDialog.open()
            }
        }
        TextField {
            id: shortcutField
            placeholderText: "Enter keyboard shortcut"
        }
        Button {
            text: "Assign keyboard shortcut"
            onClicked: {
                // Call Python function to assign shortcut
                handlerText.assign_hotkey1(shortcutField.text)
            }
        }
    }
    Image {
            id: image
            //anchors.fill: parent
            //anchors.horizontalCenter: parent.horizontalCenter
            anchors {
                left: parent.left
                top: parent.top
                topMargin: 20
                leftMargin: 20
            }
            //fillMode: Image.PreserveAspectFit
            scale: 0.8
            width: 90
            height: 90
            fillMode: Image.PreserveAspectFit
    }

    FileDialog {
            id: fileDialog
            currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
            onAccepted: {
                image.source = selectedFile
               // console.log("uploadedImage.source:", image.source)
                imagePathUpdater.update_image_path(image.source)
            }
    }

    RowLayout {
        id: rowLayout2
        anchors {
            right: parent.right
            top: rowLayout.top
            topMargin: 90
            rightMargin: 20
        }
        Button {
            text: "Upload Image"
            onClicked: {
                fileDialog2.visible = true
                fileDialog2.open()
            }
        }
        TextField {
            id: shortcutField2
            placeholderText: "Enter keyboard shortcut"
        }
        Button {
            text: "Assign keyboard shortcut"
            onClicked: {
                // Call Python function to assign shortcut
                handlerText2.assign_hotkey2(shortcutField2.text)
            }
        }
    }
    Image {
        id: image2
        //anchors.fill: parent
        //anchors.horizontalCenter: parent.horizontalCenter
        anchors {
            left: parent.left
            top: image.top
            topMargin: 90
            leftMargin: 20
        }
        //fillMode: Image.PreserveAspectFit
        scale: 0.8
        width: 90
        height: 90
        fillMode: Image.PreserveAspectFit
    }

    FileDialog {
            id: fileDialog2
            currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
            onAccepted: {
                image2.source = selectedFile
               // console.log("uploadedImage.source:", image.source)
                imagePathUpdater2.update_image_path(image2.source)
            }
    }
}
