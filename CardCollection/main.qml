import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Window 2.15
import QtQuick.Controls.Fusion 2.15


Window {
    id: window
    width: 600
    height: 650
    minimumWidth: 600
    minimumHeight: 650
    maximumWidth: 600
    maximumHeight: 650

    visible: true
    color: borderColor

    title: qsTr("Card Collection")

    // property int selectedIndex: 0
    // property var cards: [] // List of card objects
     property int selectedTabIndex: 0

    // Define color scheme properties
    property color primaryColor: "#c80d0d"
    property color blockBG: "#ff0000"
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

   Rectangle {
        id: columnLayout1
        anchors.fill: parent

        // TabBar for navigation
        TabBar {
            id: tabBar
            Layout.fillWidth: true
            currentIndex: selectedTabIndex
            width: parent.width
            Layout.preferredHeight: parent.height * 0.08
            height: 50

            TabButton {
                opacity: 1
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                // Set button background color based on the selected index
                palette {
                    button: selectedTabIndex === 0 ? "#6c0101" : "#c80d0d" // Dark red for selected, light red for unselected
                }

                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Search by Set, Type, and Name.")

                // Use a Text element for the label
                Text {
                    text: "Search"
                    font.pointSize: 14
                    font.styleName: "Bold Italic"
                    color: selectedTabIndex
                           === 0 ? "#ffffff" : "#000000" // White for selected, black for unselected
                    anchors.centerIn: parent
                }

                onClicked: {
                    selectedTabIndex = 0
                    stackLayout.currentIndex = selectedTabIndex
                }
            }

            TabButton {
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                // Set button background color based on the selected index
                palette {
                    button: selectedTabIndex === 1 ? "#6c0101" : "#c80d0d" // Dark red for selected, light red for unselected
                }

                hoverEnabled: true
                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Discover a random card, optionally filtered by Set and Type.")

                Text {
                    text: "Discover"
                    font.pointSize: 14
                    font.styleName: "Bold Italic"
                    color: selectedTabIndex
                           === 1 ? "#ffffff" : "#000000" // White for selected, black for unselected
                    anchors.centerIn: parent
                }

                onClicked: {
                    selectedTabIndex = 1
                    stackLayout.currentIndex = selectedTabIndex
                }
            }

            TabButton {
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                // Set button background color based on the selected index
                palette {
                    button: selectedTabIndex === 2 ? "#6c0101" : "#c80d0d" // Dark red for selected, light red for unselected
                }

                hoverEnabled: true
                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Collect your favorite cards found in Search and Discover.")
                Text {
                    text: "Collection"
                    font.pointSize: 14
                    font.styleName: "Bold Italic"
                    color: selectedTabIndex
                           === 2 ? "#ffffff" : "#000000" // White for selected, black for unselected
                    anchors.centerIn: parent
                }

                onClicked: {
                    selectedTabIndex = 2
                    stackLayout.currentIndex = selectedTabIndex
                }
            }
        }

        StackLayout {
            id: stackLayout
            width: 600
            height: 600
            visible: true
            anchors.top: tabBar.bottom
            anchors.topMargin: 0
            z: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
            currentIndex: selectedTabIndex
            clip: false            

            Search {

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

            Item { // Page 2: Discover Page

                id: discoverPage
    //             width: 600
    //             height: 600
    //             Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
    //             Layout.preferredWidth: 600
    //             Layout.preferredHeight: 600
    //             Layout.fillHeight: false
    //             Layout.fillWidth: false

    //             Column {
    //                 id: column
    //                 x: 0
    //                 y: 0
    //                 width: 600
    //                 height: 600
    //                 z: 1


    //                 Rectangle {
    //                     id: rectangle4
    //                     height: 470
    //                     color: primaryColor
    //                     radius: 0
    //                     border.color: borderColor
    //                     border.width: 2
    //                     anchors.left: parent.left
    //                     anchors.right: parent.right
    //                     anchors.leftMargin: 0
    //                     anchors.rightMargin: 0
    //                 }

    //                 Rectangle {
    //                     id: rectangle6
    //                     height: 70
    //                     opacity: 1
    //                     color: window.blockBG
    //                     border.color: "#00000000"
    //                     border.width: 2
    //                     anchors.left: parent.left
    //                     anchors.right: parent.right
    //                     anchors.leftMargin: 0
    //                     anchors.rightMargin: 0

    //                     MySearchFilterTools {
    //                         id: mySearchFilterTools
    //                         width: 600
    //                         height: 60
    //                         color: window.blockBG
    //                         radius: 0
    //                         border.color: window.bezelBorderColor
    //                         border.width: 0
    //                         anchors.verticalCenter: parent.verticalCenter
    //                         anchors.horizontalCenter: parent.horizontalCenter
    //                         transparentColor: "#00000000"
    //                         textColor: window.textColor
    //                         screenShadeColor: window.screenShadeColor
    //                         screenHighlightColor: window.screenHighlightColor
    //                         screenColor: window.screenColor
    //                         mainColor: window.mainColor
    //                         dropTextColor: window.dropTextColor
    //                         dropBorderColor: window.dropBorderColor
    //                         dimScreenColor: "dark green"
    //                         borderColor: window.borderColor
    //                         bezelColor: window.bezelColor
    //                         bezelBorderColor: window.bezelBorderColor
    //                         blockBorderColor: window.borderColor
    //                         blockBG: window.blockBG

    //                         z: 0
    //                         //toolbarContentHeight: 60
    //                     }
    //                 }
    //                 Rectangle {
    //                     id: rectangle13
    //                     height: 60
    //                     color: window.primaryColor
    //                     border.width: 0
    //                     anchors.left: parent.left
    //                     anchors.right: parent.right
    //                     anchors.leftMargin: 0
    //                     anchors.rightMargin: 0

    //                     Rectangle {
    //                         id: rectangle5
    //                         width: 354
    //                         color: window.blockBG
    //                         border.color: window.borderColor
    //                         radius: 8
    //                         border.width: 2
    //                         anchors.left: parent.left
    //                         anchors.top: parent.top
    //                         anchors.bottom: parent.bottom
    //                         anchors.leftMargin: 6
    //                         anchors.topMargin: 4
    //                         anchors.bottomMargin: 4

    //                         ComboBox {
    //                             id: setComboBox1
    //                             x: 16
    //                             height: 30
    //                             anchors.verticalCenter: parent.verticalCenter
    //                             anchors.left: parent.left
    //                             anchors.right: parent.right
    //                             anchors.leftMargin: 6
    //                             anchors.rightMargin: 6
    //                             model: setsModel
    //                             displayText: "Sets"
    //                             delegate: Item {
    //                                 width: parent ? parent.width : 0
    //                                 height: checkDelegate1 ? checkDelegate1.height : 30
    //                                 CheckDelegate {
    //                                     id: checkDelegate1
    //                                     text: model.name
    //                                     anchors.fill: parent
    //                                     onCheckedChanged: {
    //                                         if (model.selected !== checked) {
    //                                             model.selected = checked;
    //                                         }
    //                                     }
    //                                     highlighted: setComboBox1.highlightedIndex == index
    //                                     checked: model.selected
    //                                 }
    //                             }
    //                             Connections {
    //                                 target: backendController
    //                             }
    //                             Layout.preferredWidth: -1
    //                             Layout.preferredHeight: -1
    //                             Layout.leftMargin: 6
    //                         }

    //                         Rectangle {
    //                             id: rectangle8
    //                             x: 6
    //                             y: 10
    //                             width: 315
    //                             height: 32
    //                             color: "#00ffffff"
    //                             radius: 2
    //                             border.color: borderColor
    //                             border.width: 2
    //                             anchors.right: rectangle5.right
    //                             anchors.leftMargin: 6
    //                             anchors.rightMargin: 6
    //                             anchors.left: rectangle5.left

    //                         }
    //                     }

    //                     Button {
    //                         id: btnDiscover
    //                         height: 25
    //                         text: qsTr("Discover")
    //                         anchors.verticalCenter: parent.verticalCenter
    //                         anchors.left: rectangle5.right
    //                         anchors.right: parent.right
    //                         anchors.leftMargin: 40
    //                         anchors.rightMargin: 30
    //                         //   anchors.right: parent.right
    //                         //  anchors.rightMargin: -585
    //                         z: 1
    //                         font.styleName: "Bold Italic"
    //                         // Layout.fillHeight: false
    //                         // Layout.rightMargin: 6
    //                         //Layout.fillWidth: false
    //                         palette {
    //                             button: "blue"
    //                         }
    //                         hoverEnabled: true

    //                         ToolTip.delay: 800
    //                         ToolTip.timeout: 5000
    //                         ToolTip.visible: hovered
    //                         ToolTip.text: qsTr("Search the database with the selected filters")

    //                         // Change scale when hovered
    //                         scale: hovered ? 1.05 : 1.0

    //                         onClicked: {
    //                             // Initialize an empty array for the search parameters
    //                             var searchParams = []

    //                             var setsParams = [];
    //                             // Collecting selected items from the ComboBox
    //                             for (var i = 0; i < setsModel.count; i++) {
    //                                 var item = setsModel.get(i)
    //                                 if (item.selected) {
    //                                     // Build the tuple for each selected set item
    //                                     setsParams.push(
    //                                                 ['set', 'name', item.name])
    //                                 }
    //                             }

    //                             if(setsParams.length === 0) {
    //                                 for (var setIdx = 0; setIdx < setsModel.count; setIdx++) {
    //                                     var setItem = setsModel.get(setIdx)
    //                                     setsParams.push(
    //                                                 ['set', 'name', setItem.name])

    //                                 }
    //                             }

    //                             var typesParams = [];
    //                             // Check the state of each Pokémon TCG type button and add to search parameters if checked
    //                             if (searchFilterTools.fireChecked) {
    //                                 typesParams.push(
    //                                             ['types', '', 'fire'])
    //                             }
    //                             if (searchFilterTools.waterChecked) {
    //                                 typesParams.push(
    //                                             ['types', '', 'water'])
    //                             }
    //                             if (searchFilterTools.grassChecked) {
    //                                 typesParams.push(
    //                                             ['types', '', 'grass'])
    //                             }
    //                             if (searchFilterTools.lightningChecked) {
    //                                 typesParams.push(
    //                                             ['types', '', 'lightning'])
    //                             }
    //                             if (searchFilterTools.psychicChecked) {
    //                                 typesParams.push(
    //                                             ['types', '', 'psychic'])
    //                             }
    //                             if (searchFilterTools.fightingChecked) {
    //                                 typesParams.push(
    //                                             ['types', '', 'fighting'])
    //                             }
    //                             if (searchFilterTools.darknessChecked) {
    //                                 typesParams.push(
    //                                             ['types', '', 'darkness'])
    //                             }
    //                             if (searchFilterTools.fairyChecked) {
    //                                 typesParams.push(
    //                                             ['types', '', 'fairy'])
    //                             }
    //                             if (searchFilterTools.dragonChecked) {
    //                                 typesParams.push(
    //                                             ['types', '', 'dragon'])
    //                             }
    //                             if (searchFilterTools.metalChecked) {
    //                                 typesParams.push(
    //                                             ['types', '', 'metal'])
    //                             }
    //                             if (searchFilterTools.colorlessChecked) {
    //                                 typesParams.push(
    //                                             ['types', '', 'colorless'])
    //                             }

    //                             if(typesParams.length === 0) {
    //                                 typesParams.push(['types', '', 'fire']);
    //                                 typesParams.push(['types', '', 'grass']);
    //                                 typesParams.push(['types', '', 'water']);
    //                                 typesParams.push(['types', '', 'lightning']);
    //                                 typesParams.push(['types', '', 'fighting']);
    //                                 typesParams.push(['types', '', 'psychic']);
    //                                 typesParams.push(['types', '', 'darkness']);
    //                                 typesParams.push(['types', '', 'metal']);
    //                                 typesParams.push(['types', '', 'fairy']);
    //                                 typesParams.push(['types', '', 'dragon']);
    //                                 typesParams.push(['types', '', 'colorless']);
    //                             }

    //                             // console.log(nameParams);
    //                             // console.log(setsParams);
    //                             // console.log(typesParams)

    //                             searchParams = searchParams.concat(typesParams);
    //                             searchParams = searchParams.concat(setsParams);

    //                             //console.log(searchParams)


    //                             // Call the request_search function with the built tuples if there are any
    //                             if (searchParams.length > 0) {
    //                                 //Print each tuple as a string to the console
    //                                 for (var paramIndex = 0; paramIndex < searchParams.length; paramIndex++) {
    //                                     var tupleString = "[" + searchParams[paramIndex][0] + ", "
    //                                             + searchParams[paramIndex][1] + ", "
    //                                             + searchParams[paramIndex][2] + "]"
    //                                 }
    //                                 backendController.request_discover(
    //                                             searchParams)
    //                             }
    //                         }
    //                     }
    //                 }
    //             }

    //             Rectangle {
    //                 id: rectangle14
    //                 y: 0
    //                 height: 600
    //                 color: window.blockBG
    //                 anchors.left: parent.left
    //                 anchors.right: parent.right
    //                 anchors.leftMargin: 0
    //                 anchors.rightMargin: 0
    //             }
    //             // Page content for browsePage
    //         }

    //         Item { // Page 3: Collection Page

    //             id: collectionPage
    //             width: parent.width
    //             height: parent.height
    //             // Page content for collectionPage
    //         }
        }
    }
    }
}


