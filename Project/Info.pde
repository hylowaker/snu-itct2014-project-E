class Info {
  int hp;
  Info() {
    hp = 100;
  }
  void rule() {
    for (int i=0; i<notes.length; i++) {
      if (notes[i].ypos>=height) {
        hp -= 5;
        notes[i].ypos=-100;
        if (hp<=0) {
          hp = 0;
        }
      }
    }
    for (int i=0; i<keys.length; i++) {
      for (int j=0; j<notes.length; j++) {
        if (intersect(keys[i].xpos, keys[i].ypos, notes[j].xpos, notes[j].ypos, keys[i].size/2, notes[j].size/2)) {
          if (keys[i].over) {
            notes[j].ypos = -100;
          }
        }
      }
    }
  }
  void display() {
    fill(0, 255, 0);
    rect(600, 50, 20, 2*100);
    fill(255);
    rect(600, 50, 20, 2*(100-hp));
  }
}

boolean intersect(int x1, int y1, int x2, int y2, int r1, int r2) {
  if (dist(x1, y1, x2, y2)<r1+r2) {
    return true;
  } else {
    return false;
  }
}
