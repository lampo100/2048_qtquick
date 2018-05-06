import QtQuick 2.6
Rectangle {
    id: root

    width: 360
    height: 480
    color: "#faf7f0"
    property alias gameBoard: gameBoard
    property alias highScore: highScore
    property alias score: score
    border.width: 0
    border.color: "#faf7f0"

    Column {
        id: column
        width: root.height
        height: root.width
        anchors.fill: parent
        spacing: 0

        Rectangle {
            id: labelsRow
            width: gameBoard.width
            height: column.height / 5
            color: "#fbf8f1"
            anchors.leftMargin: gameBoard.x
            anchors.left: parent.left

            Rectangle {
                id: rectangle
                y: labelsRow.height / 4
                width: labelsRow.width / 3
                height: labelsRow.height / 2
                color: "#00ffffff"
                radius: 11
                border.width: 0
                transformOrigin: Item.Center

                Text {
                    id: gameLabel
                    color: "#7a7168"
                    text: qsTr("2048")
                    font.capitalization: Font.AllUppercase
                    style: Text.Normal
                    font.weight: Font.ExtraBold
                    font.pixelSize: rectangle.width
                                    > rectangle.height ? rectangle.width / 3 : rectangle.height / 3
                    font.strikeout: false
                    font.family: "Times New Roman"
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    transformOrigin: Item.TopLeft
                    styleColor: "#7a6868"
                    fontSizeMode: Text.VerticalFit
                    textFormat: Text.RichText
                }
            }

            Row {
                id: scoresRow
                width: labelsRow.width - rectangle.width - labelsRow.spacing
                height: labelsRow.height
                anchors.leftMargin: labelsRow.width / 2
                anchors.left: parent.left
                spacing: 2
                opacity: 1

                Rectangle {
                    id: scoreRectangle
                    width: (gameBoard.width / 2 - gameBoard.border.width - scoresRow.spacing) / 2
                    height: scoreRectangle.width / 2.5
                    color: "#bcaea1"
                    radius: 4
                    anchors.topMargin: scoresRow.height / 8
                    anchors.top: parent.top
                    clip: false
                    border.width: 0

                    Text {
                        id: scoreLabel
                        text: qsTr("Score")
                        textFormat: Text.RichText
                        font.pixelSize: scoreRectangle.width < scoreRectangle.height ? scoreRectangle.width / 3 : scoreRectangle.height / 3
                        font.capitalization: Font.AllUppercase
                        font.weight: Font.Bold
                        font.family: "Verdana"
                        anchors.horizontalCenter: parent.horizontalCenter
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }

                    Text {
                        id: score
                        text: qsTr("0")
                        font.weight: Font.Bold
                        font.family: "Verdana"
                        anchors.topMargin: -4
                        font.pixelSize: scoreLabel.font.pixelSize * 1.2
                        anchors.horizontalCenter: scoreLabel.horizontalCenter
                        anchors.top: scoreLabel.bottom
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                Rectangle {
                    id: highScoreRectangle
                    width: scoreRectangle.width
                    height: highScoreRectangle.width / 2.5
                    color: "#bcaea1"
                    radius: 4
                    border.width: 0
                    anchors.topMargin: scoresRow.height / 8
                    anchors.top: parent.top

                    Text {
                        id: highScoreLabel
                        text: qsTr("BEST")
                        textFormat: Text.RichText
                        font.pixelSize: scoreRectangle.width < scoreRectangle.height ? scoreRectangle.width / 3 : scoreRectangle.height / 3
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.weight: Font.Bold
                        font.capitalization: Font.AllUppercase
                        font.family: "Verdana"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }

                    Text {
                        id: highScore
                        text: qsTr("0")
                        textFormat: Text.AutoText
                        font.family: "Verdana"
                        font.weight: Font.Bold
                        font.capitalization: Font.MixedCase
                        font.pixelSize: highScoreLabel.font.pixelSize * 1.2
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: highScoreLabel.bottom
                        anchors.topMargin: -4
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }

        Rectangle {
            id: gameBoard
            width: column.width <= column.height
                   - labelsRow.height ? column.width : column.height - labelsRow.height
            height: gameBoard.width
            color: "#beae9f"
            radius: 21
            anchors.leftMargin: (column.width - gameBoard.width) / 2
            anchors.left: parent.left
            border.width: gameBoard.radius - 5
            border.color: "#fbf8f1"
            clip: false

            Rectangle {
                id: rectangle1
                x: (parent.border.width + 5) + 0 * width + 0 * 5
                y: (parent.border.width + 5) + 0 * width + 0 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
            }

            Rectangle {
                id: rectangle2
                x: (parent.border.width + 5) +1 * width + 1* 5
                y: (parent.border.width + 5) + 0 * width + 0 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
            }

            Rectangle {
                id: rectangle3
                x: (parent.border.width + 5) +2 * width + 2 * 5
                y: (parent.border.width + 5) + 0 * width + 0 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
            }

            Rectangle {
                id: rectangle4
                x: (parent.border.width + 5) + 3 * width +3* 5
                y: (parent.border.width + 5) + 0 * width + 0 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
            }

            Rectangle {
                id: rectangle5
                x: (parent.border.width + 5) + 0 * width + 0 * 5
                y: (parent.border.width + 5) +1 * width + 1 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
            }

            Rectangle {
                id: rectangle6
                x: (parent.border.width + 5) + 1 * width +1 * 5
                y: (parent.border.width + 5) +1 * width + 1 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
            }

            Rectangle {
                id: rectangle7
                x: (parent.border.width + 5) + 2 * width +2 * 5
                y: (parent.border.width + 5) +1 * width + 1 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
            }

            Rectangle {
                id: rectangle8
                x: (parent.border.width + 5) + 3 * width + 3 * 5
                y: (parent.border.width + 5) +1 * width + 1 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
            }

            Rectangle {
                id: rectangle9
                x: 21
                y: (parent.border.width + 5) +2 * width + 2 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
                border.color: "#cdc1b5"
            }

            Rectangle {
                id: rectangle10
                x: (parent.border.width + 5) + 1 * width + 1 * 5
                y: (parent.border.width + 5) +2 * width + 2 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
            }

            Rectangle {
                id: rectangle11
                x: (parent.border.width + 5) + 2 * width + 2* 5
                y: (parent.border.width + 5) +2 * width + 2 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
            }

            Rectangle {
                id: rectangle12
                x: (parent.border.width + 5) + 3* width + 3 * 5
                y: (parent.border.width + 5) +2 * width + 2 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
            }

            Rectangle {
                id: rectangle13
                x: (parent.border.width + 5) + 0 * width + 0 * 5
                y: (parent.border.width + 5) +3 * width + 3 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
            }

            Rectangle {
                id: rectangle14
                x: (parent.border.width + 5) + 1 * width + 1 * 5
                y: (parent.border.width + 5) +3 * width + 3 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
            }

            Rectangle {
                id: rectangle15
                x: (parent.border.width + 5) + 2* width +2 * 5
                y: (parent.border.width + 5) +3 * width + 3 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
            }

            Rectangle {
                id: rectangle16
                x: (parent.border.width + 5) + 3 * width + 3 * 5
                y: (parent.border.width + 5) +3 * width + 3 * 5
                width: (parent.width - parent.border.width*2 - 25) / 4
                height: width
                color: "#cdc1b5"
                border.width: 0
            }
        }
    }
}
