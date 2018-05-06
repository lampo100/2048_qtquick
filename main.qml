import QtQuick 2.6
import QtQuick.Window 2.2
import "./gameLogic.js" as GameLogic

Window {
    visible: true
    width: 360
    height: 480
    title: qsTr("Hello World")

    MainForm {
        Component.onCompleted: {
           GameLogic.startNewGame()
        }
        id: rootWindow
        anchors.fill: parent
        focus: true
        Keys.onPressed: {
            if (event.key == Qt.Key_R){
                GameLogic.startNewGamee();
            }

            if (event.key == Qt.Key_A) {
                console.log("move left");
                GameLogic.left();
                GameLogic.spawnNewBlock();
            }
            if(event.key == Qt.Key_D){
                console.log("move right");
                GameLogic.right();
                GameLogic.spawnNewBlock();
            }
            if(event.key == Qt.Key_W){
                console.log("move up");
                GameLogic.up();
                GameLogic.spawnNewBlock();
            }
            if(event.key == Qt.Key_S){
                console.log("move down");
                GameLogic.down();
                GameLogic.spawnNewBlock();
            }
        }
    }


}
