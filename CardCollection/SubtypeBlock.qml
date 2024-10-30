import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Window 2.15
import QtQuick.Controls.Fusion 2.15
import Qt5Compat.GraphicalEffects
import QtQuick3D


Rectangle {
    id: root
    width: 250
    height: 125
    color: blockBG

    // Exposed properties
    property color blockBG: "#ff0000"
    property color blockBorderColor:"#00ff0000"
    property color mainColor: "#c80d0d"
    property color bezelColor: "#b2b2b2"
    property color bezelBorderColor: "#616161"
    property color screenColor: "#02d20b"
    property color dimScreenColor: "#1c3e1d"
    property color screenShadeColor: "#128c17"
    property color screenHighlightColor: "#25fb2e"
    property color textColor: "#095f0c"
    property color dropTextColor: "#c5002a02"
    property color borderColor: "#6c0101"

    property alias sub1Text: subtype1Block.text
    property alias sub2Text: subtype2Block.text
    property alias sub3Text: subtype3Block.text
    property alias sub4Text: subtype4Block.text

    Flow {
        id: subtypeFlow
        anchors.fill: parent
        anchors.leftMargin: 2
        anchors.rightMargin: 2
        anchors.topMargin: 2
        anchors.bottomMargin: 2
        layoutDirection: Qt.LeftToRight
        spacing: 2
        flow: Flow.LeftToRight

        Subtype {
            id: subtype1Block
            border.color: "#6c0101"
            border.width: 2
            color: mainColor
            height: 60
            radius: 6
            visible: true
            width: 122
        }

        Subtype {
            id: subtype2Block
        }

        Subtype {
            id: subtype3Block
        }

        Subtype {
            id: subtype4Block
        }

    //     Rectangle {
    //         id: subtype2Block
    //         width: 122
    //         height: 60
    //         visible: true
    //         color: "#c80d0d"
    //         radius: 6
    //         border.color: "#6c0101"
    //         border.width: 2
    //         Rectangle {
    //             id: subtype2Bezel
    //             color: bezelColor
    //             radius: 8
    //             border.color: bezelBorderColor
    //             border.width: 2
    //             anchors.fill: parent
    //             anchors.leftMargin: 4
    //             anchors.rightMargin: 4
    //             anchors.topMargin: 4
    //             anchors.bottomMargin: 4
    //             Layout.preferredWidth: 60
    //             Layout.preferredHeight: 60
    //             Layout.fillHeight: true
    //             Layout.fillWidth: true
    //             Rectangle {
    //                 id: subtype2Screen
    //                 x: 7
    //                 y: 4
    //                 color: screenColor
    //                 radius: 4
    //                 border.color: screenShadeColor
    //                 border.width: 2
    //                 anchors.fill: parent
    //                 anchors.leftMargin: 6
    //                 anchors.rightMargin: 6
    //                 anchors.topMargin: 6
    //                 anchors.bottomMargin: 6
    //                 Text {
    //                     id: subtype2Text
    //                     color: dropTextColor
    //                     text: "Sub Type 2"
    //                     // anchors.verticalCenter: subtype2DropShadow.verticalCenter
    //                     //anchors.right: subtype2DropShadow.left
    //                     anchors.fill: parent
    //                     anchors.leftMargin: 4
    //                     anchors.rightMargin: 4
    //                     anchors.topMargin: 4
    //                     anchors.bottomMargin: 4
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                     wrapMode: Text.Wrap
    //                     z: 1
    //                     minimumPointSize: 6
    //                     minimumPixelSize: 6
    //                     fontSizeMode: Text.Fit
    //                     font.styleName: "Bold Italic"
    //                     font.pointSize: 30
    //                 }

    //                 // DropShadow {
    //                 //     id: subtype2DropShadow
    //                 //     opacity: 0.8
    //                 //     color: dropTextColor
    //                 //     radius: 3.8
    //                 //     anchors.fill: subtype2Text
    //                 //     source: subtype2Text
    //                 //     verticalOffset: 3
    //                 //     samples: 16
    //                 //     horizontalOffset: 3
    //                 // }

    //                 Text {
    //                     id: subtype2DropText
    //                     visible: false
    //                     color: textColor
    //                     text: subtype2Text.text
    //                     anchors.fill: parent
    //                     anchors.leftMargin: 4
    //                     anchors.rightMargin: 4
    //                     anchors.topMargin: 4
    //                     anchors.bottomMargin: 4
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                     wrapMode: Text.Wrap
    //                     z: 0
    //                     minimumPointSize: 6
    //                     minimumPixelSize: 6
    //                     fontSizeMode: Text.Fit
    //                     font.styleName: "Bold Italic"
    //                     font.pointSize: 30
    //                 }

    //                 Rectangle {
    //                     id: subtype2BlockHighlight
    //                     x: -8
    //                     y: -4
    //                     color: "#00ffffff"
    //                     radius: 4
    //                     border.color: screenHightlightColor
    //                     border.width: 1
    //                     anchors.fill: parent
    //                     anchors.leftMargin: 3
    //                     anchors.rightMargin: 3
    //                     anchors.topMargin: 3
    //                     anchors.bottomMargin: 3
    //                 }
    //                 clip: true
    //             }
    //         }
    //     }

    //     Rectangle {
    //         id: subtype3Block
    //         width: 122
    //         height: 60
    //         visible: true
    //         color: "#c80d0d"
    //         radius: 6
    //         border.color: "#6c0101"
    //         border.width: 2
    //         Rectangle {
    //             id: subtype3Bezel
    //             color: bezelColor
    //             radius: 8
    //             border.color: bezelBorderColor
    //             border.width: 2
    //             anchors.fill: parent
    //             anchors.leftMargin: 4
    //             anchors.rightMargin: 4
    //             anchors.topMargin: 4
    //             anchors.bottomMargin: 4
    //             Rectangle {
    //                 id: subtype3Screen
    //                 x: 7
    //                 y: 4
    //                 color: screenColor
    //                 radius: 4
    //                 border.color: screenShadeColor
    //                 border.width: 2
    //                 anchors.fill: parent
    //                 anchors.leftMargin: 6
    //                 anchors.rightMargin: 6
    //                 anchors.topMargin: 6
    //                 anchors.bottomMargin: 6
    //                 Text {
    //                     id: subtype3Text
    //                     color: dropTextColor
    //                     text: "Sub Type 3"
    //                     //anchors.verticalCenter: subtype3DropShadow.verticalCenter
    //                     //anchors.right: subtype3DropShadow.left
    //                     anchors.fill: parent
    //                     anchors.leftMargin: 4
    //                     anchors.rightMargin: 4
    //                     anchors.topMargin: 4
    //                     anchors.bottomMargin: 4
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                     wrapMode: Text.Wrap
    //                     z: 1
    //                     minimumPointSize: 6
    //                     minimumPixelSize: 6
    //                     fontSizeMode: Text.Fit
    //                     font.styleName: "Bold Italic"
    //                     font.pointSize: 30
    //                 }

    //                 // DropShadow {
    //                 //     id: subtype3DropShadow
    //                 //     opacity: 0.8
    //                 //     color: textColor
    //                 //     radius: 3.8
    //                 //     anchors.fill: subtype3Text
    //                 //     source: subtype3Text
    //                 //     verticalOffset: 3
    //                 //     samples: 16
    //                 //     horizontalOffset: 3
    //                 // }

    //                 Text {
    //                     id: subtype3DropText
    //                     visible: false
    //                     color: textColor
    //                     text: "Sub Type 3"
    //                     anchors.fill: parent
    //                     anchors.leftMargin: 4
    //                     anchors.rightMargin: 4
    //                     anchors.topMargin: 4
    //                     anchors.bottomMargin: 4
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                     wrapMode: Text.Wrap
    //                     z: 0
    //                     minimumPointSize: 6
    //                     minimumPixelSize: 6
    //                     fontSizeMode: Text.Fit
    //                     font.styleName: "Bold Italic"
    //                     font.pointSize: 30
    //                 }

    //                 Rectangle {
    //                     id: subtype3BlockHighlight
    //                     x: -8
    //                     y: -4
    //                     color: "#00ffffff"
    //                     radius: 4
    //                     border.color: screenHightlightColor
    //                     border.width: 1
    //                     anchors.fill: parent
    //                     anchors.leftMargin: 3
    //                     anchors.rightMargin: 3
    //                     anchors.topMargin: 3
    //                     anchors.bottomMargin: 3
    //                 }
    //                 clip: true
    //             }
    //             Layout.preferredWidth: 60
    //             Layout.preferredHeight: 60
    //             Layout.fillWidth: true
    //             Layout.fillHeight: true
    //         }
    //     }

    //     Rectangle {
    //         id: subtype4Block
    //         width: 122
    //         height: 60
    //         visible: true
    //         color: "#c80d0d"
    //         radius: 6
    //         border.color: "#6c0101"
    //         border.width: 2

    //         Rectangle {
    //             id: subtype4Bezel
    //             color: bezelColor
    //             radius: 8
    //             border.color: bezelBorderColor
    //             border.width: 2
    //             anchors.fill: parent
    //             anchors.leftMargin: 4
    //             anchors.rightMargin: 4
    //             anchors.topMargin: 4
    //             anchors.bottomMargin: 4
    //             Rectangle {
    //                 id: subtype4Screen
    //                 x: 7
    //                 y: 4
    //                 color: screenColor
    //                 radius: 4
    //                 border.color: screenShadeColor
    //                 border.width: 2
    //                 anchors.fill: parent
    //                 anchors.leftMargin: 6
    //                 anchors.rightMargin: 6
    //                 anchors.topMargin: 6
    //                 anchors.bottomMargin: 6
    //                 Text {
    //                     id: subtype4Text
    //                     color: dropTextColor
    //                     text: "Sub Type 4"
    //                     //                                       anchors.right: subtype4DropShadow.left
    //                     anchors.fill: parent
    //                     anchors.leftMargin: 4
    //                     anchors.rightMargin: 4
    //                     anchors.topMargin: 4
    //                     anchors.bottomMargin: 4
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                     wrapMode: Text.Wrap
    //                     z: 1
    //                     minimumPointSize: 6
    //                     minimumPixelSize: 6
    //                     fontSizeMode: Text.Fit
    //                     font.styleName: "Bold Italic"
    //                     font.pointSize: 30
    //                 }

    //                 // DropShadow {
    //                 //     id: subtype4DropShadow
    //                 //     opacity: 0.8
    //                 //     color: textColor
    //                 //     radius: 3.8
    //                 //     anchors.fill: subtype4Text
    //                 //     source: subtype4Text
    //                 //     verticalOffset: 3
    //                 //     samples: 16
    //                 //     horizontalOffset: 3
    //                 // }

    //                 Text {
    //                     id: subtype4DropText
    //                     visible: false
    //                     color: textColor
    //                     text: "Sub Type 3"
    //                     anchors.fill: parent
    //                     anchors.leftMargin: 4
    //                     anchors.rightMargin: 4
    //                     anchors.topMargin: 4
    //                     anchors.bottomMargin: 4
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                     wrapMode: Text.Wrap
    //                     z: 0
    //                     minimumPointSize: 6
    //                     minimumPixelSize: 6
    //                     fontSizeMode: Text.Fit
    //                     font.styleName: "Bold Italic"
    //                     font.pointSize: 30
    //                 }

    //                 Rectangle {
    //                     id: subtype4BlockHighlight
    //                     x: -8
    //                     y: -4
    //                     color: "#00ffffff"
    //                     radius: 4
    //                     border.color: screenHightlightColor
    //                     border.width: 1
    //                     anchors.fill: parent
    //                     anchors.leftMargin: 3
    //                     anchors.rightMargin: 3
    //                     anchors.topMargin: 3
    //                     anchors.bottomMargin: 3
    //                 }
    //                 clip: true
    //             }
    //             Layout.preferredWidth: 60
    //             Layout.preferredHeight: 60
    //             Layout.fillWidth: true
    //             Layout.fillHeight: true
    //         }

    //     }

    }

    Item {
        id: __materialLibrary__
    }
}
