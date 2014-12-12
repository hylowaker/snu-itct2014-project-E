import processing.video.*;
import ddf.minim.*;

Capture cam;
AudioPlayer player;
Minim minim;
PImage[] keysimage = new PImage[4];


Keyboard[] keys;
Note[] notes;
GameCore game;
Timer songTimer;
Timer songsync3;
Startpage startpage;
int page = 0;

void setup() {
  size(640, 480);
  songsync3 = new Timer(800);
  game = new GameCore();
  for(int i=0; i<keysimage.length; i++){
    keysimage[i] = loadImage("key"+(i+1)+".png");
  }

  // setup audio. player object is initialized when song selected
  minim = new Minim(this);
  
  // setup keys. notes array of objects is initialized when song selected
  keys = new Keyboard[4];
  game.setupKeyboards();

  // setup cam
  cam = new Capture(this, width, height, 30);
  cam.start();
  
  //## combotimer = new Timer(1500); // ##experimental
  
  songTimer = new Timer(100000);
  
  startpage = new Startpage();

}

void draw() {

  
  if (page == 0) {
    
    startpage.display();
    
  } else if (page == 1) {
    
    if(songsync3.isFinished()){
    player.play();
    }
    // show camera image, with flipped
    if (cam.available()) {
      cam.read();
      flip();
    }

    image(cam, 0, 0);


    for (int i=0; i < keys.length; i++) {
      keys[i].display();
      keys[i].detectColors();
    }

    for (int i=0; i < notes.length; i++) {
      notes[i].display();
    }


    game.display();
    game.ruleLoop();
  }
}






void keyPressed() {//for debugging
  if (key == 'q') {
    for (int i=0; i<notes.length; i++) {
      notes[i].speed *= 0.5;
    }
  }
  if (key == 'w') {
    for (int i=0; i<notes.length; i++) {
      notes[i].speed *= 2;
    }
  }
  if (key == 'e') {
    for (int i=0; i<notes.length; i++) {
      notes[i].speed *= -1;
    }
  }
  if ( key == 'r') {//not used
    page = 0;
  }
}
