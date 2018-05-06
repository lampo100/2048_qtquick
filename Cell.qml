import QtQuick 2.6

Item {
    id: container
    property real row: 0
    property real column: 0
    width: (parent.width - parent.border.width*2 - 25) / 4
    height: width
    x: (parent.border.width + 5) + column * width + column * 5
    y: (parent.border.width + 5) + row * width + row * 5
    property bool running: false
    property color color: "#ffffff"
    property int score: 2
    property bool dying: false
    Rectangle {
        id: rectangle
        border.color: "black"
        border.width: 0
        anchors.fill: parent
        color: {
            if(score === 2){
                "#eee4da"
            }else{
                "#ece0ca"
            }
        }
        Text{
            id: scoreText
            text: score
            font.weight: Font.Normal
            font.family: "Verdana"
            font.pixelSize: rectangle.width * 0.5
            anchors.horizontalCenter: rectangle.horizontalCenter
            anchors.verticalCenter: rectangle.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
        Behavior on opacity {
            NumberAnimation{properties:"opacity"; duration: 200}
        }
    }    
    Behavior on column {
        NumberAnimation { duration: 150 }
    }

    Behavior on row {
        NumberAnimation { duration: 150 }
    }
    states: [
        State {
            name: "DeathState"
            when: dying == true
            PropertyChanges { target: rectangle; opacity: 0 }
            StateChangeScript { script: container.destroy(500); }
        }
    ]

}
