import QtQuick 2.1
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Window 2.15
import QtQuick.Controls.Fusion 2.15

Window {
    id: window
    width: 480
    height: 600
    visible: true
    title: qsTr("Card Collection")
    
    
    property int selectedIndex: -1
    property var cards: []  // List of card objects
    property int selectedTabIndex: 0
    
    // StackLayout to switch between pages
    
    ColumnLayout {
        id: columnLayout1
        anchors.fill: parent
        spacing: 0
        
        // TabBar for navigation
        TabBar {
            id: tabBar
            Layout.fillWidth: true
            currentIndex: selectedTabIndex
            width: parent.width
            Layout.preferredHeight: parent.height * 0.08
            height: 50
            
            TabButton {
                text: "Search"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                onClicked: {
                    selectedTabIndex = 0
                    stackLayout.currentIndex = selectedTabIndex
                }
            }
            TabButton {
                text: "Discover"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                onClicked: {
                    selectedTabIndex = 1
                    stackLayout.currentIndex = selectedTabIndex
                }
            }
            TabButton {
                text: "Collection"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                onClicked: {
                    selectedTabIndex = 2
                    stackLayout.currentIndex = selectedTabIndex
                }
            }
        }
        
        StackLayout {
            id: stackLayout
            visible: true
            Layout.fillHeight: true
            Layout.fillWidth: true
            currentIndex: selectedTabIndex
            clip: false
            
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
                            id: searchFilterTools
                            width: 480
                            Layout.topMargin: 6
                            verticalPadding: 0.6
                            Layout.fillHeight: false
                            Layout.fillWidth: true
                            contentHeight: 30
                            
                            RowLayout {
                                id: filtersRow
                                width: 480
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.verticalCenterOffset: -2
                                anchors.horizontalCenterOffset: 0
                                anchors.horizontalCenter: parent.horizontalCenter
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

                                    // Dynamic ListModel for sets
                                    model: ListModel {
                                        id: setsModel
                                    }

                                    delegate: Item {
                                        width: parent ? parent.width : 0
                                        height: checkDelegate ? checkDelegate.height : 30

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
                                        // Request All Sets to populate combo box
                                        //console.log("Requesting sets from backend...")
                                        backendController.request_sets_retrieve()
                                    }

                                    // Connection to receive setsResults from backendController
                                    Connections {
                                        target: backendController
                                        function onSetsResults(response) {
                                            var data = JSON.parse(response);
                                            //console.log("Received sets from backend: ", data); // Debugging the received data

                                            setsModel.clear(); // Clear existing items in the model
                                            //console.log("Model cleared");

                                            if (data.error) {
                                                sets = [];
                                                //console.log("Error in the data received from backend.");
                                            } else {
                                                // Populate the model with new data
                                                data.forEach(function(set) {
                                                    //console.log("Appending set: ", set.name); // Debugging each appended set
                                                    setsModel.append({ "name": set.name, "selected": false });
                                                });

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

                                TextField {
                                    id: txtSearchBox
                                    width: 200
                                    height: 36
                                    Layout.leftMargin: 6
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
                                    Layout.rightMargin: 6
                                    Layout.fillWidth: false
                                    onClicked: {
                                        // Initialize an empty array for the search parameters
                                        var searchParams = [];

                                        // Check if the search box is not empty
                                        if (txtSearchBox.text.trim() !== "") {
                                            // Create a tuple with the entered name
                                            searchParams.push(['', 'name', txtSearchBox.text]);
                                        }

                                        // Collecting selected items from the ComboBox
                                        for (var i = 0; i < setsModel.count; i++) {
                                            var item = setsModel.get(i);
                                            if (item.selected) {
                                                // Build the tuple for each selected set item
                                                searchParams.push(['set', 'name', item.name]);
                                            }
                                        }

                                        // Check the state of each Pokémon TCG type button and add to search parameters if checked
                                        if (fireTypeButton.checked) {
                                            searchParams.push(['types', '', 'fire']);
                                        }
                                        if (waterTypeButton.checked) {
                                            searchParams.push(['types', '', 'water']);
                                        }
                                        if (grassTypeButton.checked) {
                                            searchParams.push(['types', '', 'grass']);
                                        }
                                        if (lightningTypeButton.checked) {
                                            searchParams.push(['types', '', 'lightning']);
                                        }
                                        if (psychicTypeButton.checked) {
                                            searchParams.push(['types', '', 'psychic']);
                                        }
                                        if (fightingTypeButton.checked) {
                                            searchParams.push(['types', '', 'fighting']);
                                        }
                                        if (darknessTypeButton.checked) {
                                            searchParams.push(['types', '', 'darkness']);
                                        }
                                        if (fairyTypeButton.checked) {
                                            searchParams.push(['types', '', 'fairy']);
                                        }
                                        if (dragonTypeButton.checked) {
                                            searchParams.push(['types', '', 'dragon']);
                                        }
                                        if (metalTypeButton.checked) {
                                            searchParams.push(['types', '', 'metal']);
                                        }
                                        if (colorlessTypeButton.checked) {
                                            searchParams.push(['types', '', 'colorless']);
                                        }

                                        // Call the request_search function with the built tuples if there are any
                                        if (searchParams.length > 0) {
                                            console.log("Search Button Pressed...")
                                            console.log("Calling backendController.request_search with parameters:")
                                            //Print each tuple as a string to the console
                                            for (var i = 0; i < searchParams.length; i++) {
                                                var tupleString = "[" + searchParams[i][0] + ", " + searchParams[i][1] + ", " + searchParams[i][2] + "]";
                                                console.log(tupleString);
                                            }

                                            backendController.request_search(searchParams);
                                        }

                                    }
                                }


                            }
                        }
                    }

                    Item {
                        id: _item
                        width: 200
                        height: 200
                        Layout.fillHeight: true
                        Layout.fillWidth: true


                        // Add a boolean variable to track the drawer's state
                        property bool isDrawerOpen: false // Start with the drawer closed

                        // The main Pane with no margin or padding
                        Rectangle {
                            visible: true
                            color: "#00ccf2ff"
                            radius: 0
                            border.color: "#c80d0d"
                            border.width: 6
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            z: 3
                        }

                        Pane {
                            id: viewPane
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            topPadding: 0
                            rightPadding: 0
                            leftPadding: 0
                            verticalPadding: 6 // Padding inside the pane
                            horizontalPadding: 6 // Padding inside the pane
                            contentWidth: 468
                            contentHeight: 300
                            bottomPadding: 0
                            Layout.margins: 0 // No margins for the pane
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            // Border Rectangle around the Pane
                            Rectangle {
                                visible: true
                                anchors.fill: parent
                                z: 0
                                color: "#6c0000" // Set background to transparent
                                border.color: "#00255864" // Darker grey color for the border
                                border.width: 0
                                radius: 0 // Optional: Set radius for rounded corners
                            }

                            // Drawer
                            Rectangle {
                                id: customDrawer
                                x: -279
                                y: 0
                                width: 280
                                height: openButton.height
                                opacity: 0.546
                                // Start hidden
                                color: "#15ba1c"
                                border.color: "#c80d0d"
                                border.width: 6
                                z: 0
                                // Light blue drawer background

                                // MouseArea for the drawer that does not toggle visibility
                                MouseArea {
                                    visible: true
                                    anchors.fill: parent
                                }

                                // Frame that holds the card image
                                Frame {
                                    id: frame
                                    anchors.fill: parent
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
                                    }                                }
                            }


                            // Trigger button to open/close drawer
                            MouseArea {
                                id: openButton
                                width: 20 // Width of the button
                                height: parent.height
                                opacity: 1
                                anchors.verticalCenter: customDrawer.verticalCenter
                                anchors.left: customDrawer.right // Keep the button attached to the right edge of the drawer
                                anchors.leftMargin: -1

                                z: 0
                                onClicked: {
                                    if (customDrawer.x < 0) {
                                        customDrawer.x = 0; // Slide in
                                        _item.isDrawerOpen = true
                                    } else {
                                        customDrawer.x = -customDrawer.width; // Slide out
                                        _item.isDrawerOpen = false
                                    }
                                }

                                // Background of the button
                                Rectangle {
                                    id: buttonBackground
                                    anchors.fill: parent
                                    color: "#c80d0d" // Background color of the button
                                    radius: 0 // Rounded corners
                                    border.color: "#620808" // Darker border for a subtle effect
                                    border.width: 0 // Thin border
                                }

                                // Circle for the caret background
                                Rectangle {
                                    width: 18
                                    height: 18
                                    color: "#6c0101" // Circle color
                                    radius: 9
                                    border.color: "#c80d0d"
                                    border.width: 2 // Make it a circle
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: -6 // Position the circle on the right side of the button
                                }

                                // Caret using text
                                Text {
                                    id: drawerButtonText
                                    text: { _item.isDrawerOpen ? "<" : ">" } // Proper QML binding expression
                                    font.pixelSize: 19
                                    font.bold: true
                                    anchors.verticalCenter: parent.verticalCenter
                                    color: "#ffffff"

                                    // Color of the caret
                                    anchors.right: buttonBackground.right
                                    anchors.rightMargin: -2 // Align with the right edge of the button

                                }
                            }
                        }

                    }






                    ToolBar {
                        id: pagingButtonsToolbar
                        height: 37
                        position: ToolBar.Header
                        contentWidth: 480
                        topPadding: 0
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        contentHeight: 32

                        RowLayout {
                            x: 130
                            y: 20
                            height: 26
                            visible: true
                            uniformCellSizes: false
                            spacing: 49

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
            }

            Connections {
                target: backendController
                function onSearchResults(response) {
                    //console.log("searchResults called with response:", response); // Check if this logs

                    var data = JSON.parse(response);
                    if (data.error) {
                        cards = [];
                    } else {
                        cards = data.map(card => ({
                                                      "name": card.name,
                                                      "imageUrl": card.imageUrl || ""
                                                  }));
                        selectedIndex = 0;  // Start with the first card
                        // Log the image URLs to the console
                        //console.log("Loaded image URLs:", cards.map(card => card.imageUrl));
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



