import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Window 2.15
import QtQuick.Controls.Fusion 2.15
import Qt5Compat.GraphicalEffects


Rectangle {
    id: block



    // Define color scheme properties
    property color primaryColor: "#c80d0d"
    property color blockBG: "#ff0000"
    property color bezelColor: "#b2b2b2"
    property color bezelBorderColor: "#616161"
    property color screenColor: "#02d20b"
    property color screenShadeColor: "#128c17"
    property color screenHighlightColor: "#25fb2e"
    property color textColor: "#095f0c"
    property color dropTextColor: "#c5002a02"
    property color borderColor: "#6c0101"
    property color dropBorderColor: "#25fb2e"

    property alias imageSource: blockImage.source
    property alias infoBlockText: blockText.text

    property alias blockWidth: block.width
    property alias blockHeight: block.height


    width: 60
    height: 60


    color: blockBG
    radius: 8
    border.color: borderColor
    border.width: 2

    Rectangle {
        id: blockBezel
        color: bezelColor
        radius: 8
        border.color: bezelBorderColor
        border.width: 2
        anchors.fill: parent
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        anchors.topMargin: 4
        anchors.bottomMargin: 4
        state: "base state4"

        Rectangle {
            id: blockScreen
            x: 8
            y: -1
            color: screenColor
            radius: 8
            border.color: screenShadeColor
            border.width: 2
            anchors.fill: parent
            anchors.leftMargin: 4
            anchors.rightMargin: 4
            anchors.topMargin: 4
            anchors.bottomMargin: 4
            clip: true

            Text {
                id: blockText
                color: dropTextColor
                text: "Text"
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 4
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                lineHeight: 0.8
                wrapMode: Text.Wrap
                minimumPointSize: 6
                minimumPixelSize: 6
                font.family: "Ubuntu Sans"
                z: 0
                font.styleName: "ExtraBold Italic"
                font.italic: false
                font.bold: false
                font.pointSize: 10
                fontSizeMode: Text.Fit
            }

            Image {
                id: blockImage
                anchors.verticalCenter: blockText.verticalCenter
                anchors.right: parent.right
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 4
                source: (selectedIndex >= 0
                         && selectedIndex < cards.length) ? cards[selectedIndex].setLogo : ""
                z: 1

                scale: 1
                fillMode: Image.PreserveAspectFit
            }
            // Apply a DropShadow effect to the image
            DropShadow {
                anchors.fill: blockImage
                source: blockImage // The image to which we are applying the shadow
                horizontalOffset: 5 // Adjust X-axis shadow offset
                verticalOffset: 5 // Adjust Y-axis shadow offset
                radius: 3.8 // Blur effect, adjust for smoothness
                samples: 16 // Higher value for smoother shadows
                color: textColor // Color of the shadow
                opacity: 0.8 // Transparency of the shadow
            }

            Text {
                id: blockDropText
                x: 1
                y: 2
                visible: false
                color: textColor
                text: blockText.text
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: -4
                anchors.topMargin: 4
                anchors.bottomMargin: -4
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                lineHeight: 0.8
                wrapMode: Text.Wrap
                z: 0
                fontSizeMode: Text.Fit
                font.styleName: "ExtraBold Italic"
                font.pointSize: 32
                font.italic: false
                font.family: "Ubuntu Sans"
                font.bold: false
            }

            Rectangle {
                id: blockScreenHighlight
                x: -13
                y: -9
                color: "#00ffffff"
                radius: 8
                border.color: screenHighlightColor
                border.width: 2
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 4
                state: "base state6"
            }
        }
    }

    Item {
        id: __materialLibrary__
    }
}
