class GameCore {

  // game states
  int hp;

  // constants: position of lanes and notes
  int lanePos = 90;
  int laneGap = 150;
  int threshold = 100;
  int combo;
  int starttime = 0;
  // constructor
  GameCore() {
    this.hp = 100;
    this.combo = 0;
  }

  // create note objects
  void setupNotes(String songname) {
    if (songname == "loveyou") {//add note for song1
      starttime = 0;
      int d = 666;
      notes = new Note[110];

      //1th
      notes[0] = new Note(3, 0);
      notes[1] = new Note(4, 0);
      notes[2] = new Note(1, d);
      notes[3] = new Note(2, d);
      notes[4] = new Note(1, 2*d);
      notes[5] = new Note(3, 2*d);
      notes[6] = new Note(1, 3*d);
      notes[7] = new Note(2, 3*d);
      //2nd
      notes[8] = new Note(1, 4*d);
      notes[9] = new Note(3, 4*d);
      notes[10] = new Note(1, 5*d);
      notes[11] = new Note(2, 5*d);
      notes[12] = new Note(1, 6*d);
      notes[13] = new Note(3, 6*d);
      notes[14] = new Note(1, 7*d);
      notes[15] = new Note(2, 7*d);
      //3rd
      notes[16] = new Note(1, 8*d);
      notes[17] = new Note(3, 8*d);
      notes[18] = new Note(1, 9*d);
      notes[19] = new Note(2, 9*d);
      notes[20] = new Note(1, 10*d);
      notes[21] = new Note(3, 10*d);
      notes[22] = new Note(1, 11*d);
      notes[23] = new Note(2, 11*d);
      //4th
      notes[24] = new Note(1, 12*d);
      notes[25] = new Note(3, 12*d);
      notes[26] = new Note(1, 13*d);
      notes[27] = new Note(2, 13*d);
      notes[28] = new Note(1, 14*d);
      notes[29] = new Note(3, 14*d);
      notes[30] = new Note(1, 15*d);
      notes[31] = new Note(2, 15*d);
      //5th
      notes[32] = new Note(1, 16*d);
      notes[33] = new Note(3, 16*d);
      notes[34] = new Note(1, 17*d);
      notes[35] = new Note(2, 17*d);
      notes[36] = new Note(1, 18*d);
      notes[37] = new Note(3, 18*d);
      notes[38] = new Note(1, 19*d);
      notes[39] = new Note(2, 19*d);
      //6th
      notes[40] = new Note(1, 20*d);
      notes[41] = new Note(3, 20*d);
      notes[42] = new Note(1, 21*d);
      notes[43] = new Note(2, 21*d);
      notes[44] = new Note(1, 22*d);
      notes[45] = new Note(3, 22*d);
      notes[46] = new Note(1, 23*d);
      notes[47] = new Note(2, 23*d);
      //7th
      notes[48] = new Note(1, 24*d);
      notes[49] = new Note(3, 24*d);
      notes[50] = new Note(1, 25*d);
      notes[51] = new Note(2, 25*d);
      notes[52] = new Note(1, 26*d);
      notes[53] = new Note(3, 26*d);
      notes[54] = new Note(1, 27*d);
      notes[55] = new Note(2, 27*d);
      //8th
      notes[56] = new Note(1, 28*d);
      notes[57] = new Note(3, 28*d);
      // notes[58] = new Note(1, 29*d);
      notes[58] = new Note(2, 29*d);
      notes[59] = new Note(2, 30*d);

      //9th
      notes[60] = new Note(4, 32*d);
      notes[61] = new Note(3, 32*d);
      notes[62] = new Note(1, 33*d);
      notes[63] = new Note(1, 34*d);
      notes[64] = new Note(3, 34*d);
      notes[65] = new Note(1, 35*d);
      notes[66] = new Note(2, 35*d);
      //10th
      notes[67] = new Note(1, 36*d);
      notes[68] = new Note(3, 36*d);
      notes[69] = new Note(1, 37*d);
      notes[70] = new Note(1, 38*d);
      notes[71] = new Note(3, 38*d);
      notes[72] = new Note(1, 39*d);
      notes[73] = new Note(2, 39*d);
      //11th
      notes[74] = new Note(1, 40*d);
      notes[75] = new Note(3, 40*d);
      notes[76] = new Note(1, 41*d);
      notes[77] = new Note(1, 42*d);
      notes[78] = new Note(3, 42*d);
      notes[79] = new Note(1, 43*d);
      notes[80] = new Note(2, 43*d);
      //12th
      notes[81] = new Note(1, 44*d);
      notes[82] = new Note(3, 44*d);
      notes[83] = new Note(1, 45*d);
      notes[84] = new Note(1, 46*d);
      notes[85] = new Note(3, 46*d);
      notes[86] = new Note(1, 47*d);
      notes[87] = new Note(2, 47*d);
      //13th
      notes[82] = new Note(1, 48*d);
      notes[83] = new Note(3, 48*d);
      notes[84] = new Note(1, 49*d);
      notes[85] = new Note(1, 50*d);
      notes[86] = new Note(3, 50*d);
      notes[87] = new Note(1, 51*d);
      notes[88] = new Note(2, 51*d);
      //14th
      notes[89] = new Note(1, 52*d);
      notes[90] = new Note(3, 52*d);
      notes[91] = new Note(1, 53*d);
      notes[92] = new Note(1, 54*d);
      notes[93] = new Note(3, 54*d);
      notes[94] = new Note(1, 55*d);
      notes[95] = new Note(2, 55*d);
      //15th
      notes[96] = new Note(1, 56*d);
      notes[97] = new Note(3, 56*d);
      notes[98] = new Note(1, 57*d);
      notes[99] = new Note(1, 58*d);
      notes[100] = new Note(3, 58*d);
      notes[101] = new Note(1, 59*d);
      notes[102] = new Note(2, 59*d);
      //16th
      notes[103] = new Note(1, 60*d);
      notes[104] = new Note(3, 60*d);
      notes[105] = new Note(1, 41*d);
      notes[106] = new Note(1, 42*d);
      notes[107] = new Note(3, 42*d);
      notes[108] = new Note(4, 43*d);
      notes[109] = new Note(2, 43*d);
    } else if (songname == "song2") {//add note for song2
      starttime = 0;
      notes = new Note[3];

      notes[0] = new Note(2, 0);
      notes[1] = new Note(4, 1000);
      notes[2] = new Note(1, 2000);
    } else if (songname == "getlucky") {
      starttime = 0;
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
      keys[i] = new Keyboard(i+1, this.lanePos + i*this.laneGap, 420);
    }
  }

  void detectDrums() {
    int rcount = 0;
    int rsumX = 0;
    int rsumY = 0;
    int ravX = 0;
    int ravY = 0;
    int bcount = 0;
    int bsumX = 0;
    int bsumY = 0;
    int bavX = 0;
    int bavY = 0;
    for (int x = 0; x < cam.width; x += 10) {
      for (int y = 0; y < cam.height; y += 10) {
        float[] detect = new float[2];
        color pixC = cam.pixels[y*cam.width + x];

        detect[0] = red(pixC) - 0.5*green(pixC)- 0.5*blue(pixC);         
        detect[1] = blue(pixC) - 0.5*green(pixC)- 0.5*red(pixC);


        // if the color of the pixel is red enough,

        if (detect[0] > this.threshold) {
          rcount++;
          rsumX = rsumX + x;
          rsumY = rsumY + y;
        }
        if (detect[1] > this.threshold) {
          bcount++;
          bsumX = bsumX + x;
          bsumY = bsumY + y;
        }
      }
    }
    if (rcount != 0) {
      ravX = rsumX/rcount;
      ravY = rsumY/rcount;
      fill(255, 0, 0);
      ellipse(ravX, ravY, 40, 40);
    }
    if (bcount != 0) {
      bavX = bsumX/bcount;
      bavY = bsumY/bcount;
      fill(0, 0, 255);
      ellipse(bavX, bavY, 40, 40);
    }
  }

  // Game rule loops (e.g. check if notes are hit or missed)
  void ruleLoop() {

    this.noteMissedCheckingLoop();

    this.noteHitCheckingLoop();

    if (this.hp <= 0) {
      this.hp = 0;
    }
    if (this.hp >= 100) {
      this.hp = 100;
    }
  }
  void pause() {
    noLoop();
    player.pause();
  }
  void resume() {
    loop();
    player.play();
  }
  void back() {
    player.pause();
    player.rewind();
    page = 0;
    game.hp = 100;
    game.combo = 0;
  }
  // show hp gauge
  void display() {
    rectMode(CORNER);
    if (hp>=60) {
      fill(0, 255, 0);
    } else if (hp>=30) {
      fill(255, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    rect(600, 50, 20, 2*100);
    fill(255);
    rect(600, 50, 20, 2*(100 - this.hp));

    fill(255, 255, 0);
    rect(0, keys[0].ypos-keys[0].imagesize/2-20, width, notes[0].radius/2);
    //fill(255);
    //text(hp, 200, 250); // hp debugging
    if (combo != 0) {
      fill(0, 255, 0);
      text("COMBO "+combo, 280, 250);
    }
  }


  void noteMissedCheckingLoop() {

    for (int i=0; i < notes.length; i++) {

      // if the note passes bottom of the screen:
      if (notes[i].ypos >= height) {

        // hp decreases
        this.hp -= 5;
        combo = 0;
        // reset the note and drop it again (## for debugging)
        // notes[i].ypos = -100;

        // notes disappear when missed (## this code is temporarily deactivated)

        notes[i].invisible = true;
        notes[i].ypos = -100; 
        notes[i].speed = 0;


        // hp cannot be negative number
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

          if (keys[i].over) {
            //notes[j].ypos = -100; // ### for debugging
            combo++;
            if (combo!=0) {
              if (combo%3==0) {
                hp+=5;
              }
            }
            // notes disappear when correctly hit (## this code is temporarily deactivated)

            notes[j].invisible = true;
            notes[j].ypos = -100; 
            notes[j].speed = 0;


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

    //int tempDist = abs(_key.ypos - _note.ypos);
    int tempDist = abs((keys[0].ypos-keys[0].imagesize/2-20) - _note.ypos);//judge from line and note
    if (tempDist > 25) {
      return 0;
    } else if (tempDist > 15) {
      return 1;
    } else if (tempDist > 8) {
      return 2;
    } else {
      return 3;
    }
  }
}
