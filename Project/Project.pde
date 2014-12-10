import processing.video.*;

Capture cam;
int threshold = 100;
Keyboard[] keys = new Keyboard[4];
Note[] notes = new Note[3];
GameCore game;
Timer combotimer;

void setup() {
  size(640, 480);

  // setup cam, game, combotimer
  cam = new Capture(this, width, height, 30);
  game = new GameCore();
  //## combotimer = new Timer(1500); // ##experimental
  
  game.setupNotes();
  
  game.setupKeyboards();
  
  cam.start();
}

void draw() {

  // show camera image, with flipped
  if (cam.available()) {
    cam.read();
    flip();
  }
  image(cam, 0, 0);
  

  for (int i=0; i < keys.length; i++) {
    keys[i].display();
  }
  
  for (int i=0; i < notes.length; i++) {
    notes[i].display();
  }


  game.displayHP();
  game.rule();
}

