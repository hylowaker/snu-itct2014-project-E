class Note {
  int xpos;
  int ypos;
  int k;
  int time;
  int size;
  int speed;

  Note(int _k, int _t) {
    k = _k;
    time = _t;
    size = 60;
    speed = 3;

    switch(k) {
    case 1:
      xpos = 50+10; 
      ypos = 20;
      break;
    case 2:
      xpos = 50+150+10; 
      ypos = 20;
      break;
    case 3:
      xpos = 50+300+10; 
      ypos = 20;
      break;
    case 4:
      xpos = 50+450+10; 
      ypos = 20;
      break;
    default:
      xpos = 1000; 
      ypos = 1000;
      break;
    }
  }
  
  void display() {
    if (millis()>time) {
      fill(255, 0, 255);
      ellipse(xpos+size/2, ypos+size/2, size, size);
      ypos = ypos + speed;
    }
  }
}

