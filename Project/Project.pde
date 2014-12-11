import processing.video.*;
import ddf.minim.*;

Capture cam;
AudioPlayer player;
Minim minim;

Keyboard[] keys = new Keyboard[4];
Note[] notes = new Note[3];
GameCore game;
Timer songTimer;
Startpage startpage;
int page = 0;

void setup() {
  size(640, 480);

  // setup audio
  minim = new Minim(this);
  player = minim.loadFile("getlucky.mp3", 100000);


  // setup cam, game, combotimer
  cam = new Capture(this, width, height, 30);
  game = new GameCore();
  //## combotimer = new Timer(1500); // ##experimental
  
  songTimer = new Timer(100000);

  game.setupNotes();
  
  startpage = new Startpage();

  game.setupKeyboards();

  cam.start();
}

void draw() {

  
  if (page == 0) {
    
    startpage.display();
    
  } else if (page == 1) {
    
    player.play();
    // show camera image, with flipped
    if (cam.available()) {
      cam.read();
      flip();
    }

    image(cam, 0, 0);


    for (int i=0; i < keys.length; i++) {
      keys[i].display();
      keys[i].detectRed();
    }

    for (int i=0; i < notes.length; i++) {
      notes[i].display();
    }


    game.displayHP();
    game.rule();
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


boolean over1() {
  if (mouseX>250 && mouseY>240 && mouseX<250+150 && mouseY<= 240+50) {
    return true;
  } else {
    return false;
  }
}
void mousePressed() { //for page change
  if (over1()) {
    page = 1;
    songTimer.start();
  }
}

