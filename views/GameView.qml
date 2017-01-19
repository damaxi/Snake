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
        property var body: []
        property int move: 1
        function redraw() {
            head += move
            body.unshift(head)
            checkColission()
            itemAt(head).snake = true
            itemAt(body.pop()).snake = false
        }
        function randFood() {

        }
        function checkColission() {
            if (head < 0 || head > 625 ||
                    (head % 25 == 1 && head - body[1] == 1) ||
                    (head % 25 == 24 && head - body[1] == -1)
               ) {
                gameTick.stop()
                console.log("Game Over")
            }
        }
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
                cells.body.push(cells.head - i)
            }
        }
        onTriggered: {
            cells.redraw()
        }
    }
    Keys.onPressed: {
        if (event.key == Qt.Key_Left) {
            if (cells.move != 1) cells.move = -1
        } else if (event.key == Qt.Key_Right) {
            if (cells.move != -1) cells.move = 1
        } else if (event.key == Qt.Key_Up) {
            if (cells.move != 25) cells.move = -25
        } else if (event.key == Qt.Key_Down) {
            if (cells.move != -25) cells.move = 25
        }
    }
}
