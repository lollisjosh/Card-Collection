import QtQuick 2.1
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window 2.15
import QtQuick.Controls.Fusion 2.15

Window {
    width: 480
    height: 600
    visible: true
    property alias searchFilterTools: searchFilterTools
    title: qsTr("Card Collection")


    property int selectedIndex: -1
    property var cards: []  // List of card objects

    // StackLayout to switch between pages

    ColumnLayout {
        id: columnLayout1
        anchors.fill: parent
        spacing: 0

        // TabBar for navigation
        TabBar {
            id: tabBar
            Layout.fillWidth: true
            currentIndex: 0
            width: parent.width
            Layout.preferredHeight: parent.height * 0.08
            height: 50

            TabButton {
                text: "Search"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                onClicked: stackLayout.currentIndex = 0
            }
            TabButton {
                text: "Discover"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                onClicked: stackLayout.currentIndex = 1
            }
            TabButton {
                text: "Collection"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                onClicked: stackLayout.currentIndex = 2
            }
        }

        StackLayout {
            id: stackLayout
            visible: true
            Layout.fillHeight: true
            Layout.fillWidth: true
            currentIndex: 0
            clip: false
            z: 0

            // Page 1: Search Page
            Item {
                id: searchPage
                width: parent.width
                height: parent.height
                visible: false

                ColumnLayout {
                    id: searchTabColumn
                    anchors.fill: parent
                    spacing: 0



                    ColumnLayout {
                        id: searchToolsColumn
                        width: 100
                        height: 100
                        z: 0
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        ToolBar {
                            id: searchTools
                            width: parent.width
                            height: 48
                            Layout.fillHeight: false
                            contentWidth: 200
                            contentHeight: 48
                            z: 0
                            Layout.fillWidth: true

                            RowLayout {
                                id: searchRow
                                anchors.fill: parent
                                spacing: 5
                                // ComboBox {
                                //     id: setComboBox
                                //     displayText: ""
                                //     Layout.fillHeight: false
                                //     Layout.fillWidth: false


                                //     Component.onCompleted: {
                                //         backendController.request_sets_retrieve()
                                //     }

                                // }
                                TextField {
                                    id: txtSearchBox
                                    width: 200
                                    height: 36
                                    Layout.preferredHeight: -1
                                    Layout.preferredWidth: -1
                                    placeholderText: qsTr("Enter card name")
                                    Layout.fillWidth: true
                                }
                                Button {
                                    id: btnSearch
                                    width: 100
                                    height: 40
                                    text: qsTr("Search")
                                    Layout.fillWidth: false
                                    onClicked: {
                                        // Initialize an empty array for the search parameters
                                        var testSearchParams = [];

                                        // Check if the search box is not empty
                                        if (txtSearchBox.text.trim() !== "") {
                                            // Create a tuple with the entered name
                                            testSearchParams.push(['', 'name', txtSearchBox.text]);
                                        }

                                        // Call the request_search function with the built tuples if there are any
                                        if (testSearchParams.length > 0) {
                                            backendController.request_search(testSearchParams);
                                        }
                                    }
                                }
                            }
                        }

                        ToolBar {
                            id: searchFilterTools
                            width: 480
                            Layout.fillHeight: false
                            Layout.fillWidth: true
                            contentHeight: 30

                            RowLayout {
                                id: typeButtonRow
                                x: -6
                                y: 1
                                width: 480
                                spacing: 2


                                ComboBox {
                                    id: setComboBox
                                    width: 124
                                    height: 30
                                    Layout.leftMargin: 6
                                    Layout.preferredHeight: 24
                                    Layout.preferredWidth: 124
                                    Layout.fillHeight: false
                                    Layout.fillWidth: true
                                    displayText: "Sets"

                                    model: ListModel {
                                        ListElement { name: "One"; selected: false }
                                        ListElement { name: "Two"; selected: false }
                                        ListElement { name: "Three"; selected: false }
                                    }

                                    // ComboBox closes the popup when its items (anything AbstractButton derivative) are
                                    //  activated. Wrapping the delegate into a plain Item prevents that.
                                    delegate: Item {
                                        width: parent.width
                                        height: checkDelegate.height

                                        function toggle() { checkDelegate.toggle() }

                                        CheckDelegate {
                                            id: checkDelegate
                                            anchors.fill: parent
                                            text: model.name
                                            highlighted: setComboBox.highlightedIndex == index
                                            checked: model.selected
                                            onCheckedChanged: model.selected = checked
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
                                        backendController.request_sets_retrieve()
                                    }
                                }

                                Row {
                                    id: typesRow
                                    width: 300
                                    height: 30
                                    spacing: 2
                                    Layout.preferredWidth: -1
                                    Layout.preferredHeight: -1
                                    Layout.fillHeight: false
                                    Layout.fillWidth: false
                                    Layout.rightMargin: 6

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
                                    }
                                }



                            }
                        }
                    }
                    Pane {
                        id: viewPane
                        width: 200
                        height: 200
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        Frame {
                            id: frame
                            x: -9
                            y: 9
                            anchors.fill: parent
                            contentHeight: 472
                            contentWidth: 400
                            Layout.preferredHeight: 472
                            Layout.preferredWidth: 400
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            Image {
                                id: cardImage
                                anchors.fill: parent
                                source: (selectedIndex >= 0 && selectedIndex < cards.length)
                                        ? (cards[selectedIndex].imageUrl || "")  // Show the image URL or an empty string if not available
                                        : ""  // Show nothing initially if no valid card is selected
                                Layout.fillHeight: false
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                                Layout.preferredHeight: 500
                                Layout.preferredWidth: 480
                                Layout.fillWidth: true
                                scale: 0.75
                                fillMode: Image.PreserveAspectFit
                            }


                        }
                    }
                    ToolBar {
                        id: pagingButtonsToolbar
                        position: ToolBar.Header
                        topPadding: 0
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredHeight: 32
                        Layout.preferredWidth: 480
                        contentWidth: -1
                        contentHeight: -1

                        RowLayout {
                            height: 26
                            visible: true
                            anchors.verticalCenter: parent.verticalCenter
                            uniformCellSizes: false
                            anchors.horizontalCenterOffset: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 50

                            Button {
                                text: "Previous"
                                enabled: selectedIndex > 0
                                onClicked: {
                                    if (selectedIndex > 0) {
                                        selectedIndex--;
                                    }
                                }
                            }

                            Button {
                                text: "Next"
                                enabled: selectedIndex < cards.length - 1
                                onClicked: {
                                    if (selectedIndex < cards.length - 1) {
                                        selectedIndex++;
                                    }
                                }
                            }
                        }
                    }

                }

                ListModel {
                    id: imageModel
                    // Initial empty list

                }

                Connections {
                    target: backendController
                    function searchResults(response) {
                        var data = JSON.parse(response);
                        if (data.error) {
                            cards = [];
                        } else {
                            cards = data.map(card => ({
                                                          "name": card.name,
                                                          "imageUrl": card.imageUrl || ""
                                                      }));
                            selectedIndex = 0;  // Start with the first card
                        }
                    }
                }

                Connections {
                    target: backendController
                    function discoverResults(response) {
                        var data = JSON.parse(response);
                        if (data.error) {
                            cards = [];
                        } else {
                            cards = data.map(card => ({
                                                          "name": card.name,
                                                          "imageUrl": card.imageUrl || ""
                                                      }));
                            selectedIndex = 0;  // Start with the first card
                        }
                    }
                }





            }

            // Page 2: Browse Page

            Item {
                id: discoverPage
                width: parent.width
                height: parent.height
                // Page content for browsePage
            }

            // Page 3: Collection Page
            Item {
                id: collectionPage
                width: parent.width
                height: parent.height
                // Page content for collectionPage
            }

        }
    }
}


