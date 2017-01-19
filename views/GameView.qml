import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.4

GridLayout {
    rows: 25
    columns: rows
    columnSpacing: 1
    rowSpacing: columnSpacing
    Repeater {
        id: cells
        model: 625
        property int length: 3
        property int head: model / 2
        Rectangle {
            property bool snake: false
            property bool food: false
            color: snake ? "green" : "white"
            width: 20
            height: width
            transformOrigin: Item.Center
        }
        Component.onCompleted: {
            gameTick.start()
        }
    }
    Timer {
        id: gameTick
        interval: 500; running: false; repeat: true; triggeredOnStart: true
        onRunningChanged: {
            // create snake in the middle
            for (var i = 0; i < cells.length; i++) {
                cells.itemAt(cells.head - i).snake = true
            }
        }
        onTriggered: {
            cells.head += 1
            var tail = cells.head - cells.length
            cells.itemAt(cells.head).snake = true
            cells.itemAt(tail).snake = false
        }
    }
}
