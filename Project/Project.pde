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
Timer songsync1;
Timer songsync2;
Timer songsync3;
Startpage startpage;
Debug debug = new Debug();

int page = 0;

void setup() {
  noStroke();
  size(640, 480);
  songsync1 = new Timer(500);
  songsync2 = new Timer(700);
  songsync3 = new Timer(800);
  game = new GameCore();

  for (int i=0; i < keysimage.length; i++) {
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


  if (isGameOnStartpage()) {

    startpage.display();
    
  } else if (!isGameOnStartpage()) {

    if (songsync3.isFinished()) {
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

    game.ruleLoop();
    game.display();

    game.detectDrums();
  }
}


void mousePressed() {
  
  if (isGameOnStartpage()) {
  
  startpage.clickButton();
  }

}




boolean isGameOnStartpage() {
  return page == 0;
}




void keyPressed() {//for debugging
  if (key == 'q') {
    game.pause();
  }
  if (key == 'w') {
    game.resume();
  }
  if (key == 'f') {//cheat
    game.hp = 100;
  }

  if ( key == 'r') {//back
    game.back();
  }
  if (key == 'n') {//next page
    startpage.pagecount++;
  }
  if (key == 'b') {//back page
    startpage.pagecount--;
  }
  if (game.song == "free") {
    if (key == '1') {
      Note add = new Note(1, millis() - songTimer.savedTime-game.starttime);
      notes = (Note[])append(notes, add);
    }
    if (key == '2') {
      Note add = new Note(2, millis() - songTimer.savedTime-game.starttime);
      notes = (Note[])append(notes, add);
    }
    if (key == '3') {
      Note add = new Note(3, millis() - songTimer.savedTime-game.starttime);
      notes = (Note[])append(notes, add);
    }
    if (key == '4') {
      Note add = new Note(4, millis() - songTimer.savedTime-game.starttime);
      notes = (Note[])append(notes, add);
    }
  }
}
