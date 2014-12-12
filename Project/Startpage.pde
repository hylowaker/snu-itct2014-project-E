// Start page class

class Startpage {
  
  Startpage() {
  }
  
  void display() {
    background(123, 200, 0);
    fill(255);
    rect(250, 240, 150, 50);
    fill(0);
    textSize(20);
    text("Demo Game", 270, 100);
    text("Get Lucky", 280, 270);
  }
}

void mousePressed() { //for page change
  if (over() == 3) {
    player = minim.loadFile("getlucky.mp3", 100000);
    game.setupNotes("getlucky");
    page = 1;
    songTimer.start();
    songsync3.start();
  }
}

int over() {
  if (mouseX>250 && mouseY>240 && mouseX<250+150 && mouseY<= 240+50) {
    return 3;
  } else {
    return 0;
  }
}
