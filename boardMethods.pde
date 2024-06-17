//Declaring method to find the X index of the closest board
int getXIndOfClosestBoard(float doodleXPos)
{
  return floor(doodleXPos/(width/boardXCount));
}

//Declaring method to find the Y index of the closest upper board
int getYIndOfClosestLowerBoard(float doodleYPos)
{
  //return floor((doodleYPos)/(height/boardYCount));
  return floor((doodleYPos-max(distance-(0.5*height),0))/(height/boardYCount));
}

//Declaring method to find the Y index of the closest lower board
int getYIndOfClosestUpperBoard(float doodleYPos)
{
  //return ceil((doodleYPos+1)/(height/boardYCount));
  return ceil((doodleYPos-max(distance-(0.5*height),0))/(height/boardYCount));
}

//Declaring method to find the Y position of the closest lower board
float getYPosOfClosestLowerBoard(float doodleYPos)
{
  return floor(doodleYPos/(height/boardYCount))*(height/boardYCount);
}

//Declaring method to find the Y position of the closest upper board 
float getYPosOfClosestUpperBoard(float doodleYPos)
{
  return ceil((doodleYPos+1)/(height/boardYCount))*(height/boardYCount)-(doodleRad);
}
