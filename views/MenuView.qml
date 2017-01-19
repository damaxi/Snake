import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.4

Frame {
    background: Rectangle {
        color: "transparent"
        border.color: "#4DB6AC"
        border.width: 2
        radius: 2
    }
    ColumnLayout {
        spacing: 20
        anchors.centerIn: parent
        Button {
            text: qsTr("Start Game")
            onClicked: stackView.replace(Qt.resolvedUrl("qrc:/views/GameView.qml"))
            Layout.fillWidth: true
        }
        Button {
            text: qsTr("Records")
            Layout.fillWidth: true
        }
        Button {
            text: qsTr("Exit")
            Layout.fillWidth: true
        }
    }
}
