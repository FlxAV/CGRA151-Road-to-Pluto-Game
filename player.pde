//draws the player and applies all the physics 

float cosmoSize = 70;

void updatePlayer() {

  PImage UoDR = cosmoR;
  PImage UoDL = cosmoL;
  //draw parachute
  if (distance>end) {
    image(parachute, doodleXPos, height-(doodleYPos+(0.5*doodleRad))+20, cosmoSize, cosmoSize);   //replace with parachute
    UoDR = cosmoRU;
    UoDL = cosmoLU;
  }


  //Drawing doodle
  ellipseMode(CENTER);
  imageMode(CENTER);
  //fill(0,255,0);
  //ellipse(doodleXPos,height-(doodleYPos+(0.5*doodleRad)),doodleRad,doodleRad); 
  if (LorR) {
    image(UoDR, doodleXPos, height-(doodleYPos+(0.5*doodleRad))-10, cosmoSize, cosmoSize);
  } else {
    image(UoDL, doodleXPos, height-(doodleYPos+(0.5*doodleRad))-10, cosmoSize, cosmoSize);
  }



  if (doodleOnBoard) {
    doodleOnBoard = false;
    doodleYVel = jumpSpeed;
  }

  //Updating doodle position and applying some physics
  if (doodleOnBoard) {
    if (!boardStat[getYIndOfClosestLowerBoard(doodleYPos)][getXIndOfClosestBoard(doodleXPos)]) {
      doodleOnBoard = false;
      doodleYVel = abs(-gravity)*(-1);
      doodleYPos = doodleYPos-doodleYVel;
    }
  }
  if (!doodleOnBoard) {

    //Moving doodle
    doodleYPos_e = doodleYPos + doodleYVel;
    if (!falling) {
      doodleYVel = doodleYVel - gravity;
    }


    //Anticipating doodle stepping on board
    if ((doodleYVel < 0) && (doodleYPos_e < getYPosOfClosestLowerBoard(doodleYPos)) && (boardStat[getYIndOfClosestLowerBoard(doodleYPos)][getXIndOfClosestBoard(doodleXPos)])) {
      doodleOnBoard = true;
      doodleYPos = getYPosOfClosestLowerBoard(doodleYPos);
      doodleYVel = 0;
    } else if (falling && distance>7000) {
      //Anticipatidng doodle heading the board
      if ((doodleYVel > 0) && (doodleYPos_e > getYPosOfClosestUpperBoard(doodleYPos -285)) && (boardStat[getYIndOfClosestUpperBoard(doodleYPos-285)][getXIndOfClosestBoard(doodleXPos)])) {      
        //boardStat[getYIndOfClosestUpperBoard(doodleYPos)][getXIndOfClosestBoard(doodleXPos)] = false;
        //doodleYPos = getYPosOfClosestUpperBoard(doodleYPos);
        test01 = true;

        doodleYVel = 0;
        stage=1;
        setup();
      } else {
        doodleYPos = doodleYPos_e;
      }
    }


    //Executing normal aerial
    else {   
      doodleYPos = doodleYPos_e;
    }
  }




  // Walk left and right. See Car example for more detail.
  doodleXVel = movementSpeed * (left + right);
  velocity.x = doodleXVel;
  // We check the nextPosition before actually setting the position so we can
  // not move the sphere if he's colliding.
  PVector nextPosition = new PVector(doodleXPos, doodleYPos);
  nextPosition.add(velocity);

  // Check collision with edge of screen and don't move if at the edge
  float offset = 0;
  if (nextPosition.x > offset && nextPosition.x < (width - offset) ) { 
    //makes it so at end of level, walking right ends game;
    if (nextPosition.x > width-10  && ending) {
      stage=4;
    }
    doodleXPos = nextPosition.x;
  }


  //if (nextPosition.y > offset && nextPosition.y < (height - offset))
  //{
  //  oldGuy.position.y = nextPosition.y;
  //}
}
