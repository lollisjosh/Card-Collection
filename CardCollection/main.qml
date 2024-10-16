import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 480
    height: 600
    visible: true
    property alias searchToolsLower: searchToolsLower
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
                            id: searchToolsUpper
                            width: parent.width
                            height: 48
                            Layout.fillHeight: false
                            contentWidth: 200
                            contentHeight: 48
                            z: 0
                            Layout.fillWidth: true

                            RowLayout {
                                id: rowLayout
                                anchors.fill: parent
                                spacing: 5

                                ComboBox {
                                    id: setComboBox
                                    Layout.fillHeight: false
                                    Layout.fillWidth: false


                                    Component.onCompleted: {
                                        backendController.request_sets_retrieve()
                                    }

                                }
                                TextField {
                                    id: txtSearchBox
                                    width: 200
                                    height: 40
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
                            id: searchToolsLower
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            contentHeight: 29
                            Layout.fillHeight: false
                            Layout.fillWidth: true

                            RowLayout {
                                id: typeButtonRow
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.verticalCenterOffset: -3
                                anchors.horizontalCenterOffset: 0
                                anchors.horizontalCenter: parent.horizontalCenter

                                RoundButton {
                                    id: typeButton
                                    width: 28
                                    height: 28
                                    text: "+"
                                    Layout.fillWidth: false
                                    Layout.fillHeight: false
                                    checked: false
                                    checkable: true
                                }

                                RoundButton {
                                    id: typeButton1
                                    width: 28
                                    height: 28
                                    text: "+"
                                    checked: false
                                    checkable: true
                                    Layout.fillWidth: false
                                    Layout.fillHeight: false
                                }

                                RoundButton {
                                    id: typeButton2
                                    width: 28
                                    height: 28
                                    text: "+"
                                    checked: false
                                    checkable: true
                                    Layout.fillWidth: false
                                    Layout.fillHeight: false
                                }

                                RoundButton {
                                    id: typeButton3
                                    width: 28
                                    height: 28
                                    text: "+"
                                    checked: false
                                    checkable: true
                                    Layout.fillWidth: false
                                    Layout.fillHeight: false
                                }

                                RoundButton {
                                    id: typeButton4
                                    width: 28
                                    height: 28
                                    text: "+"
                                    checked: false
                                    checkable: true
                                    Layout.fillWidth: false
                                    Layout.fillHeight: false
                                }

                                RoundButton {
                                    id: typeButton5
                                    width: 28
                                    height: 28
                                    text: "+"
                                    checked: false
                                    checkable: true
                                    Layout.fillWidth: false
                                    Layout.fillHeight: false
                                }

                                RoundButton {
                                    id: typeButton6
                                    width: 28
                                    height: 28
                                    text: "+"
                                    checked: false
                                    checkable: true
                                    Layout.fillWidth: false
                                    Layout.fillHeight: false
                                }

                                RoundButton {
                                    id: typeButton7
                                    width: 28
                                    height: 28
                                    text: "+"
                                    checked: false
                                    checkable: true
                                    Layout.fillWidth: false
                                    Layout.fillHeight: false
                                }

                                RoundButton {
                                    id: typeButton8
                                    width: 28
                                    height: 28
                                    text: "+"
                                    checked: false
                                    checkable: true
                                    Layout.fillWidth: false
                                    Layout.fillHeight: false
                                }

                                RoundButton {
                                    id: typeButton9
                                    width: 28
                                    height: 28
                                    text: "+"
                                    checked: false
                                    checkable: true
                                    Layout.fillWidth: false
                                    Layout.fillHeight: false
                                }

                                RoundButton {
                                    id: typeButton10
                                    width: 28
                                    height: 28
                                    text: "+"
                                    checked: false
                                    checkable: true
                                    Layout.fillWidth: false
                                    Layout.fillHeight: false
                                }
                            }
                        }
                    }
                    Frame {
                        id: frame
                        width: 400
                        height: 472
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


