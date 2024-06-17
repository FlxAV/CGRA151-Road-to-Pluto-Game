void keyPressed(){
  
  if (stage==1 && key == 'q'){exit();}
  if (key == 'd'){right = 1; LorR = true;}
  if (key == 'a'){left = -1; LorR = false;}
   
  if (stage==1 && key == ' '){ stage=3; setup();   }
   if (stage==4 && key == ' '){ stage=1;}
  if(key == 'r'){  stage =3; setup();}
  if(stage==3 && key =='m'){ stage=1; }
  if(stage==1 && key =='c'){ stage=2;}
  if(stage==2 && key =='b'){ stage=1;}
  //creat a meanu that does pause instaed of restart

}


void keyReleased(){
  if (key == 'd'){right = 0;}
  if (key == 'a'){left = 0;}
}




//if (key==CODED){
//   if(key == RIGHT){
//    right = 1; 
//   }else if (key == LEFT){
//    left = -1; 
//   }
//  }
