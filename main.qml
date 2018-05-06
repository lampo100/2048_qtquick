import QtQuick 2.6
import QtQuick.Window 2.2
import "./gameLogic.js" as GameLogic

Window {
    visible: true
    width: 360
    height: 480
    title: qsTr("2048")

    MainForm {
        Component.onCompleted: {
           GameLogic.startNewGame()
        }
        id: rootWindow
        anchors.fill: parent
        focus: true
        Keys.onPressed: {
            if (event.key == Qt.Key_R ){
                GameLogic.startNewGame();
            }
            if (event.key == Qt.Key_A || event.key === Qt.Key_Left) {
                var result = GameLogic.left();
                if(result === true)
                    GameLogic.spawnNewBlock();
            }
            if(event.key == Qt.Key_D || event.key === Qt.Key_Right){
                var result = GameLogic.right();
                if(result === true)
                    GameLogic.spawnNewBlock();
            }
            if(event.key == Qt.Key_W || event.key === Qt.Key_Up){
                var result = GameLogic.up();
                if(result === true)
                    GameLogic.spawnNewBlock();
            }
            if(event.key == Qt.Key_S || event.key === Qt.Key_Down){
                var result = GameLogic.down();
                if(result === true)
                    GameLogic.spawnNewBlock();
            }
        }
    }


}
