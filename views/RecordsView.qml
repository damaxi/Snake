import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.4

Frame {
    id: gameOverView
    property int foodEaten: 0
    background: Rectangle {
        color: "transparent"
        border.color: "#4DB6AC"
        border.width: 2
        radius: 2
    }
    ColumnLayout {
        anchors.fill: parent
        spacing: 10
        Label {
            id: recordLabel
            text: qsTr("Records:")
            color: "white"
            font { bold: true; pixelSize: 30 }
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
        }
        Repeater {
            model: mainWindow.records
            Label {
                text: modelData
                color: "orange"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font { pixelSize: 24 }
                Layout.fillWidth: true
            }
        }
    }
}
