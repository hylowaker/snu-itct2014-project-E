import processing.video.*;

Capture cam;
int threshold = 100;
Keyboard[] keys = new Keyboard[4];
Note[] notes = new Note[3];
Info info;
Timer combotimer;

void setup() {
  size(640, 480);

  // setup cam, info, combotimer
  cam = new Capture(this, width, height, 30);
  info = new Info();
  combotimer = new Timer(1500);
  
  // create note objects
  notes[0] = new Note(2, 3000);
  notes[1] = new Note(1, 5000);
  notes[2] = new Note(4, 1000);  
  
  // for i in (0,1,2,3):
  for (int i=0; i < keys.length; i++) {
    
    // create key objects. // xpos = 50, 200, 350, 500
    keys[i] = new Keyboard(50 + 150*i, 4*cam.height/5);
  }

  // Initialize all elements of each array to zero.
  cam.start();
}

void draw() {

  if (cam.available()) {
    cam.read();
    flip();
  }

  image(cam, 0, 0);

  for (int i=0; i<keys.length; i++) {
    keys[i].display();
  }
  for (int i=0; i<notes.length; i++) {
    notes[i].display();
  }


  info.display();
  info.rule();
}

