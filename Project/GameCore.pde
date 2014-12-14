class GameCore {

  // game states
  int hp;
  int combo;
  int starttime;

  boolean end;
  boolean clear;
  
  String song;
  float beatLength;

  // constants: position of lanes and notes, drumstick detecting threshold
  int lanePos = 90;
  int laneGap = 150;
  int threshold = 100;

  
  // constructor
  GameCore() {
    this.hp = 100;
    this.combo = 0;
    this.end = false;
    this.clear = false;   
  }


  // setup the song and start the game
  void setupSong(String songname) {
    this.song = songname;
    game.setupNotes(songname);
    player = minim.loadFile(songname + ".mp3", 2048);
    page = 1;
    songTimer.start();
    songStartDelayer.start();
  }


  // create note objects
  void setupNotes(String songname) {
    
    if (songname != "free") {
      
      String[] notemap = loadStrings(song + ".txt");
      this.starttime = int(notemap[0]);
      this.beatLength = float(notemap[1]);
      float multiplier = float(notemap[2]);
      int numberofnotes = int(notemap[3]);
      
      notes = new Note[numberofnotes];
      
      //debug.print("ST: " + this.starttime);
      //debug.print("BL: " + this.beatLength);
      //debug.print("ML: " + multiplier);
      //debug.print("NL: " + numberofnotes);
      
      int index = 0;
      for (int i = 4; i < notemap.length; i++) {
        String[] tmp = split(notemap[i], '\t');
        float timingtoset = int(tmp[0])*multiplier;
        int[] lanetoset = int(split(tmp[1], ','));
        for (int j = 0; j < lanetoset.length; j++) {
          //debug.print("IX: " + index);
          notes[index] = new Note(lanetoset[j], timingtoset);  
          index++;
        }
      }
      
    } else if (songname.equals("free")){
      
      this.starttime = 0;
      notes = new Note[1];
      notes[0] = new Note(1, 1);
      notes[0].invisible = true;
    } 
    
  }


  // create key objects
  void setupKeyboards() {
    for (int i=0; i < keys.length; i++) {
      keys[i] = new Keyboard(i+1, this.lanePos + i*this.laneGap, 420);
    }
  }


  // Game rule loops (e.g. check if notes are hit or missed)
  void ruleLoop() {
    
    this.gameClearCheckingLoop();
    this.noteMissedCheckingLoop();
    this.noteHitCheckingLoop();
    this.gameOverCheckingLoop();
    
  }
  
  
  // display and run the game interface components
  void display() {
    rectMode(CORNER);
    
    for (int i=0; i < keys.length; i++) {
      keys[i].display();
      keys[i].detectColors();
    }

    for (int i=0; i < notes.length; i++) {
      notes[i].display();
    }
    
    if(game.song != "free") {
      
    // hp bar
      if (hp >= 60) {
        fill(0, 255, 0);
      } else if (hp >= 30) {
        fill(255, 255, 0);
      } else {
        fill(255, 0, 0);
      }
    rectMode(CORNER);
    rect(600, 50, 20, 2*100);
    fill(255);
    rect(600, 50, 20, 2*(100 - this.hp));
    }
    
    // note beater bar
    noStroke();
    fill(204, 147, 76);
    rectMode(CORNER);
    rect(0, keys[0].ypos - keys[0].imagesize/2 - 20, width, notes[0].size/2);

    if (combo != 0) {
      fill(0, 255, 0);
      textSize(30);
      text("COMBO " + combo, 285, 250);
    }
    
    if (this.clear) {
      page = 0;
      startpage.pagecount = 6;
      //image(stageclear, 0, 0, width ,height);
    }
    
    if (this.end) {
      page = 0;
      startpage.pagecount = 7;
      //image(gameover, 0, 0, width, height);
    }
    
  }


  void gameClearCheckingLoop() {
    
    if (this.song == "Don't look back in anger") {
      if (millis() - songTimer.savedTime >= 100000) {
        this.clear = true;
      }
    } else if (this.song == "I love you oh thank you") {
      if (millis() - songTimer.savedTime >= 100000) {
        this.clear = true;
      }
    } else if (this.song == "Get Lucky") {
      if (millis() - songTimer.savedTime >= 80000) {
        this.clear = true;
      }
    }
    
    if (this.clear) {
      player.close();
    }
  }
  
  
  void gameOverCheckingLoop() {
    if (this.hp <= 0) {
      player.close();     
      this.end = true;
    }
  }
  

  void noteMissedCheckingLoop() {

    for (int i=0; i < notes.length; i++) {

      // if the note passes bottom of the screen:
      if (notes[i].ypos >= height - 50) {

        // hp decreases
        this.hp = max(this.hp - 6, 0);
        this.combo = 0;
        // notes disappear when missed
        notes[i].hide();
      }
    }
  }


  void noteHitCheckingLoop() {

    // note hit check
    for (int i=0; i < keys.length; i++) {
      for (int j=0; j < notes.length; j++) {

        
        if (keys[i].lane != notes[j].lane) {
          continue;
        }

        int tmpAccu = this.intersectedAccuracy(keys[i], notes[j]);

        if (tmpAccu >= 1) {

          if (keys[i].over) {
            this.combo++;
            this.hp = min(this.hp + 2*(tmpAccu - 1), 100);
            // notes disappear when correctly hit
            notes[j].hide();

            keys[i].flash(tmpAccu);
          }
        }
      }
    }
  }
  
  
  // returns how precisely the note is hit
  int intersectedAccuracy(Keyboard _key, Note _note) {

    // (not necessary. just for safety)
    if (_key.lane != _note.lane) {
      return 0;
    }

    int tempDist = abs((_key.ypos - _key.imagesize/2 - 20) - _note.ypos);//judge from line and note
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
  
  
  // detect each of red, blue sticks and display on the screen
  void detectDrumsticks() {
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
    
    // drumstick detector
    for (int x = 0; x < cam.width; x += 10) {
      for (int y = 0; y < cam.height; y += 10) {
        float[] detect = new float[2];
        color pixC = cam.pixels[y*cam.width + x];

        detect[0] = red(pixC) - 0.5*green(pixC)- 0.5*blue(pixC);         
        detect[1] = blue(pixC) - 0.5*green(pixC)- 0.5*red(pixC);

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
    
    // drumstick displayer
    try {
      ravX = rsumX/rcount;
      ravY = rsumY/rcount;
      fill(255, 0, 0);
      ellipse(ravX, ravY, 40, 40);
      bavX = bsumX/bcount;
      bavY = bsumY/bcount;
      fill(0, 0, 255);
      ellipse(bavX, bavY, 40, 40);
    } catch (ArithmeticException e) {
      //pass
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
    try {
      player.close();
    } catch (NullPointerException e) {
      //pass
    }
    page = 0;
    startpage.pagecount = 4;
    this.hp = 100;
    this.combo = 0;
    this.end = false;
    this.clear = false;
  }
  
}
