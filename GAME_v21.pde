//Declaring variable for game parameter
int desiredFPS = 40;
float distance;
float time;
float boardOccurence = 0.1;
float killerOccurence = 0.05;
float gravity;
float jumpSpeed;

boolean falling=false;
boolean emptyFalling=false;
boolean translate = false;
boolean ending = false;
float trnsltNum=0.5;

boolean test01 = false;

//Declaring variables for menus
int stage=1;
PImage startScreen;
PImage endScreen;
PImage controlScreen;
PFont font;
PFont numFont;
float end = 20000;

//images
PImage cosmoL;
PImage cosmoR;
PImage cosmoRU;
PImage cosmoLU;
PImage parachute;
boolean LorR;  //true = left
PImage astA;
PImage astB;
PImage astC;
PImage astD;
PImage astE;
PImage astF;
PImage metA;
PImage metB;
PImage metC;
PImage metD;
PImage pluto;
int temp;


//Declaring variable for doodle
boolean doodleOnBoard;
float doodleXPos;
float doodleYPos;
float doodleYPos_e;
float doodleYVel;
float doodleXVel;

PVector velocity;

float doodleRad;
float movementSpeed;
float right;
float left;

//declaring star variables
float[] x = new float[100];
float[] y = new float[100];
float[] speed = new float[100];



//Declaring variable for stepping board
int boardXCount = 8;
int boardYCount = 10;
float boardWidth;
float boardThickness;
float level;
boolean boardStat[][];
float astNum[];
float boardYPos[];
boolean isBoard;

//declaring variables for killer boards
int killerXCount = 8;
int killerYCount = 10;
float killerWidth;
float killerThickness;
boolean killerStat[][];
float killerYPos[];

//Declaring variable for temporary random number
float tempRandom;

//Declaring setup method
void setup()
{

  //loads all the images 
  cosmoL = loadImage("cosmonauteLeft.png");
  cosmoR = loadImage("cosmonauteRight.png");
  cosmoLU = loadImage("cosmonauteLeftUp.png");
  cosmoRU = loadImage("cosmonauteRightUp.png");
  parachute = loadImage("parachute.png");
  startScreen=loadImage("menuScreen.png");
  endScreen=loadImage("endScreen.png");
  controlScreen=loadImage("controlScreen.png");
  astA=loadImage("asteroidA.png");
  astB=loadImage("asteroidB.png");
  astC=loadImage("asteroidC.png");
  astD=loadImage("asteroidD.png");
  astE=loadImage("asteroidE.png");
  astF=loadImage("asteroidF.png");
  metA = loadImage("meteorA.png");
  metB = loadImage("meteorB.png");
  metC = loadImage("meteorC.png");
  metD = loadImage("meteorD.png");
  pluto = loadImage("pluto.png");
  //loads the fonts
  font = createFont("SPACEBAR.ttf", 128);
  numFont = createFont("SPACEBIT.TTF", 128);

//reset the conditions to starting position
  falling=false;
  emptyFalling=false;
  translate = false;
  trnsltNum=0.5;
  ending = false;

  //Declaring window size
  size(600, 800);
  //Resetting distance
  distance = 0;
  //Calculating board dimension
  boardWidth = width/boardXCount;
  boardThickness = height/boardYCount/10;
  level = height/boardYCount;

initiateStars();

//initiates everything
  background(0);
  initiateBoards();
  updateBoards();
  initiatePlayer();
  updatePlayer();

}


void draw() {  //**********************************************************************************************************************************************
  if (stage == 1) { //start menu
    imageMode(CORNER);
    image(startScreen, 0, 0, width, height);
  } else if (stage==2) { //control screen
    image(controlScreen, 0, 0, width, height);
  } else if (stage==3) { //the actual game

//conditions to check where in the game we're up to
    if (distance>10000 && distance<=12000) {
      emptyFalling=true;
      trnsltNum -=0.005;
    }   //change 4000 to 10000 and falling to empty falling
    else if (distance>12000 && distance<=end) {
      emptyFalling = false; 
      falling=true;
    } else if (distance>end && distance<=end+1000) {
      falling=false;
      emptyFalling=true;
      doodleYVel =4;
    } else if (distance>end+1000 && distance<end+1100) {
      doodleYVel = 0;
      ending = true;
    }
//moves the doodle at some point
    if (trnsltNum<0.25) {
      translate = true;
    }
    if (translate) {
      trnsltNum = 0.25;
    }


    float tempDistance = distance;

//changes the gravity as we go up
    gravity = 0.5 - distance/(level*100);

    if (falling || emptyFalling && distance<end) {
      gravity = 0;
      doodleYVel = 10.5;
    } else if (tempDistance<=10000 && tempDistance>8000) {
      gravity = 0.09;
    } else if (tempDistance<=8000 && tempDistance>6000) {
      gravity = 0.1;
    } else if (tempDistance<=6000 && tempDistance>4000) {
      gravity = 0.11;
    }

    //Drawing background
    background(0);
    //Translating everything
    distance = max(distance, doodleYPos);

    translate(0, max(distance-(trnsltNum*height), 0));
    
    //updates everything
    updateStars();
    updateBoards();
    updatePlayer();

    //final planet you reach
    image(pluto, width/2, -(end+770), width, 1500);


    //Displaying the top area that tells you current distance and options
    fill(129, 129, 129);
    stroke(0);
    rect(0, height-max(distance+((1-trnsltNum)*height), height), 2*width, -210);

    textAlign(CENTER);
    fill(0);
    textFont(font, 15);
    text("Press -r- to Reset", 140, height-max(distance+((1-trnsltNum)*height), height)+ 40, width, 40);
    text("Press -m- for Menu", 139, height-max(distance+((1-trnsltNum)*height), height)+ 70, width, 40);
    textSize(25);
    text("SCORE ", width-220, height-max(distance+((1-trnsltNum)*height), height)+ 50, width, 40);
    textFont(numFont, 40);
    text(":", width-170, height-max(distance+((1-trnsltNum)*height), height) +  48, width, 40);
    text(str(int(distance)), width-100, height-max(distance+((1-trnsltNum)*height), height) +  48, width, 40);




    //Checking for game over
    if (doodleYPos < max(distance-(0.5*height), 0)) {  
      setup();
    }  //exit();
  } else if (stage==4) {// end screen
    imageMode(CORNER);
    image(endScreen, 0, 0, width, height);
  }
}//**********************************************************************************************************************************************
