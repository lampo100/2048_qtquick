import QtQuick 2.6

Item {
    id: container

    property real row: 0
    property real column: 0
    width: (parent.width - parent.border.width*2 - 25) / 4
    height: width
    x: (parent.border.width + 5) + column * width + column * 5
    y: (parent.border.width + 5) + row * width + row * 5

    property color color: "#ffffff"
    property int score: 2
    property bool dying: false
    property bool spawned: false

    Rectangle {
        id: rectangle
        border.color: "black"
        border.width: 0
        anchors.fill: parent
        color: {
            if(score === 2){
                "#eee4da"
            }else if(score === 4){
                "#ece0ca"
            }else if(score === 8){
                "#ece09c"
            }else if(score === 16){
                "#f59565"
            }else if(score === 32){
                "#f57c5f"
            }else if(score === 64){
                "#f65d3b"
            }else if(score === 128){
                "#edce71"
            }else if(score === 256){
                "#edcc63"
            }else if(score === 512){
                "#ede34d"
            }else if(score === 1024){
                "#eec245"
            }else if(score === 2048){
                "#edd427"
            }else if(score === 4096){
                "#edf600"
            }else if(score === 8192){
                "#ad65ec"
            }
        }
        Text{
            id: scoreText
            text: score
            font.weight: Font.Normal
            color:{
                if(score === 2){
                    "#000000"
                }else if(score === 4){
                    "#000000"
                }else if(score === 8){
                    "#000000"
                }else if(score === 16){
                    "#ffffff"
                }else if(score === 32){
                    "#ffffff"
                }else if(score === 64){
                    "#ffffff"
                }else if(score === 128){
                    "#ffffff"
                }else if(score === 256){
                    "#ffffff"
                }else if(score === 512){
                    "#ffffff"
                }else if(score === 1024){
                    "#ffffff"
                }else if(score === 2048){
                    "#ffffff"
                }else if(score === 4096){
                    "#ffffff"
                }else if(score === 8192){
                    "#ffffff"
                }
            }

            font.family: "Verdana"
            font.pixelSize: rectangle.width * 0.5
            anchors.horizontalCenter: rectangle.horizontalCenter
            anchors.verticalCenter: rectangle.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
        opacity: 0
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
            name: "AliveState"
            when: spawned == true && dying == false
            PropertyChanges {target: rectangle; opacity: 1}
        },

        State {
            name: "DeathState"
            when: dying == true
            PropertyChanges { target: rectangle; opacity: 0 }
            StateChangeScript { script: container.destroy(500); }
        }


    ]

}
