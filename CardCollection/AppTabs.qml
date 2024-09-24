import QtQuick
import QtQuick.Controls

TabBar {
    id: tabBar
    contentWidth: parent.width
    contentHeight: parent.height * 0.1
    currentIndex: 0
    width: parent.width
    height: parent.height * 0.1

    TabButton {
        text: "Search"
        onClicked: stackLayout.currentIndex = 0
    }
    TabButton {
        text: "Discover"
        onClicked: stackLayout.currentIndex = 1
    }
    TabButton {
        text: "Collection"
        onClicked: stackLayout.currentIndex = 2
    }
}

