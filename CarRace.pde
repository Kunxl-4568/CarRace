Car[] cars;
RaceTrack track;
boolean raceOver;

void setup() {
  size(1000, 600);
  track = new RaceTrack();
  cars = new Car[6];
  for (int i =1; i<cars.length; i++) {
    cars[i] = new Car(track.getStartPosition(), i*100, 60, color(200, 100, 100));
  }
  raceOver = false;
}

void draw() {
  background(70);
  track.display();

  for (int i =1; i< cars.length; i++) {
    cars[i].display();
  }

  detectWinners();
 
}

void detectWinners() {
  if (!raceOver) {
    for (int i =1; i< cars.length; i++) {
      if (cars[i].getPosition() >= track.getFinishPosition()) {
        raceOver = true;
        cars[i].detectOneWinner(track.getFinishPosition());
        cars[i].increaseScore();
        println("Press 's' to restart");
      } else {
        cars[i].move();
      }
    }
  }
}



  void keyPressed() {
    if (key == 's' && raceOver) {
      float startLine = track.getStartPosition();
      for (int i =1; i<cars.length; i++) {
        cars[i].setPosition(startLine);
      }
      raceOver = false;
    }
  }
