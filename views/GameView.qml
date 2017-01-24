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
        property int food: 0
        property int foodEaten: 0
        function redraw() {
            head += move
            body.unshift(head)
            if (checkColission())
                return
            itemAt(head).snake = true
            if (!checkIfFood())
                itemAt(body.pop()).snake = false
        }
        function randFood() {
            var foodPosition = Math.floor(Math.random() * 626)
            while (true) {
                for (var snakeBodyPosition in body) {
                    if (foodPosition == snakeBodyPosition) {
                        foodPosition = Math.floor(Math.random() * 626)
                        continue
                    }
                }
                return foodPosition
            }
        }
        function setNewFood() {
            food = randFood()
            cells.itemAt(food).food = true
        }
        function checkColission() {
            if (head < 0 || head > 625 ||
                    ( (head + 1) % 25 == 1 && (head + 1) - (body[1] + 1) == 1) ||
                    ( (head - 1) % 25 == 24 && (head - 1) - (body[1] - 1) == -1)
               ) {
                gameTick.stop()
                stackView.replace(Qt.resolvedUrl("qrc:/views/GameOverView.qml"), {"foodEaten": foodEaten})
                mainWindow.records.push(foodEaten)
                return true
            }
            return false
        }
        function checkIfFood() {
            if (head == food) {
                cells.itemAt(food).food = false
                ++foodEaten
                setNewFood()
                return true
            }
            return false
        }
        Rectangle {
            property bool snake: false
            property bool food: false
            color: snake ? "green" : (food ? "red" : "white")
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
        interval: 100; running: false; repeat: true; triggeredOnStart: true
        onRunningChanged: {
            // create snake in the middle
            if (gameTick.running) {
                for (var i = 0; i < cells.length; i++) {
                    cells.itemAt(cells.head - i).snake = true
                    cells.body.push(cells.head - i)
                }
                cells.setNewFood()
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
