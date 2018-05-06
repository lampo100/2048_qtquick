.import QTQml 2.6 as QML

var maxColumn = 4;
var maxRow = 4;
var maxIndex = maxColumn * maxRow;
var board = new Array(maxIndex);
var component;


function index(row, column) {
    return (row * maxColumn) + column;
}

function startNewGame() {
    //Delete blocks from previous game
    for (var i = 0; i < maxIndex; i++) {
        if (board[i] != null)
            board[i].destroy();
    }

    //Create board
    board = new Array(maxIndex);
        for (var row = 0; row < maxRow; row++) {
            for (var column = 0; column < maxColumn; column++) {
                board[index(row, column)] = null;
                createBlock(row, column);
            }
        }
}

function createBlock(row, column){
    if (component == null)
            component = Qt.createComponent("./Cell.qml");

    if (component.status == QML.Component.Ready) {
        var dynamicObject = component.createObject(background);
           if (dynamicObject == null) {
               console.log("error creating block");
               console.log(component.errorString());
               return false;
           }
         dynamicObject.row = row;
         dynamicObject.column = column;
         board[index(row, column)] = dynamicObject;
    }else {
         console.log("error loading block component");
         console.log(component.errorString());
         return false;
    }
    return true;
}

