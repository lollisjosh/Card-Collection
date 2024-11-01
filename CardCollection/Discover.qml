import QtQuick 2.13
import QtQuick.Controls
import QtQuick.Layouts

Item { // Page 2: Discover Page

    id: discoverPage
    width: 600
    height: 600
    Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
    Layout.preferredWidth: 600
    Layout.preferredHeight: 600
    Layout.fillHeight: false
    Layout.fillWidth: false


    // Define color scheme properties
    property color primaryColor: "#c80d0d"
    property color blockBG: "#ff0000"
    property color deepBG: "#541515"
    property color blockBorderHightlight: "#ee0000"
    property color bezelColor: "#b2b2b2"
    property color bezelBorderColor: "#616161"
    property color screenColor: "#02d20b"
    property color screenShadeColor: "#128c17"
    property color screenHighlightColor: "#25fb2e"
    property color textColor: "#095f0c"
    property color dropTextColor: "#c5002a02"
    property color borderColor: "#6c0101"
    property color dropBorderColor: "#25fb2e"

    Column {
        id: column
        x: 0
        y: 0
        width: 600
        height: 600
        z: 1



        Rectangle {
            id: rectangle27
            height: 20
            color: "#ffffff"
            border.width: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            Rectangle {
                id: rectangle28
                y: -600
                color: "#951111"
                radius: 4
                border.color: "#cc1c1c"
                border.width: 8
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                z: 0
            }

            Rectangle {
                id: rectangle29
                color: "#00951111"
                radius: 3
                border.color: "#6c0101"
                border.width: 2
                anchors.fill: parent
                z: 0
            }

            Rectangle {
                id: rectangle30
                color: "#00951111"
                radius: 4
                border.color: "#6c0101"
                border.width: 2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 5
                anchors.bottomMargin: 4
                z: 0
            }

            Rectangle {
                id: rectangle31
                y: 20
                color: "#00951111"
                radius: 3
                border.color: "#6c0101"
                border.width: 2
                anchors.fill: parent
                z: 0
            }
        }

        Rectangle {
            id: rectangle4
            height: 440
            visible: true
            color: deepBG
            radius: 0
            border.color: primaryColor
            border.width: 8
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            z: 0
        }


        Rectangle {
            id: rectangle6
            height: 70
            opacity: 1
            color: "#00ffffff"
            border.width: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0

            MySearchFilterTools {
                id: searchFilterTools
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Layout.topMargin: 0
                //toolbarContentHeight: 30
                height: 70
                color: "#00ff0000"
                border.color: "#006c0101"
                blockBorderWidth: 4
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                toolsFillColor: deepBG
                mainColor: "#790000"
                toolsBorderColor: primaryColor
                z: 2
                Layout.preferredWidth: 500

                // Dynamic ListModel for sets
                setsModel: ListModel {
                    id: setsModel
                }
            }
        }


        Rectangle {
            id: rectangle17
            height: 10
            color: "#ffffff"
            border.width: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            Rectangle {
                id: rectangle18
                y: -600
                color: "#ee0000"
                radius: 0
                border.color: "#cc1c1c"
                border.width: 2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                z: 0
                Rectangle {
                    id: rectangle103
                    color: deepBG
                    radius: 3
                    border.color: "#ee0000"
                    border.width: 1
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 5
                    anchors.rightMargin: 5
                    anchors.topMargin: 4
                    anchors.bottomMargin: 4
                }
            }

            Rectangle {
                id: rectangle19
                color: "#00951111"
                radius: 0
                border.color: "#6c0101"
                border.width: 1
                anchors.fill: parent
                z: 0
            }

            Rectangle {
                id: rectangle20
                color: "#541515"
                radius: 2
                border.color: "#ee0000"
                border.width: 0
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 3
                anchors.rightMargin: 3
                anchors.topMargin: 3
                anchors.bottomMargin: 3
                z: 0
            }

            Rectangle {
                id: rectangle21
                y: 20
                color: "#00951111"
                radius: 2
                border.color: "#6c0101"
                border.width: 1
                anchors.fill: parent
                z: 0
            }
        }

        Rectangle {
            id: rectangle
            width: 600
            height: 50
            color: "#ee0000"
            border.color: borderColor
            border.width: 2
            Row {
                id: searchRow
                height: 25
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.verticalCenterOffset: 1
                z: 1
                spacing: 82

            }

            Rectangle {
                id: rectangle1
                color: "#541515"
                radius: 8
                border.color: "#ee0000"
                border.width: 1
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 4
            }

            ComboBox {
                id: setComboBox
                y: 8
                height: 25
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: btnSearch.left
                //anchors.left: parent.left
                //anchors.right: txtSearchBox.left
                anchors.leftMargin: 25
                anchors.rightMargin: 65
                Layout.leftMargin: 6
                Layout.preferredHeight: -1
                Layout.preferredWidth: -1
                //Layout.fillHeight: false
                //Layout.fillWidth: true
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

            Button {
                id: btnSearch
                x: 385
                y: 8
                width: 181
                height: 25
                text: qsTr("Discover")
                anchors.verticalCenter: parent.verticalCenter
                //   anchors.right: parent.right
                //  anchors.rightMargin: -585
                z: 1
                font.styleName: "Bold Italic"
                // Layout.fillHeight: false
                // Layout.rightMargin: 6
                //Layout.fillWidth: false
                palette {
                    button: "blue"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Search the database with the selected filters")

                // Change scale when hovered
                scale: hovered ? 1.05 : 1.0

                onClicked: {
                    // Initialize an empty array for the search parameters
                    var searchParams = []

                    // Check if the search box is not empty
                    if (txtSearchBox.text.trim() !== "") {
                        // Create a tuple with the entered name
                        searchParams.push(
                                    ['', 'name', txtSearchBox.text])
                    }

                    // Collecting selected items from the ComboBox
                    for (var i = 0; i < setsModel.count; i++) {
                        var item = setsModel.get(i)
                        if (item.selected) {
                            // Build the tuple for each selected set item
                            searchParams.push(
                                        ['set', 'name', item.name])
                        }
                    }

                    // Check the state of each Pokémon TCG type button and add to search parameters if checked
                    if (searchFilterTools.fireChecked) {
                        searchParams.push(
                                    ['types', '', 'fire'])
                    }
                    if (searchFilterTools.waterChecked) {
                        searchParams.push(
                                    ['types', '', 'water'])
                    }
                    if (searchFilterTools.grassChecked) {
                        searchParams.push(
                                    ['types', '', 'grass'])
                    }
                    if (searchFilterTools.lightningChecked) {
                        searchParams.push(
                                    ['types', '', 'lightning'])
                    }
                    if (searchFilterTools.psychicChecked) {
                        searchParams.push(
                                    ['types', '', 'psychic'])
                    }
                    if (searchFilterTools.fightingChecked) {
                        searchParams.push(
                                    ['types', '', 'fighting'])
                    }
                    if (searchFilterTools.darknessChecked) {
                        searchParams.push(
                                    ['types', '', 'darkness'])
                    }
                    if (searchFilterTools.fairyChecked) {
                        searchParams.push(
                                    ['types', '', 'fairy'])
                    }
                    if (searchFilterTools.dragonChecked) {
                        searchParams.push(
                                    ['types', '', 'dragon'])
                    }
                    if (searchFilterTools.metalChecked) {
                        searchParams.push(
                                    ['types', '', 'metal'])
                    }
                    if (searchFilterTools.colorlessChecked) {
                        searchParams.push(
                                    ['types', '', 'colorless'])
                    }

                    // Call the request_search function with the built tuples if there are any
                    if (searchParams.length > 0) {
                        //Print each tuple as a string to the console
                        for (var paramIndex = 0; paramIndex < searchParams.length; paramIndex++) {
                            var tupleString = "[" + searchParams[paramIndex][0] + ", "
                                    + searchParams[paramIndex][1] + ", "
                                    + searchParams[paramIndex][2] + "]"
                        }
                        backendController.request_search(
                                    searchParams)
                        resetLeftColumnScroll()
                    }
                }
            }
        }

        Rectangle {
            id: rectangle22
            height: 10
            color: "#ffffff"
            border.width: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            Rectangle {
                id: rectangle23
                y: -600
                color: "#ee0000"
                radius: 0
                border.color: "#cc1c1c"
                border.width: 2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                z: 0
                Rectangle {
                    id: rectangle104
                    color: deepBG
                    radius: 3
                    border.color: "#ee0000"
                    border.width: 1
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 5
                    anchors.rightMargin: 5
                    anchors.topMargin: 4
                    anchors.bottomMargin: 4
                }
            }

            Rectangle {
                id: rectangle24
                color: "#00951111"
                radius: 0
                border.color: "#6c0101"
                border.width: 1
                anchors.fill: parent
                z: 0
            }

            Rectangle {
                id: rectangle25
                color: "#541515"
                radius: 2
                border.color: "#ee0000"
                border.width: 0
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 3
                anchors.rightMargin: 3
                anchors.topMargin: 3
                anchors.bottomMargin: 3
                z: 0
            }

            Rectangle {
                id: rectangle26
                y: 20
                color: "#00951111"
                radius: 2
                border.color: "#6c0101"
                border.width: 1
                anchors.fill: parent
                z: 0
            }
        }





        // Rectangle {
        //     id: rectangle13
        //     height: 60
        //     color: window.primaryColor
        //     border.width: 0
        //     anchors.left: parent.left
        //     anchors.right: parent.right
        //     anchors.leftMargin: 0
        //     anchors.rightMargin: 0

        //     Rectangle {
        //         id: rectangle5
        //         width: 354
        //         color: window.blockBG
        //         border.color: window.borderColor
        //         radius: 8
        //         border.width: 2
        //         anchors.left: parent.left
        //         anchors.top: parent.top
        //         anchors.bottom: parent.bottom
        //         anchors.leftMargin: 6
        //         anchors.topMargin: 4
        //         anchors.bottomMargin: 4

        //         ComboBox {
        //             id: setComboBox1
        //             x: 16
        //             height: 30
        //             anchors.verticalCenter: parent.verticalCenter
        //             anchors.left: parent.left
        //             anchors.right: parent.right
        //             anchors.leftMargin: 6
        //             anchors.rightMargin: 6
        //             model: mySearchFilterTools.setsModel
        //             displayText: "Sets"
        //             delegate: Item {
        //                 width: parent ? parent.width : 0
        //                 height: checkDelegate1 ? checkDelegate1.height : 30
        //                 CheckDelegate {
        //                     id: checkDelegate1
        //                     text: model.name
        //                     anchors.fill: parent
        //                     onCheckedChanged: {
        //                         if (model.selected !== checked) {
        //                             model.selected = checked;
        //                         }
        //                     }
        //                     highlighted: setComboBox1.highlightedIndex == index
        //                     checked: model.selected
        //                 }
        //             }
        //             Connections {
        //                 target: backendController
        //             }
        //             Layout.preferredWidth: -1
        //             Layout.preferredHeight: -1
        //             Layout.leftMargin: 6
        //         }

        //         Rectangle {
        //             id: rectangle8
        //             x: 6
        //             y: 10
        //             width: 315
        //             height: 32
        //             color: "#00ffffff"
        //             radius: 2
        //             border.color: borderColor
        //             border.width: 2
        //             anchors.right: rectangle5.right
        //             anchors.leftMargin: 6
        //             anchors.rightMargin: 6
        //             anchors.left: rectangle5.left

        //         }
        //     }

        //     Button {
        //         id: btnDiscover
        //         height: 25
        //         text: qsTr("Discover")
        //         anchors.verticalCenter: parent.verticalCenter
        //         anchors.left: rectangle5.right
        //         anchors.right: parent.right
        //         anchors.leftMargin: 40
        //         anchors.rightMargin: 30
        //         //   anchors.right: parent.right
        //         //  anchors.rightMargin: -585
        //         z: 1
        //         font.styleName: "Bold Italic"
        //         // Layout.fillHeight: false
        //         // Layout.rightMargin: 6
        //         //Layout.fillWidth: false
        //         palette {
        //             button: "blue"
        //         }
        //         hoverEnabled: true

        //         ToolTip.delay: 800
        //         ToolTip.timeout: 5000
        //         ToolTip.visible: hovered
        //         ToolTip.text: qsTr("Search the database with the selected filters")

        //         // Change scale when hovered
        //         scale: hovered ? 1.05 : 1.0

        //         onClicked: {
        //             // Initialize an empty array for the search parameters
        //             var searchParams = []

        //             var setsParams = [];
        //             // Collecting selected items from the ComboBox
        //             for (var i = 0; i < mySearchFilterTools.setsModel.count; i++) {
        //                 var item = mySearchFilterTools.setsModel.get(i)
        //                 if (item.selected) {
        //                     // Build the tuple for each selected set item
        //                     setsParams.push(
        //                                 ['set', 'name', item.name])
        //                 }
        //             }

        //             if(setsParams.length === 0) {
        //                 for (var setIdx = 0; setIdx < mySearchFilterTools.setsModel.count; setIdx++) {
        //                     var setItem = mySearchFilterTools.setsModel.get(setIdx)
        //                     setsParams.push(
        //                                 ['set', 'name', setItem.name])

        //                 }
        //             }

        //             var typesParams = [];
        //             // Check the state of each Pokémon TCG type button and add to search parameters if checked
        //             if (searchFilterTools.fireChecked) {
        //                 typesParams.push(
        //                             ['types', '', 'fire'])
        //             }
        //             if (searchFilterTools.waterChecked) {
        //                 typesParams.push(
        //                             ['types', '', 'water'])
        //             }
        //             if (searchFilterTools.grassChecked) {
        //                 typesParams.push(
        //                             ['types', '', 'grass'])
        //             }
        //             if (searchFilterTools.lightningChecked) {
        //                 typesParams.push(
        //                             ['types', '', 'lightning'])
        //             }
        //             if (searchFilterTools.psychicChecked) {
        //                 typesParams.push(
        //                             ['types', '', 'psychic'])
        //             }
        //             if (searchFilterTools.fightingChecked) {
        //                 typesParams.push(
        //                             ['types', '', 'fighting'])
        //             }
        //             if (searchFilterTools.darknessChecked) {
        //                 typesParams.push(
        //                             ['types', '', 'darkness'])
        //             }
        //             if (searchFilterTools.fairyChecked) {
        //                 typesParams.push(
        //                             ['types', '', 'fairy'])
        //             }
        //             if (searchFilterTools.dragonChecked) {
        //                 typesParams.push(
        //                             ['types', '', 'dragon'])
        //             }
        //             if (searchFilterTools.metalChecked) {
        //                 typesParams.push(
        //                             ['types', '', 'metal'])
        //             }
        //             if (searchFilterTools.colorlessChecked) {
        //                 typesParams.push(
        //                             ['types', '', 'colorless'])
        //             }

        //             if(typesParams.length === 0) {
        //                 typesParams.push(['types', '', 'fire']);
        //                 typesParams.push(['types', '', 'grass']);
        //                 typesParams.push(['types', '', 'water']);
        //                 typesParams.push(['types', '', 'lightning']);
        //                 typesParams.push(['types', '', 'fighting']);
        //                 typesParams.push(['types', '', 'psychic']);
        //                 typesParams.push(['types', '', 'darkness']);
        //                 typesParams.push(['types', '', 'metal']);
        //                 typesParams.push(['types', '', 'fairy']);
        //                 typesParams.push(['types', '', 'dragon']);
        //                 typesParams.push(['types', '', 'colorless']);
        //             }

        //             // console.log(nameParams);
        //             // console.log(setsParams);
        //             // console.log(typesParams)

        //             searchParams = searchParams.concat(typesParams);
        //             searchParams = searchParams.concat(setsParams);

        //             //console.log(searchParams)


        //             // Call the request_search function with the built tuples if there are any
        //             if (searchParams.length > 0) {
        //                 //Print each tuple as a string to the console
        //                 for (var paramIndex = 0; paramIndex < searchParams.length; paramIndex++) {
        //                     var tupleString = "[" + searchParams[paramIndex][0] + ", "
        //                             + searchParams[paramIndex][1] + ", "
        //                             + searchParams[paramIndex][2] + "]"
        //                 }
        //                 backendController.request_discover(
        //                             searchParams)
        //             }
        //         }
        //     }
        // }


    }

    Connections {
        target: backendController
        function discoverResults(response) {
            var data = JSON.parse(response)
            if (data.error) {
                cards = []
            } else {
                cards = data.map(card => ({
                                              "name": card.name,
                                              "imageUrl": card.imageUrl
                                                          || ""
                                          }))
                selectedIndex = 0 // Start with the first card
            }
        }
    }


    Rectangle {
        id: rectangle14
        color: blockBG
        anchors.fill: parent
        border.color: borderColor
    }
    // Page content for browsePage
}

