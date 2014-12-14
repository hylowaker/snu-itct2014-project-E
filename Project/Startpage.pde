// Start page class

class Startpage {
  PImage [] imgs = new PImage[10]; 
//  int xpos1 = 250;
//  int ypos1 = 120;
//  int xpos2 = 250;
//  int ypos2 = 195;
//  int xpos3 = 250;
//  int ypos3 = 270;
  int pagecount = 0;
   
  MenuButton freePlayButton, playAlongButton;
  SongButton song1Button, song2Button, song3Button;


  Startpage() {
    this.imgs[0]= loadImage("lab.png");
    this.imgs[1]= loadImage("start.gif");
    this.imgs[2]= loadImage("lab_01.png");
    this.imgs[3]= loadImage("lab_02.png");
    this.imgs[4]= loadImage("poster.png");
    this.imgs[5]= loadImage("poster_01.gif");
    this.imgs[6]= loadImage("band01.png");
    //this.imgs[7]= loadImage("band_01.png");
    //this.imgs[8]= loadImage("band_02.png");
    this.freePlayButton = new MenuButton("band_01.png", 0, 360);
    this.playAlongButton = new MenuButton("band_02.png", 320, 360);
    this.song1Button = new SongButton("dont.png", 1, 320, 95, CENTER);
    this.song2Button = new SongButton("ilove.png", 2, 320, 240, CENTER);
    this.song3Button = new SongButton("get.png", 3, 320, 385, CENTER);
  }


  void display() {
    
    switch (this.pagecount) {
      case 0:
      image(this.imgs[1], 0, 0);
      break;
      
      case 1:
      image(this.imgs[0], 0, 0, width, 360);
      image(this.imgs[2], 0, 360, width, 120);
      break;
      
      case 2:
      image(this.imgs[0], 0, 0, width, 360);
      image(this.imgs[3], 0, 360, width, 120);
      break;
      
      case 3:
      image(this.imgs[4], 0, 0, width, 360);
      image(this.imgs[5], 0, 360, width, 120);
      break;
      
      case 4:
      image(this.imgs[6], 0, 0, width, 360);
      //image(this.imgs[7], 0, 360, width/2, 120);
      this.freePlayButton.display();
      //image(this.imgs[8], 320, 360, width/2, 120);
      this.playAlongButton.display();
      break;
      
      case 5:
      background(52, 56, 41);
      fill(255);
      //rect(this.xpos1, this.ypos1, 150, 50);
      //rect(this.xpos2, this.ypos2, 150, 50);
      //rect(this.xpos3, this.ypos3, 150, 50);
      fill(0);
      textSize(20);
      ////text("Demo Game", 270, 100);
      //text("Don't look back in anger", xpos1 + 20, ypos1 + 30);
      //text("I love you oh thank you", xpos2 + 20, ypos2 + 30);
      //text("Get Lucky", xpos3 + 20, ypos3 + 30);
      song1Button.display();
      song2Button.display();
      song3Button.display();
      break;
    
      default:
      break;
    }
  }



  void nextPage() {
    if (this.pagecount < 5) {
      this.pagecount += 1;
    }
  }



  /* DEPRECATED
  int over() {

    if (mouseX > 0 && mouseY > 360 && mouseX < 320 && mouseY < 480) {
      return 1;
    } else if (mouseX > 320 && mouseY > 360 && mouseX < 640 && mouseY < 480) {
      return 2;
    } else if (mouseX > xpos1 && mouseY > ypos1 && mouseX < xpos1 + 150 && mouseY <= ypos1 + 50) {
      return 3;
    } else if (mouseX > xpos2 && mouseY > ypos2 && mouseX < xpos2 + 150 && mouseY <= ypos2 + 50) {
      return 4;
    } else if (mouseX > xpos3 && mouseY > ypos3 && mouseX < xpos3 + 150 && mouseY <= ypos3 + 50) {
      return 5;
    } else {
      return 0;
    }
    
  }
  */


  void clickButton() {
    
    if (this.pagecount < 4) {
      this.nextPage();
    } else if (this.pagecount == 4) {
      if (this.freePlayButton.isMouseOver()) {
        player = minim.loadFile("free.mp3", 1000);
        game.setupNotes("free");
        page = 1;
        songTimer.start();
      } else if (this.playAlongButton.isMouseOver()) {
        this.nextPage();
      } else {
        //pass
      }
    } else if (this.pagecount == 5) {
      if (this.song1Button.isMouseOver()) {
        player = minim.loadFile("Don't look back in anger.mp3", 100000);
        game.setupNotes("Don't look back in anger");
        page = 1;
        songTimer.start();
        songsync1.start();
      } else if (this.song2Button.isMouseOver()) {
        player = minim.loadFile("loveyou.mp3", 100000);
        game.setupNotes("I love you oh thank you");
        page = 1;
        songTimer.start();
        songsync2.start();
      } else if (this.song3Button.isMouseOver()) {
        player = minim.loadFile("getlucky.mp3", 100000);
        game.setupNotes("Get Lucky");
        page = 1;
        songTimer.start();
        songsync3.start();
      }
        
    }
        
      
      
      
    /* DEPRECATED
    if (this.whichButtonClicked() != 1) {
      startpage.nextPage();
    }

    if (this.whichButtonClicked() == 1) {
      
      if (startpage.pagecount == 4) {

        player = minim.loadFile("free.mp3", 1000);
        game.setupNotes("free");
        page = 1;
        songTimer.start();
      }
      
    } else if (startpage.over() == 2) {
      startpage.pagecount = 5;
      
    } else if (startpage.over() == 3) {
      
      if (startpage.pagecount==5) {
        player = minim.loadFile("loveyou.mp3", 100000);
        game.setupNotes("loveyou");
        page = 1;
        songTimer.start();
        songsync1.start();
      }
      
    } else if (startpage.over() == 4) {
      
      if (startpage.pagecount==5) {
        player = minim.loadFile("getlucky.mp3", 100000);
        game.setupNotes("I love you oh thank you");
        page = 1;
        songTimer.start();
        songsync2.start();
      }
      
    } else if (startpage.over() == 5) {
      
      if (startpage.pagecount==5) {
        player = minim.loadFile("getlucky.mp3", 100000);
        game.setupNotes("Get Lucky");
        page = 1;
        songTimer.start();
        songsync3.start();
      }
      
    }
    */
    
  }
}



class Button {
  
  int xpos, ypos;
  int width, height;
  
  boolean isMouseOver() {
    if (mouseX > this.xpos && mouseY > this.ypos && mouseX < this.xpos + this.width && mouseY < this.ypos + this.height) {
      return true;
    } else {
      return false;
    }
  }
  
}


class MenuButton extends Button {
  
  PImage image;
  
  MenuButton(String imagePath, int xpos, int ypos) {
    this.image = loadImage(imagePath);
    this.xpos = xpos;
    this.ypos = ypos;
    this.width = 320;
    this.height = 120;
  }
  
  void display() {
    noTint();
    if (this.isMouseOver()) {
      tint(204, 147, 76, 60);
      // + mousePressed ?
    }
    image(this.image, this.xpos, this.ypos, this.width, this.height);
    noTint();
      
  }
  
}


class SongButton extends Button {
  PImage image;
  String songName;
  int songNumber;
  
  SongButton(String songPath, int songNumber, int xpos, int ypos) {
    this(songPath, songNumber, xpos, ypos, CORNER);
  }
  
  SongButton(String songPath, int songNumber, int xpos, int ypos, int alignMode) {
    this.image = loadImage(songPath);
    //this.songName = songName;
    //this.songNumber = songNumber;
    this.width = 300;
    this.height = 100;
    if (alignMode == CORNER) {
      this.xpos = xpos;
      this.ypos = ypos;
    } else if (alignMode == CENTER) {
      this.xpos = xpos - this.width/2;
      this.ypos = ypos - this.height/2;
    }
  }
  
  void display() {
    noTint();
    if (this.isMouseOver()) {
    tint(204, 147, 76, 80);
    }
    image(this.image, this.xpos, this.ypos, this.width, this.height);
    noTint();
    //rectMode(CORNER);
    //rect(this.xpos, this.ypos, this.width, this.height);
    //fill(0);
    //textAlign(CENTER, CENTER);
    //text(this.songName, this.xpos + this.width/2, this.ypos + this.height/2);
  }
    
}
