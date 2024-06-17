void initiateStars(){
  //sets up stars
  int i = 0;
  while (i<100) {
    x[i] = random(0, width);
    y[i] = (height-max(distance+(trnsltNum*height), height)) +random(0, width);
    speed[i] = random(0.1, 0.5);
    i++;
  }
}

void updateStars(){
  //updates the stars
    stroke(255);
    int i = 0;
    while (i<100) {
      ellipse( x[i], y[i], 2, 2 );
      y[i]+=speed[i];
      if (y[i]>height-max(distance-(trnsltNum*height), 0)) {
        y[i] = height-max(distance+((1-trnsltNum)*height), height);
      }
      i++;
    }
}
