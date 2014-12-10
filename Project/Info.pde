class Info {
  int hp;

  // constructor
  Info() {
    hp = 100;
  }

  // check if notes are hit or missed
  void rule() {
    
    // note miss check
    for (int i=0; i < notes.length; i++) {
      
      // if the note passes bottom of the screen:
      if (notes[i].ypos >= height) {
        
        // hp decreases
        hp -= 5;
        
        // reset the note and drop it again (## this code will be deleted)
        notes[i].ypos = -100;
        
        // hp cannot be negative number
        if (hp <= 0) {
          hp = 0;
        } 
      } 
    }
    
    // note hit check
    for (int i=0; i < keys.length; i++) {
      for (int j=0; j < notes.length; j++) {
        
        // if the key and the note are close enough:
        if (intersect(keys[i].xpos, keys[i].ypos, notes[j].xpos, notes[j].ypos, keys[i].size/2, notes[j].size/2)) {
          
          // if the key is pressed:
          if (keys[i].over) {
            notes[j].ypos = -100;
          }
        }
      }
    }
    
  }

  // show hp gauge
  void display() {
    fill(0, 255, 0);
    rect(600, 50, 20, 2*100);
    fill(255);
    rect(600, 50, 20, 2*(100 - hp));
  }

  boolean intersect(int x1, int y1, int x2, int y2, int r1, int r2) {
    if (dist(x1, y1, x2, y2) < r1 + r2) {
      return true;
    } else {
      return false;
    }
  }
}

