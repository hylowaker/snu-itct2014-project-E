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
  
  PImage gameover;
  PImage stageclear;
  
  // constructor
  GameCore() {
    this.hp = 100;
    this.combo = 0;
    this.end = false;
    this.clear = false;
    this.gameover = loadImage("gameover.jpg");
    this.stageclear = loadImage("clear.png");   
  }

  // create note objects
  void setupNotes(String songname) {
    
    this.song = songname;
    
    if (this.song != "free") {
      
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
      
    } else if (songname == "free"){
      
      this.starttime = 0;
      notes = new Note[1];
      notes[0] = new Note(1, 1);
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
    
    if (this.song == "Don't look back in anger") {
      if (millis() - songTimer.savedTime >= 100000) {
        this.clear = true;
      }
    } else if (this.song == "I love you oh thank you") {
      if (millis() - songTimer.savedTime >= 100000) {
        this.clear = true;
      }
    } else if (this.song == "Get Lucky") {
      if(millis() - songTimer.savedTime >= 80000){
        this.clear = true;
      }
    }
    
    if(game.clear){
      player.pause();
      player.rewind();
      player.close();
    }
    
    this.noteMissedCheckingLoop();

    this.noteHitCheckingLoop();

    if (this.hp <= 0) {
      this.hp = 0;
      player.pause();
      player.rewind();
      player.close();
      this.end = true;
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
    player.close();
    //player.pause();
    //player.rewind();
    page = 0;
    game.hp = 100;
    game.combo = 0;
  }
  
  // show hp gauge
  void display() {
    rectMode(CORNER);
    
    if(game.song != "free"){
      
    //hp bar
      if (hp >= 60) {
        fill(0, 255, 0);
      } else if (hp >= 30) {
        fill(255, 255, 0);
      } else {
        fill(255, 0, 0);
      }  
    rect(600, 50, 20, 2*100);
    fill(255);
    rect(600, 50, 20, 2*(100 - this.hp));
    }
    
    noStroke();
    fill(204, 147, 76);
    rect(0, keys[0].ypos - keys[0].imagesize/2 - 20, width, notes[0].size/2);
    //fill(255);
    //text(hp, 200, 250); // hp debugging
    if (combo != 0) {
      fill(0, 255, 0);
      textSize(30);
      text("COMBO " + combo, 285, 250);
    }
    if(end){
      image(gameover, 0, 0, width, height);
    }
    if(clear){
      image(stageclear, 0, 0, width ,height);
    }
  }


  void noteMissedCheckingLoop() {

    for (int i=0; i < notes.length; i++) {

      // if the note passes bottom of the screen:
      if (notes[i].ypos >= height-50) {

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
  
}
