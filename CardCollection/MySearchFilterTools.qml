import QtQuick.Controls.Fusion 2.15
import QtQuick.Layouts
import QtQuick.Window 2.15
import QtQuick 2.13

ToolBar {
    id: searchFilterTools

    // Expose setsModel to the outside world
    property var setsModel

    property bool grassChecked: grassTypeButton.checked
    property bool fireChecked: fireTypeButton.checked
    property bool waterChecked: waterTypeButton.checked
    property bool lightningChecked: lightningTypeButton.checked
    property bool psychicChecked: psychicTypeButton.checked
    property bool fightingChecked: fightingTypeButton.checked
    property bool darknessChecked: darknessTypeButton.checked
    property bool metalChecked: metalTypeButton.checked
    property bool colorlessChecked: colorlessTypeButton.checked
    property bool fairyChecked: fairyTypeButton.checked
    property bool dragonChecked: dragonTypeButton.checked



    RowLayout {
        id: filtersRow
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        z: 2
        spacing: 2

        ComboBox {
            id: setComboBox
            width: 124
            height: 30
            Layout.leftMargin: 6
            Layout.preferredHeight: -1
            Layout.preferredWidth: -1
            Layout.fillHeight: false
            Layout.fillWidth: true
            displayText: "Sets"

            model: setsModel

            delegate: Item {
                width: parent ? parent.width : 0
                height: checkDelegate ? checkDelegate.height : 30

                function toggle() {
                    checkDelegate.toggle()
                }

                CheckDelegate {
                    id: checkDelegate
                    anchors.fill: parent
                    text: model.name
                    highlighted: setComboBox.highlightedIndex == index
                    checked: model.selected
                    onCheckedChanged: {
                        if (model.selected !== checked) {
                            model.selected = checked;
                        }
                    }
                }
            }

            // override space key handling to toggle items when the popup is visible
            Keys.onSpacePressed: {
                if (setComboBox.popup.visible) {
                    var currentItem = setComboBox.popup.contentItem.currentItem
                    if (currentItem) {
                        currentItem.toggle()
                        event.accepted = true
                    }
                }
            }

            Keys.onReleased: {
                if (setComboBox.popup.visible)
                    event.accepted = (event.key === Qt.Key_Space)
            }

            Component.onCompleted: {
                // Request All Sets to populate combo box
                //console.log("Requesting sets from backend...")
                backendController.request_sets_retrieve()
            }

            Connections {
                target: backendController

                function onSetsResults(response) {
                    var data = JSON.parse(response)
                    setsModel.clear(
                                ) // Clear existing items in the model

                    if (data.error) {
                        sets = [] // Clear the array of sets
                        console.log("Error in the data received from backend.")
                    } else {
                        // Collect sets into an array
                        var tempSets = []

                        data.forEach(function (set) {
                            // Collect each set object
                            tempSets.push({
                                              "name": set.name,
                                              "selected": false
                                          })
                        })

                        // Sort the array alphabetically by name
                        tempSets.sort(function (a, b) {
                            return a.name.localeCompare(
                                        b.name) // Sort using localeCompare for proper alphabetical order
                        })

                        // Append sorted sets to the model
                        tempSets.forEach(
                                    function (sortedSet) {
                                        setsModel.append(
                                                    sortedSet)
                                        //console.log("Appending set: ", sortedSet.name); // Debugging each appended set
                                    })

                        //console.log("SetsModel updated with new sets: ", setsModel.count); // Check the number of elements
                    }
                }
            }
        }
        Row {
            id: typesRow
            width: 300
            height: 30
            Layout.leftMargin: 6
            spacing: 2
            Layout.preferredWidth: -1
            Layout.preferredHeight: -1
            Layout.fillHeight: false
            Layout.fillWidth: false
            Layout.rightMargin: 6

            ListModel {
                id: typeArtModel
            }

            RoundButton {
                id: grassTypeButton
                width: 24
                height: 24
                text: ""
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                Layout.fillWidth: false
                highlighted: grassTypeButton.checked

                flat: false
                checked: false
                checkable: true
                palette {
                    button: "limegreen"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Grass")

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0
            }

            RoundButton {
                id: fireTypeButton
                width: 24
                height: 24
                text: ""
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: fireTypeButton.checked
                flat: false
                checked: false
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "red"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Fire")

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0
            }

            RoundButton {
                id: waterTypeButton
                width: 24
                height: 24
                text: ""
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: waterTypeButton.checked
                flat: false
                checked: false
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "blue"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Water")

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0
            }

            RoundButton {
                id: lightningTypeButton
                width: 24
                height: 24
                text: ""
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: lightningTypeButton.checked
                flat: false
                checked: false
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "gold"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Lightning")

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0
            }

            RoundButton {
                id: psychicTypeButton
                width: 24
                height: 24
                text: ""
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: psychicTypeButton.checked
                checked: false
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "darkviolet"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Psychic")

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0
            }

            RoundButton {
                id: fightingTypeButton
                width: 24
                height: 24
                text: ""
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: fightingTypeButton.checked
                flat: false
                checked: false
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "saddlebrown"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Fighting")

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0
            }

            RoundButton {
                id: darknessTypeButton
                width: 24
                height: 24
                text: ""
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: darknessTypeButton.checked
                flat: false
                checked: false
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "darkslategrey"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Darkness")

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0
            }

            RoundButton {
                id: metalTypeButton
                width: 24
                height: 24
                text: ""
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: metalTypeButton.checked
                flat: false
                checked: false
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "lightgrey"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Metal")

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0
            }

            RoundButton {
                id: colorlessTypeButton
                width: 24
                height: 24
                text: ""
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: colorlessTypeButton.checked
                flat: false
                checked: false
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "white"
                }

                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Colorless")

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0
            }

            RoundButton {
                id: fairyTypeButton
                width: 24
                height: 24
                text: ""
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: fairyTypeButton.checked
                flat: false
                checked: false
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "hotpink"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Fairy")

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0
            }

            RoundButton {
                id: dragonTypeButton
                width: 24
                height: 24
                text: ""
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: dragonTypeButton.checked
                flat: false
                checked: false
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "goldenrod"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Dragon")

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0
            }
        }
    }

    Rectangle {
        id: rectangle4
        color: "#00ffffff"
        radius: 1
        border.color: "#6c0101"
        border.width: 2
        anchors.fill: parent
        z: 1
    }

    Rectangle {
        id: rectangle8
        color: "#cc1c1c"
        border.color: "#00000000"
        anchors.fill: parent

        Rectangle {
            id: rectangle32
            color: "#00ffffff"
            radius: 4
            border.color: "#ee0000"
            border.width: 2
            anchors.fill: parent
            anchors.leftMargin: 3
            anchors.rightMargin: 3
            anchors.topMargin: 3
            anchors.bottomMargin: 3
        }
    }
}
