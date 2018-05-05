import QtQuick 2.6

Rectangle {
    id: root

    width: 360
    height: 480
    color: "#faf7f0"
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

        Row {
            id: labelsRow
            width: column.width
            height: column.height / 5
            spacing: labelsRow.width / 8

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
                    font.pixelSize: rectangle.width / 3
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
                spacing: 3

                Rectangle {
                    id: scoreRectangle
                    width: scoresRow.width / 2 - scoresRow.spacing
                    height: labelsRow.height / 2.5
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
                    width: scoresRow.width / 2 - scoresRow.spacing
                    height: labelsRow.height / 2.5
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
            width: column.width <= column.height - labelsRow.height ? column.width :  column.height - labelsRow.height
            height: gameBoard.width
            color: "#bbab9c"
            radius: 21
            anchors.leftMargin: (column.width - gameBoard.width )/ 5
            anchors.left: parent.left
            border.width: gameBoard.radius - 5
            border.color: "#fbf8f1"
            clip: false
        }
    }
}
