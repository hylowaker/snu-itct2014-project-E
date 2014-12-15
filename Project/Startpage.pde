// Start page class

class Startpage {
  PImage [] imgs = new PImage[9]; 
  int pagecount = 0;
   
  MenuButton freePlayButton, playAlongButton;
  SongButton song1Button, song2Button, song3Button;

  Startpage() {
    this.imgs[0] = loadImage("lab.png");
    this.imgs[1] = loadImage("start.gif");
    this.imgs[2] = loadImage("lab_01.png");
    this.imgs[3] = loadImage("lab_02.png");
    this.imgs[4] = loadImage("poster.png");
    this.imgs[5] = loadImage("poster_01.gif");
    this.imgs[6] = loadImage("band01.png");
    this.imgs[7] = loadImage("clear.png");
    this.imgs[8] = loadImage("gameover.jpg");
    this.freePlayButton = new MenuButton("band_01.png", 0, 360);
    this.playAlongButton = new MenuButton("band_02.png", 320, 360);
    this.song1Button = new SongButton("dont.png", 320, 95, CENTER);
    this.song2Button = new SongButton("ilove.png", 320, 240, CENTER);
    this.song3Button = new SongButton("get.png", 320, 385, CENTER);
  }


  void display() {
    
    imageMode(CORNER);
    switch (this.pagecount) {
      case 0:
        image(this.imgs[1], 0, 0);
        break;
      
      // story images
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
      
      // main menu
      case 4:
        image(this.imgs[6], 0, 0, width, 360);
        this.freePlayButton.display();
        this.playAlongButton.display();
        break;
      
      // song selecting menu
      case 5:
        background(52, 56, 41);
        this.song1Button.display();
        this.song2Button.display();
        this.song3Button.display();
        break;
      
      // game success
      case 6:
        image(this.imgs[7], 0, 0);
        break;
      
      // game fail
      case 7:
        image(this.imgs[8], 0, 0);
        break;
    
      default:
        break;
    }
  }


  void clickButton() {
    
    if (this.pagecount < 4) {
      this.nextPage();
      
    } else if (this.pagecount == 4) {
      if (this.freePlayButton.isMouseOver()) {
        //player = minim.loadFile("free.mp3", 1000);
        game.setupSong("free");
        page = 1;
        //songTimer.start();
      } else if (this.playAlongButton.isMouseOver()) {
        this.nextPage();
      } else {
      }
      
      
    } else if (this.pagecount == 5) {
      if (this.song1Button.isMouseOver()) {
        game.setupSong("Don't look back in anger");
      } else if (this.song2Button.isMouseOver()) {
        game.setupSong("I love you oh thank you");
      } else if (this.song3Button.isMouseOver()) {
        game.setupSong("Get Lucky");
      } else {
      }
        
    } else if (this.pagecount == 6 || this.pagecount == 7) {
      game.back();
    }
    
  }
  
  
  void nextPage() {
    if (this.pagecount < 5) {
      this.pagecount += 1;
    }
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
      tint(204, 147, 76, 80);
    }
    imageMode(CORNER);
    image(this.image, this.xpos, this.ypos, this.width, this.height);
    noTint();   
  }
  
}


class SongButton extends Button {
  PImage image;
  
  SongButton(String songPath, int xpos, int ypos) {
    this(songPath, xpos, ypos, CORNER);
  }
  
  SongButton(String songPath, int xpos, int ypos, int alignMode) {
    this.image = loadImage(songPath);
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
    imageMode(CORNER);
    image(this.image, this.xpos, this.ypos, this.width, this.height);
    noTint();   
  }
  
}
