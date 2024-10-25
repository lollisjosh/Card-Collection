import QtQuick 2.13
import QtQuick.Controls.Fusion 2.15
import QtQuick.Layouts
import QtQuick.Window 2.15

ToolBar {
    id: pagingButtonsToolbar
    RowLayout {
        x: 100
        y: 20
        height: 26
        visible: true
        z: 1
        uniformCellSizes: false
        spacing: 120

        Button {
            id: button
            text: "Previous"
            Layout.fillHeight: false
            Layout.fillWidth: false
            highlighted: false
            flat: false
            font.styleName: "Bold Italic"
            enabled: selectedIndex > 0
            onClicked: {
                onPrevCard()
            }
            palette {
                button: "blue"
            }

            Rectangle {
                id: rectangle9
                color: "#00ffffff"
                radius: 3
                border.color: "#6c0101"
                border.width: 2
                anchors.fill: parent
                anchors.leftMargin: -1
                anchors.rightMargin: 0
                anchors.topMargin: -1
                anchors.bottomMargin: -1
            }
            hoverEnabled: true

            ToolTip.delay: 800
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("See the previous card in the search results.")

            // Change scale when hovered
            scale: hovered ? 1.05 : 1.0
        }

        Button {
            text: "Next"
            font.styleName: "Bold Italic"
            font.pointSize: 11
            font.bold: true
            enabled: selectedIndex < cards.length - 1
            onClicked: {
                onNextCard()
            }
            palette {
                button: "blue"
            }

            Rectangle {
                id: rectangle10
                x: -134
                y: -6
                color: "#00ffffff"
                radius: 3
                border.color: "#6c0101"
                border.width: 2
                anchors.fill: parent
                anchors.leftMargin: -1
                anchors.rightMargin: 0
                anchors.topMargin: -1
                anchors.bottomMargin: -1
            }
            hoverEnabled: true

            ToolTip.delay: 800
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("See the next card in the search results.")

            // Change scale when hovered
            scale: hovered ? 1.05 : 1.0
        }
    }

    Rectangle {
        id: rectangle
        color: "#951111"
        radius: 4
        border.color: "#cc1c1c"
        border.width: 8
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        z: 0

        Rectangle {
            id: rectangle31
            color: "#00ffffff"
            radius: 3
            border.color: "#ee0000"
            border.width: 2
            anchors.fill: parent
            anchors.leftMargin: 4
            anchors.rightMargin: 4
            anchors.topMargin: 4
            anchors.bottomMargin: 4
        }
    }

    Rectangle {
        id: rectangle2
        color: "#00951111"
        radius: 3
        border.color: "#6c0101"
        border.width: 2
        anchors.fill: parent
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.topMargin: 8
        anchors.bottomMargin: 8
        z: 0
    }

    Rectangle {
        id: rectangle3
        color: "#00951111"
        radius: 4
        border.color: "#6c0101"
        border.width: 2
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        z: 0
    }

    Rectangle {
        id: rectangle11
        y: 20
        height: 25
        color: "#00951111"
        radius: 3
        border.color: "#6c0101"
        border.width: 2
        anchors.verticalCenter: rectangle.verticalCenter
        anchors.left: rectangle.right
        anchors.right: parent.right
        anchors.leftMargin: -290
        anchors.rightMargin: 190
        z: 0

        Text {
            id: _text
            y: 5
            color: "#ffffff"
            text: cards.length ? (selectedIndex + 1) + "/"
                                 + cards.length : "-/-"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: -120
            anchors.rightMargin: -120
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.styleName: "Bold Italic"
        }
    }
}
