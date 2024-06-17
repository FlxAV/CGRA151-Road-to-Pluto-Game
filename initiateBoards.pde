void initiateBoards(){
    //Initiating stepping boards
  boardStat = new boolean[boardYCount][boardXCount];
  for (int j = 0; j < boardXCount; j++){
    boardStat[0][j] = true;
  }
  for (int i = 1; i < boardYCount; i++){    
    for (int j = 0; j < boardXCount; j++){
       isBoard = false;
      //Declaring random number for board generation
      tempRandom = random(1);
      if (tempRandom < boardOccurence){
        isBoard=true;
        boardStat[i][j] = true;
        if(j<boardXCount-1){
        boardStat[i][j+1] = false;
        j++;
        }
      }else{
        boardStat[i][j] = false;
      }

    }
    if(isBoard ==false){  boardStat[i][int(random(boardXCount))] = true; }

  }
  boardYPos = new float[boardYCount];
  astNum = new float[boardYCount*boardXCount];
  
  for (int i = 0; i < boardYCount; i++)
  {
    boardYPos[i] = ((1.0/boardYCount)*i*height);
    for(int j = 0; j<boardXCount;j++){
   temp = int(random(1,7));
      
      if(temp==1){
      astNum[j] = 1;
      }
      else if(temp==2){
      astNum[j] = 2;
      }
      else if(temp==3){
      astNum[j] = 3;
      }
      else if(temp==4){
      astNum[j] = 4;
      }
      else if(temp==5){
      astNum[j] = 5;
      }else{
       astNum[j] = 6; 
      }
    }
  }
}
