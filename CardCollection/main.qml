import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 480
    height: 600
    visible: true
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
                    id: columnLayout
                    anchors.fill: parent
                    spacing: 0

                    ToolBar {
                        id: toolBar
                        width: parent.width
                        height: 48
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
                                onClicked: api.searchCardByName(txtSearchBox.text)
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
                            source: cards.length > 0 ? cards[selectedIndex].imageUrl : ""
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
                        id: toolBar1
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
                    target: api
                    searchResults: function(response) {
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
