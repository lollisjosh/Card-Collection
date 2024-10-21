import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Window 2.15
import QtQuick.Controls.Fusion 2.15

Window {
    id: window
    width: 480
    height: 600
    minimumWidth: 480
    minimumHeight: 600
    maximumWidth: 480
    maximumHeight: 600
    
    visible: true
    color: "#6c0101"
    
    title: qsTr("Card Collection")
    
    property int selectedIndex: -1
    property var cards: []  // List of card objects
    property int selectedTabIndex: 0
    
    // StackLayout to switch between pages

    // Function to update attack information based on selectedIndex
    function updateAttackInfo() {
        if (cards[selectedIndex]) {
            // Update attack text fields first
            attack1Name.text = cards[selectedIndex].attack1Name || "Attack 1";
            attack1DescriptionDropText.text = cards[selectedIndex].attack1Desc || "No description available."; // Fallback if no description

            attack2NameText.text = cards[selectedIndex].attack2Name || "Attack 2";
            attack2DescriptionText.text = cards[selectedIndex].attack2Desc || "No description available."; // Fallback if no description

            attack3NameText.text = cards[selectedIndex].attack3Name || "Attack 3";
            attack3DescriptionText.text = cards[selectedIndex].attack3Desc || "No description available."; // Fallback if no description

            // Set visibility for each attack based on the card data
            attack1NameBlock.visible = cards[selectedIndex].attack1Name !== "Attack 1" && cards[selectedIndex].attack1Name !== "";
            attack1DescriptionBlock.visible = attack1NameBlock.visible;

            attack2NameBlock.visible = cards[selectedIndex].attack2Name !== "Attack 2" && cards[selectedIndex].attack2Name !== "";
            attack2DescriptionBlock.visible = attack2NameBlock.visible;

            attack3NameBlock.visible = cards[selectedIndex].attack3Name !== "Attack 3" && cards[selectedIndex].attack3Name !== "";
            attack3DescriptionBlock.visible = attack3NameBlock.visible;

            // Update attackContainer visibility based on attack blocks
            if(attack1NameBlock.visible || attack2NameBlock.visible || attack3NameBlock.visible) {
                attackContainer.height = 500;
            }else {
                attackContainer.height = 0;
            }

        }
    }










    
    function updateAbilityInfo() {
        if (selectedIndex >= 0 && selectedIndex < cards.length) {
            var card = cards[selectedIndex];
            
            // Update UI elements for abilities
            ability1NameText.text = card.ability1Name || "Ability 1";
            ability1DescriptionDropText.text = card.ability1Desc || "No description available.";
            ability1TypeText.text = card.ability1Type || "N/A";
            //console.log(card.ability1Type)
            // ability2NameText.text = card.ability2Name || "N/A";
            // ability2DescText.text = card.ability2Desc || "No description available.";
            // ability2TypeText.text = card.ability2Type || "N/A";
        }
    }
    
    
    // Function to handle next button click
    function onNextCard() {
        if (selectedIndex < cards.length - 1) {
            selectedIndex++;
            updateAttackInfo(); // Update UI for the new selectedIndex
            updateAbilityInfo();
        }
    }
    
    // Function to handle next button click
    function onPrevCard() {
        if (selectedIndex >= 0) {
            selectedIndex--;
            updateAttackInfo(); // Update UI for the new selectedIndex
            updateAbilityInfo();
        }
    }
    
    ColumnLayout {
        id: columnLayout1
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 10
        anchors.bottomMargin: -10
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
                opacity: 1
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                
                // Set button background color based on the selected index
                palette {
                    button: selectedTabIndex === 0 ? "#6c0101" : "#c80d0d"  // Dark red for selected, light red for unselected
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
                    color: selectedTabIndex === 0 ? "#ffffff" : "#000000"  // White for selected, black for unselected
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
                    button: selectedTabIndex === 1 ? "#6c0101" : "#c80d0d"  // Dark red for selected, light red for unselected
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
                    color: selectedTabIndex === 1 ? "#ffffff" : "#000000"  // White for selected, black for unselected
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
                    button: selectedTabIndex === 2 ? "#6c0101" : "#c80d0d"  // Dark red for selected, light red for unselected
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
                    color: selectedTabIndex === 2 ? "#ffffff" : "#000000"  // White for selected, black for unselected
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
                Layout.fillHeight: true
                Layout.fillWidth: true
                
                ColumnLayout {
                    id: searchTabColumn
                    anchors.fill: parent
                    spacing: 0
                    
                    ColumnLayout {
                        id: searchToolsColumn
                        width: 100
                        height: 100
                        spacing: 0
                        Layout.columnSpan: 1
                        z: 0
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        
                        ToolBar {
                            id: searchFilterTools
                            width: 480
                            Layout.preferredHeight: 36
                            verticalPadding: 0
                            bottomPadding: 0
                            horizontalPadding: 0
                            Layout.topMargin: 0
                            Layout.fillHeight: false
                            Layout.fillWidth: true
                            contentHeight: 30
                            
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
                            }
                        }
                        
                        ToolBar {
                            id: searchTools
                            width: parent.width
                            height: 48
                            bottomPadding: 0
                            horizontalPadding: 0
                            Layout.fillHeight: false
                            contentWidth: 200
                            contentHeight: 48
                            z: 0
                            Layout.fillWidth: true
                            
                            RowLayout {
                                id: searchRow
                                x: 6
                                y: 6
                                anchors.fill: parent
                                z: 3
                                spacing: 5
                                
                                TextField {
                                    id: txtSearchBox
                                    width: 200
                                    height: 36
                                    anchors.verticalCenter: btnSearch.verticalCenter
                                    anchors.left: btnSearch.right
                                    anchors.right: btnSearch.left
                                    anchors.top: btnSearch.bottom
                                    anchors.bottom: btnSearch.top
                                    anchors.leftMargin: -468
                                    anchors.rightMargin: 5
                                    anchors.topMargin: -26
                                    anchors.bottomMargin: -26
                                    anchors.horizontalCenter: btnSearch.horizontalCenter
                                    z: 0
                                    Layout.leftMargin: 6
                                    Layout.preferredHeight: -1
                                    Layout.preferredWidth: -1
                                    placeholderText: qsTr("Enter card name")
                                    Layout.fillWidth: true
                                    
                                    Rectangle {
                                        id: rectangle7
                                        color: "#00951111"
                                        radius: 4
                                        border.color: "#6c0101"
                                        border.width: 2
                                        anchors.fill: parent
                                        anchors.leftMargin: -2
                                        anchors.rightMargin: -2
                                        clip: false
                                        scale: 1
                                        z: 0
                                    }
                                }
                                Button {
                                    id: btnSearch
                                    width: 100
                                    height: 40
                                    text: qsTr("Search")
                                    font.styleName: "Bold Italic"
                                    Layout.fillHeight: false
                                    Layout.rightMargin: 6
                                    Layout.fillWidth: false
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
                                            //console.log("Search Button Pressed...")
                                            //console.log("Calling backendController.request_search with parameters:")
                                            //Print each tuple as a string to the console
                                            for (var i = 0; i < searchParams.length; i++) {
                                                var tupleString = "[" + searchParams[i][0] + ", " + searchParams[i][1] + ", " + searchParams[i][2] + "]";
                                                // console.log(tupleString);
                                            }
                                            
                                            backendController.request_search(searchParams);
                                        }
                                        
                                    }
                                }
                                
                                
                            }
                            
                            Rectangle {
                                id: rectangle5
                                color: "#00ffffff"
                                radius: 4
                                border.color: "#6c0101"
                                border.width: 2
                                anchors.fill: parent
                                z: 1
                            }
                            
                            Rectangle {
                                id: rectangle6
                                color: "#cc1c1c"
                                border.color: "#00000000"
                                anchors.fill: parent
                            }
                        }
                    }
                    
                    Item {
                        id: _item
                        width: 200
                        height: 200
                        Layout.margins: 0
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        
                        
                        // Add a boolean variable to track the drawer's state
                        property bool isDrawerOpen: false // Start with the drawer closed
                        
                        // The main Pane with no margin or padding
                        Rectangle {
                            id: _itemOuterRedMid
                            visible: true
                            color: "#00ccf2ff"
                            radius: 0
                            border.color: "#cc1c1c"
                            border.width: 6
                            anchors.fill: parent
                            z: 3
                        }
                        
                        Rectangle {
                            id: _itemOuterRedShade
                            height: 404
                            visible: true
                            color: "#00ccf2ff"
                            radius: 4
                            border.color: "#6c0101"
                            border.width: 2
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.rightMargin: 0
                            anchors.topMargin: 0
                            z: 4
                        }
                        
                        Rectangle {
                            id: _itemOuterRedShade1
                            visible: true
                            color: "#00ccf2ff"
                            radius: 4
                            border.color: "#6c0101"
                            border.width: 2
                            anchors.fill: parent
                            anchors.rightMargin: 5
                            anchors.topMargin: 5
                            anchors.bottomMargin: 5
                            z: 4
                            
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
                                color: "#951111" // Set background to transparent
                                border.color: "#00255864" // Darker grey color for the border
                                border.width: 0
                                radius: 0 // Optional: Set radius for rounded corners
                            }
                            
                            // Drawer
                            Rectangle {
                                id: customDrawer
                                x: -270
                                width: 280
                                height: 410
                                opacity: 1
                                // Start hidden
                                color: "#15ba1c"
                                radius: 4
                                border.color: "#25fb2e"
                                border.width: 6
                                // @disable-check M9
                                anchors.verticalCenter: parent.verticalCenter
                                scale: 0.95
                                z: 1
                                //property bool isHoverEnabled: true
                                
                                // Animate the x position when it changes
                                Behavior on x {
                                    NumberAnimation {
                                        duration: 500  // Adjust the duration for the desired speed
                                        easing.type: Easing.OutQuad  // Smooth easing effect
                                    }
                                }
                                
                                // MouseArea for the drawer that does not toggle visibility
                                MouseArea {
                                    visible: true
                                    anchors.fill: parent
                                    anchors.leftMargin: 1
                                    anchors.rightMargin: -1
                                    anchors.topMargin: 0
                                    anchors.bottomMargin: 0
                                }
                                
                                // Frame that holds the card image
                                Frame {
                                    id: frame
                                    anchors.fill: parent
                                    
                                    Image {
                                        id: cardImage
                                        anchors.fill: parent
                                        
                                        // Initially try the high-res image URL
                                        source: (selectedIndex >= 0 && selectedIndex < cards.length)
                                                ? cards[selectedIndex].imageUrl // Try to load the card image
                                                : ""
                                        
                                        Layout.fillHeight: false
                                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                                        Layout.preferredHeight: 500
                                        Layout.preferredWidth: 480
                                        Layout.fillWidth: true
                                        scale: 1
                                        fillMode: Image.PreserveAspectFit
                                    }
                                }
                                
                                Rectangle {
                                    id: rectangle1
                                    color: "#00ffffff"
                                    radius: 3
                                    border.color: "#128c17"
                                    border.width: 4
                                    anchors.fill: parent
                                }
                            }
                            
                            // Trigger button to open/close drawer
                            MouseArea {
                                id: openButton
                                width: 20 // Width of the button
                                height: parent.height
                                opacity: 1
                                anchors.verticalCenter: customDrawer.verticalCenter
                                anchors.left: customDrawer.right // Keep the button attached to the right edge of the drawer
                                anchors.leftMargin: -7
                                
                                // hoverEnabled: customDrawer.isHoverEnabled
                                // onEntered: {
                                
                                //    if(_item.isDrawerOpen === false && customDrawer.x+customDrawer.width-12 <=0) customDrawer.x = customDrawer.x += 8
                                // }
                                // onExited: {
                                //     // TODO FIx logic
                                //     if(_item.isDrawerOpen === false && customDrawer.x+customDrawer.width-12 >=0)
                                //     customDrawer.x = customDrawer.x -= 8
                                // }
                                
                                z: 1
                                onClicked: {
                                    if (customDrawer.x < 0) {
                                        customDrawer.x = 0
                                        ;
                                        //customDrawer.isHoverEnabled = false
                                        // Slide in
                                        _item.isDrawerOpen = true
                                    } else {
                                        customDrawer.x = -customDrawer.width+12; // Slide out
                                        //customDrawer.isHoverEnabled = true
                                        
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
                                    border.width: 2 // Thin border
                                }
                                
                                // Circle for the caret background
                                Rectangle {
                                    id: drawerCircle
                                    x: 8
                                    width: 26
                                    height: 26
                                    color: "#6c0101" // Circle color
                                    radius: 9
                                    border.color: "#c80d0d"
                                    border.width: 2 // Make it a circle
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: -10
                                    anchors.verticalCenterOffset: 0 // Position the circle on the right side of the button
                                    
                                    // Smooth scaling animation
                                    Behavior on scale {
                                        NumberAnimation {
                                            duration: 200
                                            // easing: Easing.InOutQuad
                                        }
                                    }
                                    
                                    // MouseArea to detect hover events
                                    MouseArea {
                                        id: mouseArea
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        cursorShape: Qt.PointingHandCursor  // Change cursor to hand when hovering
                                        
                                        onEntered: {
                                            // Scale up on hover
                                            drawerCircle.scale = 1.2;
                                        }
                                        onExited: {
                                            // Scale down when not hovered
                                            drawerCircle.scale = 1;
                                        }
                                        
                                        onClicked: {
                                            if (customDrawer.x < 0) {
                                                customDrawer.x = 0
                                                ;
                                                //customDrawer.isHoverEnabled = false
                                                
                                                // Slide in
                                                _item.isDrawerOpen = true
                                            } else {
                                                customDrawer.x = -customDrawer.width+12; // Slide out
                                                //customDrawer.isHoverEnabled = true
                                                
                                                _item.isDrawerOpen = false
                                            }
                                        }
                                    }
                                }
                                
                                // Caret using text
                                Text {
                                    id: drawerButtonText
                                    x: 13
                                    text: { _item.isDrawerOpen ? "<" : ">" }
                                    anchors.verticalCenter: parent.verticalCenter
                                    // Proper QML binding expression
                                    font.pixelSize: 26
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    font.styleName: "Condensed Bold"
                                    anchors.verticalCenterOffset: 0
                                    font.bold: true
                                    color: "#ef0e0e"
                                    
                                    // Color of the caret
                                    // Align with the right edge of the button
                                    
                                }
                            }
                            
                            Rectangle {
                                id: dataFlow
                                opacity: 1
                                color: "#951111"
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                anchors.leftMargin: 36
                                anchors.rightMargin: 12
                                anchors.topMargin: 12
                                anchors.bottomMargin: 7
                                clip: true
                                
                                Rectangle {
                                    id: nameBlock
                                    x: 259
                                    y: 0
                                    width: 175
                                    height: 60
                                    color: "#c80d0d"
                                    radius: 8
                                    border.color: "#6c0101"
                                    border.width: 2
                                    
                                    Rectangle {
                                        id: rectangle12
                                        color: "#b2b2b2"
                                        radius: 8
                                        border.color: "#616161"
                                        border.width: 2
                                        anchors.fill: parent
                                        anchors.leftMargin: 4
                                        anchors.rightMargin: 4
                                        anchors.topMargin: 3
                                        anchors.bottomMargin: 3
                                    }
                                    
                                    Rectangle {
                                        id: nameScreen
                                        color: "#15ba1c"
                                        radius: 4
                                        border.color: "#128c17"
                                        border.width: 2
                                        anchors.fill: parent
                                        anchors.leftMargin: 11
                                        anchors.rightMargin: 11
                                        anchors.topMargin: 7
                                        anchors.bottomMargin: 7
                                        
                                        Text {
                                            id: nameText
                                            color: "#c5002a02"
                                            // Safely access the name property
                                            text: (selectedIndex >= 0 && selectedIndex < cards.length)
                                                  ? cards[selectedIndex].name || "No Name Available" // Fallback if name is undefined
                                                  : "Name"
                                            anchors.left: parent.left
                                            anchors.right: parent.right
                                            anchors.top: parent.top
                                            anchors.bottom: parent.bottom
                                            anchors.leftMargin: 4
                                            anchors.rightMargin: 4
                                            anchors.topMargin: 2
                                            anchors.bottomMargin: 2
                                            // Fallback when no card is selected
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                            wrapMode: Text.Wrap
                                            minimumPointSize: 8
                                            minimumPixelSize: 8
                                            font.pointSize: 22
                                            z: 1
                                            font.styleName: "Bold Italic"
                                            fontSizeMode: Text.HorizontalFit
                                        }
                                        
                                        Text {
                                            id: nameDropText
                                            color: "#2a7b2d"
                                            text: nameText.text
                                            anchors.left: parent.left
                                            anchors.right: parent.right
                                            anchors.top: parent.top
                                            anchors.bottom: parent.bottom
                                            anchors.leftMargin: 4
                                            anchors.rightMargin: 4
                                            anchors.topMargin: 2
                                            anchors.bottomMargin: 2
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                            wrapMode: Text.Wrap
                                            minimumPointSize: 8
                                            minimumPixelSize: 8
                                            z: 0
                                            fontSizeMode: Text.HorizontalFit
                                            font.styleName: "Bold Italic"
                                            font.pointSize: 22
                                        }
                                    }
                                }
                                
                                
                                
                                
                                Rectangle {
                                    id: setLogoBlock
                                    x: 259
                                    y: 128
                                    width: 175
                                    height: 130
                                    color: "#c80d0d"
                                    radius: 8
                                    border.color: "#6c0101"
                                    border.width: 2
                                    
                                    Rectangle {
                                        id: setLogoBezel
                                        color: "#b2b2b2"
                                        radius: 8
                                        border.color: "#616161"
                                        border.width: 2
                                        anchors.fill: parent
                                        anchors.leftMargin: 6
                                        anchors.rightMargin: 6
                                        anchors.topMargin: 6
                                        anchors.bottomMargin: 6
                                        state: "base state4"
                                        
                                        Rectangle {
                                            id: setLogoScreen
                                            x: 8
                                            y: -1
                                            color: "#15ba1c"
                                            radius: 6
                                            border.color: "#095f0c"
                                            border.width: 2
                                            anchors.fill: parent
                                            anchors.leftMargin: 10
                                            anchors.rightMargin: 10
                                            anchors.topMargin: 6
                                            anchors.bottomMargin: 6
                                            
                                            Text {
                                                id: setLogoText
                                                color: "#c5002a02"
                                                text: (selectedIndex >= 0 && selectedIndex < cards.length)
                                                      ? "" // Fallback if name is undefined
                                                      : "Set Logo"
                                                anchors.fill: parent
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                                wrapMode: Text.Wrap
                                                font.family: "Ubuntu Sans"
                                                z: 1
                                                font.styleName: "ExtraBold Italic"
                                                font.italic: false
                                                font.bold: false
                                                font.pointSize: 19
                                                fontSizeMode: Text.HorizontalFit
                                            }
                                            
                                            Image {
                                                id: setLogoImage
                                                x: -12
                                                y: -5
                                                anchors.fill: parent
                                                anchors.leftMargin: 4
                                                anchors.rightMargin: 4
                                                anchors.topMargin: 4
                                                anchors.bottomMargin: 4
                                                source: (selectedIndex >= 0 && selectedIndex < cards.length) ? cards[selectedIndex].setLogo : ""
                                                z: 1
                                                
                                                scale: 1
                                                fillMode: Image.PreserveAspectFit
                                            }
                                            
                                            Text {
                                                id: setLogoDropText
                                                x: 1
                                                y: 2
                                                color: "#2a7b2d"
                                                text: (selectedIndex >= 0 && selectedIndex < cards.length)
                                                      ? "" // Fallback if name is undefined
                                                      : "Set Logo"
                                                anchors.fill: parent
                                                anchors.leftMargin: 1
                                                anchors.rightMargin: -1
                                                anchors.topMargin: 2
                                                anchors.bottomMargin: -2
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                                wrapMode: Text.Wrap
                                                z: 0
                                                fontSizeMode: Text.HorizontalFit
                                                font.styleName: "ExtraBold Italic"
                                                font.pointSize: 19
                                                font.italic: false
                                                font.family: "Ubuntu Sans"
                                                font.bold: false
                                            }
                                            
                                        }
                                    }
                                }
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                Rectangle {
                                    id: setSymbolBlock
                                    x: 359
                                    y: 62
                                    width: 75
                                    height: 60
                                    color: "#c80d0d"
                                    radius: 8
                                    border.color: "#6c0101"
                                    border.width: 2
                                    
                                    
                                    Rectangle {
                                        id: setSymbolBezel
                                        color: "#b2b2b2"
                                        radius: 8
                                        border.color: "#616161"
                                        border.width: 2
                                        anchors.fill: parent
                                        anchors.leftMargin: 4
                                        anchors.rightMargin: 4
                                        anchors.topMargin: 3
                                        anchors.bottomMargin: 3
                                        
                                        Rectangle {
                                            id: setSymbolScreen
                                            color: "#15ba1c"
                                            radius: 6
                                            border.color: "#128c17"
                                            border.width: 2
                                            anchors.fill: parent
                                            anchors.leftMargin: 4
                                            anchors.rightMargin: 4
                                            anchors.topMargin: 4
                                            anchors.bottomMargin: 4
                                            
                                            Image {
                                                id: setSymbolImage
                                                x: -14
                                                y: -7
                                                anchors.fill: parent
                                                
                                                source: (selectedIndex >= 0 && selectedIndex < cards.length) ? cards[selectedIndex].setSymbol : ""
                                                z: 1
                                                scale: 0.8
                                                fillMode: Image.PreserveAspectFit
                                            }
                                            
                                            Text {
                                                id: setSymbolText
                                                color: "#c5002a02"
                                                text: (selectedIndex >= 0 && selectedIndex < cards.length)
                                                      ? "" // Fallback if name is undefined
                                                      : "Set Symbol"
                                                anchors.fill: parent
                                                anchors.leftMargin: 2
                                                anchors.rightMargin: 2
                                                anchors.topMargin: 2
                                                anchors.bottomMargin: 2
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                                wrapMode: Text.Wrap
                                                z: 1
                                                font.pointSize: 8
                                                font.styleName: "ExtraBold Italic"
                                                fontSizeMode: Text.HorizontalFit
                                            }
                                        }
                                    }
                                }
                                
                                
                                
                                
                                Rectangle {
                                    id: setBlock
                                    x: 259
                                    y: 62
                                    width: 98
                                    height: 60
                                    color: "#c80d0d"
                                    radius: 8
                                    border.color: "#6c0101"
                                    border.width: 2
                                    
                                    Rectangle {
                                        id: setNameBezel
                                        color: "#b2b2b2"
                                        radius: 8
                                        border.color: "#6c0101"
                                        border.width: 2
                                        anchors.fill: parent
                                        anchors.leftMargin: 4
                                        anchors.rightMargin: 4
                                        anchors.topMargin: 3
                                        anchors.bottomMargin: 3
                                        
                                        Rectangle {
                                            id: setNameScreen
                                            x: 10
                                            y: 4
                                            color: "#15ba1c"
                                            radius: 6
                                            border.color: "#128c17"
                                            border.width: 2
                                            anchors.fill: parent
                                            anchors.leftMargin: 6
                                            anchors.rightMargin: 6
                                            anchors.topMargin: 4
                                            anchors.bottomMargin: 4
                                            
                                            Text {
                                                id: setNameText
                                                color: "#095f0c"
                                                // Safely access the name property
                                                text: (selectedIndex >= 0 && selectedIndex < cards.length)
                                                      ? cards[selectedIndex].set || "No Name Available" // Fallback if name is undefined
                                                      : "Set Name"
                                                anchors.fill: parent
                                                anchors.leftMargin: 2
                                                anchors.rightMargin: 2
                                                anchors.topMargin: 2
                                                anchors.bottomMargin: 2
                                                // Fallback when no card is selected
                                                
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                                wrapMode: Text.Wrap
                                                minimumPointSize: 6
                                                minimumPixelSize: 6
                                                z: 1
                                                font.styleName: "ExtraBold Italic"
                                                fontSizeMode: Text.Fit
                                            }
                                        }
                                    }
                                    
                                }
                                
                                Flickable {
                                    id: attackScrollView
                                    x: 0
                                    y: 0
                                    width: 240
                                    height: 377
                                    boundsBehavior: Flickable.DragOverBounds
                                    boundsMovement: Flickable.FollowBoundsBehavior
                                    flickableDirection: Flickable.VerticalFlick
                                    // Adjust width as needed
                                    // Set a height that fits your layout
                                    contentWidth: parent.width
                                    contentHeight: 700 // Set a suitable height for your content
                                    
                                    // First attack

                                    ColumnLayout {
                                        id: leftColumn
                                        width: 100
                                        height: 100

                                        Column {
                                            id: attackContainer
                                            width: 247
                                            height: 500
                                            spacing: 4 // Space between attack blocks


                                            Rectangle {
                                                id: attack1NameBlock
                                                width: 250
                                                height: 40
                                                color: "#c80d0d"
                                                radius: 8
                                                border.color: "#6c0101"
                                                border.width: 2

                                                Rectangle {
                                                    id: rectangle22
                                                    color: "#b2b2b2"
                                                    radius: 8
                                                    border.color: "#616161"
                                                    border.width: 2
                                                    anchors.fill: parent
                                                    anchors.leftMargin: 4
                                                    anchors.rightMargin: 4
                                                    anchors.topMargin: 3
                                                    anchors.bottomMargin: 3

                                                    Rectangle {
                                                        id: rectangle23
                                                        x: 10
                                                        y: 4
                                                        color: "#15ba1c"
                                                        radius: 4
                                                        border.color: "#128c17"
                                                        border.width: 2
                                                        anchors.fill: parent
                                                        anchors.leftMargin: 5
                                                        anchors.rightMargin: 5
                                                        anchors.topMargin: 6
                                                        anchors.bottomMargin: 6

                                                        Text {
                                                            id: attack1Name
                                                            color: "#c5002a02"
                                                            text: "Attack 1"
                                                            anchors.fill: parent
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            wrapMode: Text.Wrap
                                                            fontSizeMode: Text.HorizontalFit
                                                            font.styleName: "ExtraBold Italic"
                                                        }
                                                    }
                                                }
                                            }
                                            Rectangle {
                                                id: attack1DescriptionBlock
                                                x: 0
                                                y: 44
                                                width: 250
                                                height: 120
                                                color: "#c80d0d"
                                                radius: 8
                                                border.color: "#6c0101"
                                                border.width: 2

                                                Rectangle {
                                                    id: attack1TextBezel
                                                    color: "#b2b2b2"
                                                    radius: 8
                                                    border.color: "#616161"
                                                    border.width: 2
                                                    anchors.fill: parent
                                                    anchors.leftMargin: 4
                                                    anchors.rightMargin: 4
                                                    anchors.topMargin: 4
                                                    anchors.bottomMargin: 4

                                                    Rectangle {
                                                        id: attack1Screen
                                                        x: 10
                                                        y: 4
                                                        color: "#15ba1c"
                                                        radius: 6
                                                        border.color: "#128c17"
                                                        border.width: 2
                                                        anchors.fill: parent
                                                        anchors.leftMargin: 6
                                                        anchors.rightMargin: 6
                                                        anchors.topMargin: 6
                                                        anchors.bottomMargin: 6

                                                        Text {
                                                            id: attack1DescriptionDropText
                                                            visible: true
                                                            color: "#c5002a02"
                                                            text: "Attack 1 Description"
                                                            anchors.fill: parent
                                                            anchors.leftMargin: 4
                                                            anchors.rightMargin: 4
                                                            anchors.topMargin: 4
                                                            anchors.bottomMargin: 4
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            wrapMode: Text.Wrap
                                                            font.pointSize: attack1DescriptionText.font.pointSize
                                                            minimumPointSize: 8
                                                            minimumPixelSize: 8
                                                            z: 0
                                                            fontSizeMode: Text.Fit
                                                            font.styleName: "ExtraBold Italic"
                                                        }

                                                        Text {
                                                            id: attack1DescriptionText
                                                            color: "#095f0c"
                                                            text: attack1DescriptionDropText.text
                                                            anchors.fill: parent
                                                            anchors.leftMargin: 5
                                                            anchors.rightMargin: 3
                                                            anchors.topMargin: 5
                                                            anchors.bottomMargin: 3
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            wrapMode: Text.Wrap
                                                            font.pointSize: attack1DescriptionDropText.font.pointSize
                                                            minimumPointSize: 8
                                                            minimumPixelSize: 8
                                                            z: 1
                                                            fontSizeMode: Text.Fit
                                                            font.styleName: "ExtraBold Italic"
                                                        }
                                                    }
                                                }
                                            }
                                            Rectangle {
                                                id: attack2NameBlock
                                                x: -3
                                                y: 158
                                                width: 250
                                                height: 40
                                                color: "#c80d0d"
                                                radius: 8
                                                border.color: "#6c0101"
                                                border.width: 2
                                                Rectangle {
                                                    id: attack2NameBezel
                                                    color: "#b2b2b2"
                                                    radius: 8
                                                    border.color: "#616161"
                                                    border.width: 2
                                                    anchors.fill: parent
                                                    anchors.leftMargin: 4
                                                    anchors.rightMargin: 4
                                                    anchors.topMargin: 3
                                                    anchors.bottomMargin: 3
                                                    Rectangle {
                                                        id: attack2NameScreen
                                                        x: 10
                                                        y: 4
                                                        color: "#15ba1c"
                                                        radius: 4
                                                        border.color: "#128c17"
                                                        border.width: 2
                                                        anchors.fill: parent
                                                        anchors.leftMargin: 5
                                                        anchors.rightMargin: 5
                                                        anchors.topMargin: 6
                                                        anchors.bottomMargin: 6
                                                        Text {
                                                            id: attack2NameText
                                                            color: "#c5002a02"
                                                            text: "Attack 2"
                                                            anchors.fill: parent
                                                            anchors.leftMargin: 4
                                                            anchors.rightMargin: 4
                                                            anchors.topMargin: 2
                                                            anchors.bottomMargin: 2
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            wrapMode: Text.Wrap
                                                            z: 1
                                                            fontSizeMode: Text.HorizontalFit
                                                            font.styleName: "ExtraBold Italic"
                                                        }

                                                        Text {
                                                            id: attack2NameDrop
                                                            color: "#2a7b2d"
                                                            text: attack2NameText.text
                                                            anchors.fill: parent
                                                            anchors.leftMargin: 5
                                                            anchors.rightMargin: 3
                                                            anchors.topMargin: 3
                                                            anchors.bottomMargin: 1
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            wrapMode: Text.Wrap
                                                            z: 0
                                                            fontSizeMode: Text.HorizontalFit
                                                            font.styleName: "ExtraBold Italic"
                                                        }
                                                    }
                                                }
                                            }
                                            Rectangle {
                                                id: attack2DescriptionBlock
                                                x: 0
                                                y: 202
                                                width: 250
                                                height: 120
                                                color: "#c80d0d"
                                                radius: 8
                                                border.color: "#6c0101"
                                                border.width: 2
                                                Rectangle {
                                                    id: attackDescription2Bezel
                                                    color: "#b2b2b2"
                                                    radius: 8
                                                    border.color: "#616161"
                                                    border.width: 2
                                                    anchors.fill: parent
                                                    anchors.leftMargin: 4
                                                    anchors.rightMargin: 4
                                                    anchors.topMargin: 4
                                                    anchors.bottomMargin: 4
                                                    Rectangle {
                                                        id: attack2Screen
                                                        x: 10
                                                        y: 4
                                                        color: "#15ba1c"
                                                        radius: 6
                                                        border.color: "#128c17"
                                                        border.width: 2
                                                        anchors.fill: parent
                                                        anchors.leftMargin: 6
                                                        anchors.rightMargin: 6
                                                        anchors.topMargin: 6
                                                        anchors.bottomMargin: 6
                                                        Text {
                                                            id: attack2DescriptionDropText
                                                            visible: true
                                                            color: "#c5002a02"
                                                            text: attack2DescriptionText.text
                                                            anchors.fill: parent
                                                            anchors.leftMargin: 4
                                                            anchors.rightMargin: 4
                                                            anchors.topMargin: 4
                                                            anchors.bottomMargin: 4
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            wrapMode: Text.Wrap
                                                            font.pointSize: attack2DescriptionText.font.pointSize
                                                            minimumPixelSize: 8
                                                            fontSizeMode: Text.Fit
                                                            minimumPointSize: 8
                                                            z: 1
                                                            font.styleName: "ExtraBold Italic"
                                                        }

                                                        Text {
                                                            id: attack2DescriptionText
                                                            visible: true
                                                            color: "#095f0c"
                                                            text: "Attack 2 Description"
                                                            anchors.fill: parent
                                                            anchors.leftMargin: 5
                                                            anchors.rightMargin: 3
                                                            anchors.topMargin: 5
                                                            anchors.bottomMargin: 3
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            wrapMode: Text.Wrap
                                                            minimumPointSize: 8
                                                            minimumPixelSize: 8
                                                            z: 0
                                                            fontSizeMode: Text.Fit
                                                            font.styleName: "ExtraBold Italic"
                                                        }
                                                    }
                                                }
                                            }
                                            Rectangle {
                                                id: attack3NameBlock
                                                width: 250
                                                height: 40
                                                visible: true
                                                color: "#c80d0d"
                                                radius: 8
                                                border.color: "#6c0101"
                                                border.width: 2
                                                Rectangle {
                                                    id: attack3NameBezel
                                                    color: "#b2b2b2"
                                                    radius: 8
                                                    border.color: "#616161"
                                                    border.width: 2
                                                    anchors.fill: parent
                                                    anchors.leftMargin: 4
                                                    anchors.rightMargin: 4
                                                    anchors.topMargin: 3
                                                    anchors.bottomMargin: 3
                                                    Rectangle {
                                                        id: attack3NameScreen
                                                        x: 10
                                                        y: 4
                                                        color: "#15ba1c"
                                                        radius: 4
                                                        border.color: "#128c17"
                                                        border.width: 2
                                                        anchors.fill: parent
                                                        anchors.leftMargin: 5
                                                        anchors.rightMargin: 5
                                                        anchors.topMargin: 6
                                                        anchors.bottomMargin: 6
                                                        Text {
                                                            id: attack3NameText
                                                            color: "#c5002a02"
                                                            text: "Attack 3"
                                                            anchors.fill: parent
                                                            anchors.leftMargin: 4
                                                            anchors.rightMargin: 4
                                                            anchors.topMargin: 2
                                                            anchors.bottomMargin: 2
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            wrapMode: Text.Wrap
                                                            z: 1
                                                            fontSizeMode: Text.HorizontalFit
                                                            font.styleName: "ExtraBold Italic"
                                                        }

                                                        Text {
                                                            id: attack3NameDrop
                                                            color: "#2a7b2d"
                                                            text: attack3NameText.text
                                                            anchors.fill: parent
                                                            anchors.leftMargin: 5
                                                            anchors.rightMargin: 3
                                                            anchors.topMargin: 3
                                                            anchors.bottomMargin: 1
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            wrapMode: Text.Wrap
                                                            z: 0
                                                            fontSizeMode: Text.HorizontalFit
                                                            font.styleName: "ExtraBold Italic"
                                                        }
                                                    }
                                                }
                                            }
                                            Rectangle {
                                                id: attack3DescriptionBlock
                                                width: 250
                                                height: 120
                                                color: "#c80d0d"
                                                radius: 8
                                                border.color: "#6c0101"
                                                border.width: 2
                                                Rectangle {
                                                    id: attack3DescriptionBezel
                                                    color: "#b2b2b2"
                                                    radius: 8
                                                    border.color: "#616161"
                                                    border.width: 2
                                                    anchors.fill: parent
                                                    anchors.leftMargin: 4
                                                    anchors.rightMargin: 4
                                                    anchors.topMargin: 4
                                                    anchors.bottomMargin: 4
                                                    Rectangle {
                                                        id: attack3DescriptionScreen
                                                        x: 10
                                                        y: 4
                                                        color: "#15ba1c"
                                                        radius: 6
                                                        border.color: "#128c17"
                                                        border.width: 2
                                                        anchors.fill: parent
                                                        anchors.leftMargin: 6
                                                        anchors.rightMargin: 6
                                                        anchors.topMargin: 6
                                                        anchors.bottomMargin: 6
                                                        Text {
                                                            id: attack3DescriptionDropText
                                                            visible: true
                                                            color: "#c5002a02"
                                                            text: attack3DescriptionText.text
                                                            anchors.fill: parent
                                                            anchors.leftMargin: 4
                                                            anchors.rightMargin: 4
                                                            anchors.topMargin: 4
                                                            anchors.bottomMargin: 4
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            wrapMode: Text.Wrap
                                                            z: 1
                                                            minimumPointSize: 8
                                                            minimumPixelSize: 8
                                                            fontSizeMode: Text.Fit
                                                            font.styleName: "ExtraBold Italic"
                                                            font.pointSize: attack3DescriptionText.font.pointSize
                                                        }

                                                        Text {
                                                            id: attack3DescriptionText
                                                            visible: true
                                                            color: "#095f0c"
                                                            text: "Attack 3 Description"
                                                            anchors.fill: parent
                                                            anchors.leftMargin: 5
                                                            anchors.rightMargin: 3
                                                            anchors.topMargin: 5
                                                            anchors.bottomMargin: 3
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            wrapMode: Text.Wrap
                                                            z: 0
                                                            minimumPointSize: 8
                                                            minimumPixelSize: 8
                                                            fontSizeMode: Text.Fit
                                                            font.styleName: "ExtraBold Italic"
                                                        }
                                                    }
                                                }
                                            }

                                        }

                                        Column {
                                            id: abilityContainer
                                            width: 247
                                            height: 500
                                            spacing: 4

                                            Rectangle {
                                                id: abililty1NameBlock
                                                width: 250
                                                height: 40
                                                color: "#c80d0d"
                                                radius: 8
                                                border.color: "#6c0101"
                                                border.width: 2
                                                Rectangle {
                                                    id: ability1NameBezel
                                                    color: "#b2b2b2"
                                                    radius: 8
                                                    border.color: "#616161"
                                                    border.width: 2
                                                    anchors.fill: parent
                                                    anchors.leftMargin: 4
                                                    anchors.rightMargin: 4
                                                    anchors.topMargin: 3
                                                    anchors.bottomMargin: 3
                                                    Rectangle {
                                                        id: ability1NameScreen
                                                        x: 10
                                                        y: 4
                                                        color: "#15ba1c"
                                                        radius: 4
                                                        border.color: "#128c17"
                                                        border.width: 2
                                                        anchors.fill: parent
                                                        anchors.leftMargin: 5
                                                        anchors.rightMargin: 5
                                                        anchors.topMargin: 6
                                                        anchors.bottomMargin: 6
                                                        Text {
                                                            id: ability1NameText
                                                            color: "#c5002a02"
                                                            text: "Ability 1"
                                                            anchors.fill: parent
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            wrapMode: Text.Wrap
                                                            fontSizeMode: Text.HorizontalFit
                                                            font.styleName: "ExtraBold Italic"
                                                        }
                                                    }
                                                }
                                            }

                                            Rectangle {
                                                id: abililty1TypeBlock
                                                width: 250
                                                height: 40
                                                color: "#c80d0d"
                                                radius: 8
                                                border.color: "#6c0101"
                                                border.width: 2
                                                Rectangle {
                                                    id: abililty1TypeBezel
                                                    color: "#b2b2b2"
                                                    radius: 8
                                                    border.color: "#616161"
                                                    border.width: 2
                                                    anchors.fill: parent
                                                    anchors.leftMargin: 4
                                                    anchors.rightMargin: 4
                                                    anchors.topMargin: 3
                                                    anchors.bottomMargin: 3
                                                    Rectangle {
                                                        id: abililty1TypeScreen
                                                        x: 10
                                                        y: 4
                                                        color: "#15ba1c"
                                                        radius: 4
                                                        border.color: "#128c17"
                                                        border.width: 2
                                                        anchors.fill: parent
                                                        anchors.leftMargin: 5
                                                        anchors.rightMargin: 5
                                                        anchors.topMargin: 6
                                                        anchors.bottomMargin: 6
                                                        Text {
                                                            id: ability1TypeText
                                                            color: "#c5002a02"
                                                            text: "Ability 1 Type"
                                                            anchors.fill: parent
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            wrapMode: Text.Wrap
                                                            fontSizeMode: Text.HorizontalFit
                                                            font.styleName: "ExtraBold Italic"
                                                        }
                                                    }
                                                }
                                            }

                                            Rectangle {
                                                id: ability1DescriptionBlock
                                                width: 250
                                                height: 136
                                                color: "#c80d0d"
                                                radius: 8
                                                border.color: "#6c0101"
                                                border.width: 2
                                                Rectangle {
                                                    id: abilityDescriptionBezel
                                                    color: "#b2b2b2"
                                                    radius: 8
                                                    border.color: "#616161"
                                                    border.width: 2
                                                    anchors.fill: parent
                                                    anchors.leftMargin: 4
                                                    anchors.rightMargin: 4
                                                    anchors.topMargin: 4
                                                    anchors.bottomMargin: 4
                                                    Rectangle {
                                                        id: ability1DescriptionScreen
                                                        x: 10
                                                        y: 4
                                                        color: "#15ba1c"
                                                        radius: 6
                                                        border.color: "#128c17"
                                                        border.width: 2
                                                        anchors.fill: parent
                                                        anchors.leftMargin: 6
                                                        anchors.rightMargin: 6
                                                        anchors.topMargin: 6
                                                        anchors.bottomMargin: 6
                                                        Text {
                                                            id: ability1DescriptionDropText
                                                            visible: true
                                                            color: "#c5002a02"
                                                            text: "Ability 1 Description"
                                                            anchors.fill: parent
                                                            anchors.leftMargin: 4
                                                            anchors.rightMargin: 4
                                                            anchors.topMargin: 4
                                                            anchors.bottomMargin: 4
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            wrapMode: Text.Wrap
                                                            z: 0
                                                            minimumPointSize: 6
                                                            minimumPixelSize: 6
                                                            fontSizeMode: Text.Fit
                                                            font.styleName: "ExtraBold Italic"
                                                            font.pointSize: ability1DescriptionText.font.pointSize
                                                        }

                                                        Text {
                                                            id: ability1DescriptionText
                                                            color: "#095f0c"
                                                            text: ability1DescriptionDropText.text
                                                            anchors.fill: parent
                                                            anchors.leftMargin: 5
                                                            anchors.rightMargin: 3
                                                            anchors.topMargin: 5
                                                            anchors.bottomMargin: 3
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            wrapMode: Text.Wrap
                                                            z: 1
                                                            minimumPointSize: 6
                                                            minimumPixelSize: 6
                                                            fontSizeMode: Text.Fit
                                                            font.styleName: "ExtraBold Italic"
                                                            font.pointSize: ability1DescriptionDropText.font.pointSize
                                                        }
                                                    }
                                                }
                                            }

                                        }


                                    }
                                }
                                
                                
                                
                                
                                
                            }
                        }
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    ToolBar {
                        id: pagingButtonsToolbar
                        height: 37
                        position: ToolBar.Header
                        Layout.bottomMargin: 0
                        Layout.rightMargin: 0
                        Layout.leftMargin: 0
                        Layout.margins: 0
                        Layout.topMargin: 0
                        bottomPadding: 0
                        horizontalPadding: 0
                        contentWidth: 480
                        topPadding: 0
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        contentHeight: 32
                        
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
                                highlighted: false
                                flat: false
                                font.styleName: "Bold Italic"
                                enabled: selectedIndex > 0
                                onClicked: {
                                    onPrevCard();
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
                                    onNextCard();
                                    
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
                                text: cards.length ? (selectedIndex+1) + "/" + cards.length : "-/-"
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
                    
                    
                    
                }
                
                ListModel {
                    id: imageModel
                    // Initial empty list
                }
            }
            
            Connections {
                target: backendController
                function onSearchResults(response) {
                    //  console.log("Received search response:", response);  // Log the raw response
                    
                    var data = JSON.parse(response);
                    
                    if (data.error) {
                        // console.log("Error in response:", data.error);  // Log the error message
                        cards = [];
                    } else {
                        cards = data.map(card => ({
                                                      "name": card.name,
                                                      "imageUrl": card.imageUrl || "",
                                                      "set": card.set,
                                                      "setSymbol": card.setSymbol,
                                                      "setLogo": card.setLogo,
                                                      "ability1Name": card.ability1Name || "",
                                                      "ability1Desc": card.ability1Desc || "",
                                                      "ability1Type": card.ability1Type || "",
                                                      "ability2Name": card.ability2Name || "",
                                                      "ability2Desc": card.ability2Desc || "",
                                                      "ability2Type": card.ability2Type || "",
                                                      "attack1Name": card.attack1Name || "",
                                                      "attack1Desc": card.attack1Desc || "",
                                                      "attack2Name": card.attack2Name || "",
                                                      "attack2Desc": card.attack2Desc || "",
                                                      "attack3Name": card.attack3Name || "",
                                                      "attack3Desc": card.attack3Desc || ""
                                                  }));
                        
                        // console.log("Processed cards data:", cards);  // Log the processed cards array
                        
                        selectedIndex = 0;  // Start with the first card
                        updateAttackInfo();
                        updateAbilityInfo();  // Call a new function to update ability information
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






/*##^##
Designer {
    D{i:0}D{i:78;invisible:true}
}
##^##*/
