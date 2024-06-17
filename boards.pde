PImage ast;


void updateBoards() {

  
  //Drawing stepping board
  for (int i = 0; i < boardYCount; i++) {
    for (int j = 0; j < boardXCount; j++) {
      if (boardStat[i][j]) {
        rectMode(CENTER);
        //rect((0.5+j)*boardWidth,height-boardYPos[i],boardWidth,boardThickness);
        imageMode(CENTER);
        if (!falling && !emptyFalling) {
          if (astNum[j]==1) {
            ast = astA;
          } else if (astNum[j]==2) {
            ast = astB;
          } else if (astNum[j]==3) {
            ast = astC;
          } else if (astNum[j]==4) {
            ast = astD;
          } else if (astNum[j]==5) {
            ast = astE;
          } else {
            ast = astF;
          }
        } else if(falling) {
          if (astNum[j]==1) {
            ast = metA;
          } else if (astNum[j]==2) {
            ast = metB;
          } else if (astNum[j]==3) {
            ast = metC;
          } else if (astNum[j]==4) {
            ast = metD;
          } else if (astNum[j]==5) {
            ast = metC;
          } else {
            ast = metD;
          }
        }
        image(ast, (0.5+j)*boardWidth, height-boardYPos[i], 100, 100);
      }
    }
  }


  //Clearing unseen board and adding new one
  if (boardYPos[0] < distance - (trnsltNum*height)) {   //0.5 is the trnsltNum   //make this check higher
    //Shifting board's array
    for (int i = 0; i < boardYCount-1; i++) {
      for (int j = 0; j < boardXCount; j++) {
        boardStat[i][j] = boardStat[i+1][j];
      }
      boardYPos[i] = boardYPos[i+1];
    }
  }
  if (!emptyFalling && !falling) {
    //Creating new boards
    for (int j = 0; j < boardXCount; j++) {
      isBoard = false;
      //Declaring random number for board generation
      tempRandom = random(1);
      if (tempRandom < boardOccurence) {
        boardStat[boardYCount-1][j] = true;
      } else {
        boardStat[boardYCount-1][j] = false;
      }

      //Placing new boards on higher location
      boardYPos[boardYCount-1] = boardYPos[boardYCount-2]+((1.0/boardYCount)*height);
    }
    if (isBoard ==false) {  
      boardStat[boardYCount-1][int(random(boardXCount))] = true;
    } 
  }
  else if (falling && !emptyFalling) {
    //Creating new killer boards
    for (int j = 0; j < boardXCount; j++) {
      //Declaring random number for board generation
      tempRandom = random(1);
      if (tempRandom < killerOccurence) {
        boardStat[boardYCount-1][j] = true;
      } else {
        boardStat[boardYCount-1][j] = false;
      }

      //Placing new boards on higher location
      boardYPos[boardYCount-1] = boardYPos[boardYCount-2]+((1.0/boardYCount)*height);
    }
  }
}
