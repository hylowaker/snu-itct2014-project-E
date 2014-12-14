import processing.video.*;
import ddf.minim.*;

Capture cam;
AudioPlayer player;
Minim minim;

Keyboard[] keys;
Note[] notes;
GameCore game;    
Timer songTimer;
Timer songStartDelayer;
Startpage startpage;
Debug debug = new Debug();

int page = 0;

void setup() {
  noStroke();
  size(640, 480);
  songStartDelayer = new Timer(1000);
  game = new GameCore();

  // setup audio. player object is initialized when song selected
  minim = new Minim(this);

  // setup keys. notes array of objects is initialized when song selected
  keys = new Keyboard[4];
  game.setupKeyboards();

  // setup cam
  cam = new Capture(this, width, height, 30);
  cam.start();

  songTimer = new Timer(110000);

  startpage = new Startpage();
}


void draw() {

  if (isGameOnStartpage()) {
    startpage.display();
    
  } else if (!isGameOnStartpage()) {

    if (songStartDelayer.isFinished()) {
      player.play();
    }
    
    if (cam.available()) {
      cam.read();
      flip(); 
    }
    imageMode(CORNER);
    image(cam, 0, 0);

    game.ruleLoop(); 
    game.display();

    game.detectDrumsticks();
   
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




void keyPressed() {
  if (key == 'q') {
    game.pause();
  }
  if (key == 'w') {
    game.resume();
  }
  if (key == 'f') {//cheat
    game.hp = 100;
  }
  if (key == 'r') {//back (go to main menu)
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
