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

    property int defaultBlockHeight: 125
    property int defaultBlockWidth: 250
    property int defaultSubBlockHeight: 60
    property int defaultSubBlockWidth: 125

    property alias sub1Text: subtype1Block.text
    property alias sub2Text: subtype2Block.text
    property alias sub3Text: subtype3Block.text
    property alias sub4Text: subtype4Block.text

    function updateSubTypeInfo() {
        if (cards[selectedIndex]) {
            // Set visibility for each subtype based on the card data
            subtype1Block.visible = sub1Text !== "Sub Type 1" && sub1Text !== ""
            subtype2Block.visible = sub2Text !== "Sub Type 2" && sub2Text !== ""
            subtype3Block.visible = sub3Text !== "Sub Type 3" && sub3Text !== ""
            subtype4Block.visible = sub4Text !== "Sub Type 4" && sub4Text !== ""

            const margin = 0 // Adjust as needed for spacing

            // Case 1: Only subtype1Block is visible, it should fill entire width and height
            if (subtype1Block.visible && !subtype2Block.visible && !subtype3Block.visible && !subtype4Block.visible) {
                subtype1Block.width = subtypeFlow.width - (2 * margin)
                subtype1Block.height = subtypeFlow.height - (2 * margin)

                // Case 2: Only subtype1Block and subtype2Block are visible
                // Each should take full width and half height
            } else if (subtype1Block.visible && subtype2Block.visible && !subtype3Block.visible && !subtype4Block.visible) {
                subtype1Block.width = subtypeFlow.width - (2 * margin)
                subtype2Block.width = subtypeFlow.width - (2 * margin)
                subtype1Block.height = (subtypeFlow.height / 2) - margin
                subtype2Block.height = (subtypeFlow.height / 2) - margin

                // Case 3: All four blocks are visible, each should be half width and half height
            } else if (subtype1Block.visible && subtype2Block.visible && subtype3Block.visible && subtype4Block.visible) {
                subtype1Block.width = (subtypeFlow.width / 2) - margin
                subtype2Block.width = (subtypeFlow.width / 2) - margin
                subtype3Block.width = (subtypeFlow.width / 2) - margin
                subtype4Block.width = (subtypeFlow.width / 2) - margin
                subtype1Block.height = (subtypeFlow.height / 2) - margin
                subtype2Block.height = (subtypeFlow.height / 2) - margin
                subtype3Block.height = (subtypeFlow.height / 2) - margin
                subtype4Block.height = (subtypeFlow.height / 2) - margin

                // Case 4: subtype1Block, subtype2Block, and subtype3Block are visible
                // subtype1Block should be full width and half height, subtype2Block and subtype3Block should be half width and half height
            } else if (subtype1Block.visible && subtype2Block.visible && subtype3Block.visible && !subtype4Block.visible) {
                subtype1Block.width = subtypeFlow.width - (2 * margin)
                subtype1Block.height = (subtypeFlow.height / 2) - margin
                subtype2Block.width = (subtypeFlow.width / 2) - margin
                subtype3Block.width = (subtypeFlow.width / 2) - margin
                subtype2Block.height = (subtypeFlow.height / 2) - margin
                subtype3Block.height = (subtypeFlow.height / 2) - margin

                // Default width and height when no specific layout applies
            } else {
                subtype1Block.width = defaultSubBlockWidth
                subtype2Block.width = defaultSubBlockWidth
                subtype3Block.width = defaultSubBlockWidth
                subtype4Block.width = defaultSubBlockWidth
                subtype1Block.height = defaultSubBlockHeight
                subtype2Block.height = defaultSubBlockHeight
                subtype3Block.height = defaultSubBlockHeight
                subtype4Block.height = defaultSubBlockHeight
            }

            // Adjust height for the main subtypeFlow based on visibility (to prevent overflow)
            subtypeFlow.height = defaultBlockHeight * (subtype3Block.visible || subtype4Block.visible ? 2 : 1)
        }
    }
    Flow {
        id: subtypeFlow
        anchors.fill: parent
        anchors.leftMargin: 2
        anchors.rightMargin: 2
        anchors.topMargin: 2
        anchors.bottomMargin: 2
        layoutDirection: Qt.LeftToRight
        spacing: 0
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
            border.color: "#6c0101"
            border.width: 2
            color: mainColor
            height: 60
            radius: 6
            visible: true
            width: 122
        }

        Subtype {
            id: subtype3Block
            border.color: "#6c0101"
            border.width: 2
            color: mainColor
            height: 60
            radius: 6
            visible: true
            width: 122
        }

        Subtype {
            id: subtype4Block
            border.color: "#6c0101"
            border.width: 2
            color: mainColor
            height: 60
            radius: 6
            visible: true
            width: 122
        }
    }

    Item {
        id: __materialLibrary__
    }
}
