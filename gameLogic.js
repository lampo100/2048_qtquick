
var maxColumn = 4;
var maxRow = 4;
var maxIndex = maxColumn * maxRow;
var board = new Array(maxIndex);
var component;

function randomInt(min, max) {
    return Math.floor(Math.random() * (max - min) ) + min;
}

function randomScore() {
    var ran =  Math.random();
    if(ran < 0.5){
        return 2;
    }else{
        return 4;
    }
}

function index(row, column) {
    return (row * maxColumn) + column;
}

function startNewGame() {
    //Delete blocks from previous game
    for (var i = 0; i < maxIndex; i++) {
        if (board[i] != null)
            board[i].destroy();
    }
    //initialize board
    for (var row = 0; row < maxRow; row++) {
        for (var column = 0; column < maxColumn; column++) {
            board[index(row, column)] = null;
        }
    }

    //Create two random blocks
    var r = randomInt(0, 4);
    var c = randomInt(0, 4);
    console.log(String(r) + " " + String(c));
    if(board[index(r, c)] === null)
        createBlock(0, 1);

    var r2 = r;
    var c2 = c;
    while(r === r2 && c === c2){
        r2 = randomInt(0, 4);
        c2 = randomInt(0, 4);
    }
    console.log(String(r2) + " " + String(c2));
    if(board[index(r2, c2)] === null)
        createBlock(0, 2);
}

function createBlock(row, column){
    if (component == null)
            component = Qt.createComponent("./Cell.qml");
    var dynamicObject = component.createObject(rootWindow.gameBoard, {"row": row, "column": column, "score": randomScore()});
    if (dynamicObject == null) {
        console.log("error creating block");
        return false;
    }
    board[index(row, column)] = dynamicObject;

    return true;
}

function spawnNewBlock(){
    var r = randomInt(0, 4);
    var c = randomInt(0, 4);
    while(board[index(r, c)] !== null){
        r = randomInt(0, 4);
        c = randomInt(0, 4);
    }

    if(board[index(r, c)] === null)
        createBlock(r, c);
}

function left(){
    var finalDestination = new Array(maxIndex)
    for (var i = 0; i < maxIndex; i++) {
        finalDestination[i] = null;
    }

    var blocksToKill = new Array(maxIndex);
    for(i = 0; i < maxIndex; i++){
        blocksToKill[i] = null;
    }

    var startingBoard = new Array(maxIndex);
    for(i = 0; i < maxIndex; i++){
        startingBoard[i] = board[i];
    }

    // First phase
    var currentTile;
    for(var k = 0; k < 4; k++){
        for(i = 0; i < 4; i++){
            if(board[index(k, i)] !== null){
                currentTile = board[index(k, i)];
                for(var j = 0; j < i; j++)
                    if(board[index(k, j)] === null){
                        if(finalDestination[index(k, i)] === null)
                        finalDestination[index(k, i)] = index(k, j);
                        board[index(k, j)] = currentTile;
                        board[index(k, i)] = null;
                        console.log("FD[" + String(index(k, i)) + "] to " + String(k) + "," + String(j))
                        break;
                    }
            }
        }
    }
    for(k = 0; k < maxIndex; k++){
        if(board[k] !== null)
            console.log(k);
    }

    for(k = 0; k < 4; k++){
        for(i = 0; i < 3; i++){
            if(board[index(k, i)] !== null){
                currentTile = board[index(k, i)];
                if(board[index(k, i+1)] !== null && board[index(k, i+1)].score == currentTile.score){
                    console.log("Joining: " + index(k, i) + " and " + index(k, i+1));
                    var found = false;
                    for(var z = 0; z < maxIndex; z++){
                        if(finalDestination[z] === index(k, i+1)){
                            found = true;
                            finalDestination[z] = index(k, i);
                            blocksToKill.push(z);
                            break;
                        }
                    }
                    if(found === false){
                        finalDestination[index(k, i+1)] = index(k, i);
                        blocksToKill.push(index(k, i+1));
                    }
                    board[index(k, i+1)] = null;
                }
            }
        }
    }
    for(k = 0; k < maxIndex; k++){
        if(board[k] !== null)
            console.log(k);
    }

    /*for(int k = 0; k < 4; ++k){
        for(int i = 0; i < 3; ++i){
            if(grid.at(k)->at(i)->isInGame()){
                auto currentTile = grid.at(k)->at(i);
                if(grid.at(k)->at(i+1)->isInGame() &&
                   grid.at(k)->at(i+1)->getScore() == currentTile->getScore()){
                        lastAnimation = combineTiles(currentTile, grid.at(k)->at(i+1), 'l');
                        secondStage->addAnimation(lastAnimation);
                }
            }
        }
    }*/

    for (i = 0; i < maxIndex; i++) {
        if (finalDestination[i] !== null){
            startingBoard[i].row = Math.floor(finalDestination[i] / maxRow);
            startingBoard[i].column = finalDestination[i] % maxColumn;
        }
    }
}

