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
int page = 0;

void setup() {
  noStroke();
  size(640, 480);
  songsync1 = new Timer(500);
  songsync2 = new Timer(700);
  songsync3 = new Timer(800);
  game = new GameCore();
  for (int i=0; i<keysimage.length; i++) {
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






void keyPressed() {//for debugging
  if (key == 'q') {
    game.pause();
  }
  if (key == 'w') {
    game.resume();
  }
  if(key == 'f'){//cheat
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
  if(game.song == "free"){
    if(key == '1'){
      Note add = new Note(1, millis() - songTimer.savedTime-game.starttime);
      notes = (Note[])append(notes, add);
    }
    if(key == '2'){
      Note add = new Note(2, millis() - songTimer.savedTime-game.starttime);
      notes = (Note[])append(notes, add);
    }
    if(key == '3'){
      Note add = new Note(3, millis() - songTimer.savedTime-game.starttime);
      notes = (Note[])append(notes, add);
    }
    if(key == '4'){
      Note add = new Note(4, millis() - songTimer.savedTime-game.starttime);
      notes = (Note[])append(notes, add);
    }
  }
  
}
void NextPage(){
  if (startpage.pagecount<5) {
    startpage.pagecount++;
  }
}

void mousePressed() { //for page change
  if(startpage.over() != 1){
    NextPage();
  }
  if (startpage.over() == 1) {
    if (startpage.pagecount==4) {
   
      player = minim.loadFile("free.mp3",1000);
      game.setupNotes("free");
      page = 1;
      songTimer.start();
    }
  } else if (startpage.over() == 2) {
    startpage.pagecount = 5;
  } else if (startpage.over() == 3) {
    if (startpage.pagecount==5) {
      player = minim.loadFile("loveyou.mp3", 100000);
      game.setupNotes("loveyou");
      page = 1;
      songTimer.start();
      songsync1.start();
    }
  } else if (startpage.over() == 4) {
    if (startpage.pagecount==5) {
      player = minim.loadFile("getlucky.mp3", 100000);
      game.setupNotes("song2");
      page = 1;
      songTimer.start();
      songsync2.start();
    }
  } else if (startpage.over() == 5) {
    if (startpage.pagecount==5) {
      player = minim.loadFile("getlucky.mp3", 100000);
      game.setupNotes("getlucky");
      page = 1;
      songTimer.start();
      songsync3.start();
    }
  }
}
