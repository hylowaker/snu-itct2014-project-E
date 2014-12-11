class GameCore {

  // game states
  int hp;

  // constants: position of lanes and notes
  int lanePos = 90;
  int laneGap = 150;

  // constructor
  GameCore() {
    this.hp = 100;
  }

  // create note objects
  void setupNotes(String songname) {

    if (songname == "getlucky") {

      notes = new Note[13];

      notes[0] = new Note(1, 0);
      notes[1] = new Note(3, 0);
      notes[2] = new Note(1, 500);  
      notes[3] = new Note(1, 1000);
      notes[4] = new Note(2, 1000);
      notes[5] = new Note(1, 1500);
      notes[6] = new Note(1, 2000);
      notes[7] = new Note(3, 2000);
      notes[8] = new Note(1, 2500);
      notes[9] = new Note(1, 3000);
      notes[10] = new Note(3, 3000);
      notes[11] = new Note(1, 3500);
      notes[12] = new Note(1, 3750);
    }
  }

  // create key objects
  void setupKeyboards() {
    for (int i=0; i < keys.length; i++) {
      keys[i] = new Keyboard(i+1, this.lanePos + i*this.laneGap, 4*height/5);
    }
  }

  // Game rule loops (e.g. check if notes are hit or missed)
  void ruleLoop() {

    this.noteMissedCheckingLoop();

    this.noteHitCheckingLoop();
  }

  // show hp gauge
  void displayHP() {
    fill(0, 255, 0);
    rect(600, 50, 20, 2*100);
    fill(255);
    rect(600, 50, 20, 2*(100 - this.hp));
  }


  void noteMissedCheckingLoop() {

    for (int i=0; i < notes.length; i++) {

      // if the note passes bottom of the screen:
      if (notes[i].ypos >= height) {

        // hp decreases
        this.hp -= 5;

        // reset the note and drop it again (## for debugging)
        notes[i].ypos = -100;

        // notes disappear when missed (## this code is temporarily deactivated)
        /*
        notes[i].invisible = true;
        notes[i].ypos = -100; 
        notes[i].speed = 0;
        */

        // hp cannot be negative number
        if (this.hp <= 0) {
          this.hp = 0;
        }
      }
    }
  }


  void noteHitCheckingLoop() {

    // #####

    // note hit check
    for (int i=0; i < keys.length; i++) {
      for (int j=0; j < notes.length; j++) {

        // (not necessary. just for safety)
        if (keys[i].lane != notes[j].lane) {
          continue;
        }

        int tmpAccu = this.intersectedAccuracy(keys[i], notes[j]);

        if (tmpAccu >= 1) {
          
          if(keys[i].over) {
          notes[j].ypos = -100; // ### for debugging
          
          // notes disappear when correctly hit (## this code is temporarily deactivated)
          /*
          notes[j].invisible = true;
          notes[j].ypos = -100; notes[j].speed = 0;
          */  
                    
          keys[i].flash(tmpAccu);
          }
        }
      }
    }
  }


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

