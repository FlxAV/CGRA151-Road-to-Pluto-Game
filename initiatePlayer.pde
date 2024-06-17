void initiatePlayer(){
 //Initiating doodle
  doodleOnBoard = true;
  doodleXPos = 300;
  doodleYPos = 0;
  doodleYVel = 0;
  doodleXVel = 0;
  doodleRad = 0.025*height;
  movementSpeed = 5;
  velocity = new PVector(0, 0);
  //Initiating environment variable
  gravity =  0.5;    //0.125*height/desiredFPS/desiredFPS;
  jumpSpeed =  12;     //0.25*height/desiredFPS;
   
}
