import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.4
// import "controls" as Controls

ApplicationWindow {
    visible: true
    width: 480
    height: 480
    title: qsTr("Snake")

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20
        Button {
            text: qsTr("Start Game")
        }
        Button {
            text: qsTr("Records")
        }
        Button {
            text: qsTr("Exit")
        }
    }
}
