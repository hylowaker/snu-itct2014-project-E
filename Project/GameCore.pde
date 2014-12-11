class GameCore {

  // game states
  int hp;

  // constants: position of lanes and notes
  int lanePos = 90;
  int laneGap = 150;

  // constructor
  GameCore() {
    hp = 100;
  }

  // create note objects (## experimental)
  void setupNotes() {
    notes[0] = new Note(2, 3000);
    notes[1] = new Note(1, 5000);
    notes[2] = new Note(4, 1000);
  }

  // create key objects
  void setupKeyboards() {
    for (int i=0; i < keys.length; i++) {
      keys[i] = new Keyboard(i+1, lanePos + i*laneGap, 4*cam.height/5);
    }
  }

  // Game rule loops (e.g. check if notes are hit or missed)
  void rule() {
    
    noteMissedCheckingLoop();
    
    noteHitCheckingLoop();
 
  }

  // show hp gauge
  void displayHP() {
    fill(0, 255, 0);
    rect(600, 50, 20, 2*100);
    fill(255);
    rect(600, 50, 20, 2*(100 - hp));
  }
  
  void noteMissedCheckingLoop() {
    
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
  }
  
  void noteHitCheckingLoop() {
    
    // ##### this function need to be optimized
    
    // note hit check
    for (int i=0; i < keys.length; i++) {
      for (int j=0; j < notes.length; j++) {
        
        // (not necessary. just for safety)
        if (keys[i].lane != notes[j].lane) {
          continue;
        }
        
        int tmpAccu = intersectedAccuracy(keys[i], notes[j]);
        
        if (tmpAccu >= 1) {
          if (keys[i].over) {
            notes[j].ypos = -100;
            keys[i].flash(tmpAccu);
          }
        }

        /*
        // if the key and the note are close enough:
        if (isIntersected(keys[i].xpos, keys[i].ypos, notes[j].xpos, notes[j].ypos, keys[i].radius, notes[j].radius)) {

          // if the key is pressed:
          if (keys[i].over) {
            notes[j].ypos = -100;
          }
        
        }
        */
      }
    }
  }

//  boolean isIntersected(int x1, int y1, int x2, int y2, int r1, int r2) {
//    if (dist(x1, y1, x2, y2) < (r1 + r2)/2) {
//      return true;
//    } else {
//      return false;
//    }
//  }
  
  int intersectedAccuracy(Keyboard _key, Note _note) {
    
    if (_key.lane != _note.lane) {
      return 0;
    }
    
    int tempDist = abs(_key.ypos - _note.ypos);
    
    if (tempDist > 50) {
      return 0;
    } else if (tempDist > 30) {
      return 1;
    } else if (tempDist > 10) {
      return 2;
    } else {
      return 3;
    }
  }
  
}

