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
                GameLogic.startNewGame();
            }

            if (event.key == Qt.Key_A) {
                GameLogic.left();
                GameLogic.spawnNewBlock();
            }
            if(event.key == Qt.Key_D){
                GameLogic.right();
                GameLogic.spawnNewBlock();
            }
            if(event.key == Qt.Key_W){
                GameLogic.up();
                GameLogic.spawnNewBlock();
            }
            if(event.key == Qt.Key_S){
                GameLogic.down();
                GameLogic.spawnNewBlock();
            }
        }
    }


}
