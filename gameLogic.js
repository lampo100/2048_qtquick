
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
    if(board[index(0, 2)] === null)
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

    var blocksToKill = new Array(0);

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
                    // First we should check if the block that is being absorbed has been already moved. If so then we need to change his final destination AT THE ORIGINAL PLACE IN ARRAY
                    for(var z = 0; z < maxIndex; z++){
                        if(finalDestination[z] === index(k, i+1)){
                            found = true;
                            finalDestination[z] = index(k, i);
                            blocksToKill.push(z);
                            break;
                        }
                    }
                    // If we haven't found such a block then that means that we are moving it for the first time
                    if(found === false){
                        finalDestination[index(k, i+1)] = index(k, i);
                        blocksToKill.push(index(k, i+1));
                    }
                    board[index(k, i+1)] = null;

                    //Also double the score
                    board[index(k, i)].score *= 2;
                }
            }
        }
    }
    for(k = 0; k < maxIndex; k++){
        if(board[k] !== null)
            console.log("Board[after2]: " + k);
    }
    for(k = 0; k < maxIndex; k++){
        if(finalDestination[k] !== null)
            console.log("FD[after2](index:" + k + "): " + finalDestination[k]);
    }
    // THIRD PHASE
    for(k = 0; k < 4; k++){
        for(i = 0; i < 4; i++){
            if(board[index(k, i)] !== null){
                currentTile = board[index(k, i)];
                for(j = 0; j < i; j++)
                    if(board[index(k, j)] === null){
                        console.log("(k, i): " + index(k, i));
                        console.log("(k, j): " + index(k, j));
                        found = false;
                        for(z = 0; z < maxIndex; z++){
                            if(finalDestination[z] === index(k, i)){
                                finalDestination[z] = index(k, j);
                                for (var p = 0; p < blocksToKill.length; p++){
                                    if(blocksToKill[p] !== null)
                                        if(blocksToKill[p] === z){
                                            finalDestination[index(k, i)] = index(k, j);
                                        }
                                }
                                found = true;
                                break;
                            }
                        }
                        if(found === false)
                            finalDestination[index(k, i)] = index(k, j);
                        board[index(k, j)] = currentTile;
                        board[index(k, i)] = null;
                        break;
                    }
            }
        }
    }
    for(k = 0; k < maxIndex; k++){
        if(board[k] !== null)
            console.log("Board[after3]: " + k);
    }
    for(k = 0; k < maxIndex; k++){
        if(finalDestination[k] !== null)
            console.log("FD[after3](index:" + k + "): " + finalDestination[k]);
    }


    for (i = 0; i < maxIndex; i++) {
        if (finalDestination[i] !== null){
            startingBoard[i].row = Math.floor(finalDestination[i] / maxRow);
            startingBoard[i].column = finalDestination[i] % maxColumn;
        }
    }
    for (i = 0; i < blocksToKill.length; i++){
        if(blocksToKill[i] !== null){
            console.log("Killing: " + blocksToKill[i]);
            startingBoard[blocksToKill[i]].dying = true;
        }
    }
}

function right(){
    var finalDestination = new Array(maxIndex)
    for (var i = 0; i < maxIndex; i++) {
        finalDestination[i] = null;
    }

    var blocksToKill = new Array(0);

    var startingBoard = new Array(maxIndex);
    for(i = 0; i < maxIndex; i++){
        startingBoard[i] = board[i];
    }

    // First phase
    var currentTile;
    for(var k = 0; k < 4; k++){
        for(i = 3; i >= 0; i--){
            if(board[index(k, i)] !== null){
                currentTile = board[index(k, i)];
                for(var j = 3; j > i; j--)
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
        for(i = 3; i > 0; i--){
            if(board[index(k, i)] !== null){
                currentTile = board[index(k, i)];
                if(board[index(k, i-1)] !== null && board[index(k, i-1)].score == currentTile.score){
                    console.log("Joining: " + index(k, i) + " and " + index(k, i-1));
                    var found = false;
                    // First we should check if the block that is being absorbed has been already moved. If so then we need to change his final destination AT THE ORIGINAL PLACE IN ARRAY
                    for(var z = 0; z < maxIndex; z++){
                        if(finalDestination[z] === index(k, i-1)){
                            found = true;
                            finalDestination[z] = index(k, i);
                            blocksToKill.push(z);
                            break;
                        }
                    }
                    // If we haven't found such a block then that means that we are moving it for the first time
                    if(found === false){
                        finalDestination[index(k, i-1)] = index(k, i);
                        blocksToKill.push(index(k, i-1));
                    }
                    board[index(k, i-1)] = null;

                    //Also double the score
                    board[index(k, i)].score *= 2;
                }
            }
        }
    }
    for(k = 0; k < maxIndex; k++){
        if(board[k] !== null)
            console.log("Board[after2]: " + k);
    }
    for(k = 0; k < maxIndex; k++){
        if(finalDestination[k] !== null)
            console.log("FD[after2](index:" + k + "): " + finalDestination[k]);
    }

    // THIRD PHASE
    for(k = 0; k < 4; k++){
        for(i = 3; i >= 0; i--){
            if(board[index(k, i)] !== null){
                currentTile = board[index(k, i)];
                for(j = 3; j > i; j--)
                    if(board[index(k, j)] === null){
                        console.log("(k, i): " + index(k, i));
                        console.log("(k, j): " + index(k, j));
                        found = false;
                        for(z = 0; z < maxIndex; z++){
                            if(finalDestination[z] === index(k, i)){
                                finalDestination[z] = index(k, j);
                                for (var p = 0; p < blocksToKill.length; p++){
                                    if(blocksToKill[p] !== null)
                                        if(blocksToKill[p] === z){
                                            finalDestination[index(k, i)] = index(k, j);
                                        }
                                }
                                found = true;
                                break;
                            }
                        }
                        if(found === false)
                            finalDestination[index(k, i)] = index(k, j);
                        board[index(k, j)] = currentTile;
                        board[index(k, i)] = null;
                        break;
                    }
            }
        }
    }
    for(k = 0; k < maxIndex; k++){
        if(board[k] !== null)
            console.log("Board[after3]: " + k);
    }
    for(k = 0; k < maxIndex; k++){
        if(finalDestination[k] !== null)
            console.log("FD[after3](index:" + k + "): " + finalDestination[k]);
    }


    for (i = 0; i < maxIndex; i++) {
        if (finalDestination[i] !== null){
            startingBoard[i].row = Math.floor(finalDestination[i] / maxRow);
            startingBoard[i].column = finalDestination[i] % maxColumn;
        }
    }
    for (i = 0; i < blocksToKill.length; i++){
        if(blocksToKill[i] !== null){
            console.log("Killing: " + blocksToKill[i]);
            startingBoard[blocksToKill[i]].dying = true;
        }
    }
}

