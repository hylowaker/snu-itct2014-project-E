// Keyboard is a note beater class

class Keyboard {

  // coordinates of the keys
  int xpos;
  int ypos;

  int lane;
  int imagesize;
  // color to fill
  color fillColor;

  // key state
  boolean over;
  HitEffector[] flashers = new HitEffector[5];
  int flasherNumber = 0;
  
  //int accuracyFlash;
  //Timer flashTimer;
  //int framesPassed;

  // constants
  int radius = 30;
  int threshold = 50;

  // constructor
  Keyboard(int lane, int xpos, int ypos) {
    this.lane = lane;
    this.xpos = xpos;
    this.ypos = ypos;
    imagesize = 80;  
    this.fillColor = color(255, 255, 255);
    for (int i=0; i < flashers.length; i++) {
      flashers[i] = new HitEffector(xpos, ypos, this.radius);
    }
    //this.flashTimer = new Timer(800);
    
}


  void display() {

    // show keys
    noStroke();
    fill(this.fillColor);
    image(keysimage[this.lane-1],this.xpos-imagesize/2, this.ypos-imagesize/2,imagesize,imagesize);
    //ellipse(this.xpos, this.ypos, 2*this.radius, 2*this.radius);

    // show flashes
    for (int i=0; i < flashers.length; i++) {
      flashers[i].display();
    }
    
    /*
    if (this.accuracyFlash > 0) {
      this.flasher();
      if (this.flashTimer.isFinished()) {
        this.accuracyFlash = 0;
        this.framesPassed = 0;
      }
    }
    */

    strokeWeight(1);

    //#####debug line
    stroke(10, 10, 10);
    //line(this.xpos - this.radius, this.ypos - this.radius, this.xpos, this.ypos);
  }


  void detectColors() {

    this.over = false;

    // for (each pixel) in the keyboard,  // not looping for every pixel because of performance issue.
    for (int x = this.xpos - this.radius; x < this.xpos + this.radius; x += 5) {
      for (int y = this.ypos - this.radius; y < this.ypos + this.radius; y += 5) {

        // if the pixel is in the circle,
        if (this.isIntersected(x, y, this.xpos, this.ypos, this.radius)) {

          //stroke(10, 10, 10); 
          //ellipse(x, y, 1, 1); //#####debug

          // pick the color of the pixel
          color pixC = cam.pixels[y*cam.width + x];
          float detect1 = red(pixC) - 0.5*green(pixC)- 0.5*blue(pixC);
          float detect2 = blue(pixC) - 0.5*green(pixC)- 0.5*red(pixC);
         /* if (this.lane == 1 || this.lane == 3) {
            detect = red(pixC) - 0.5*green(pixC)- 0.5*blue(pixC);
          } else if (this.lane == 2 || this.lane == 4) {
            detect = blue(pixC) - 0.5*green(pixC)- 0.5*red(pixC);
          }*/

          // if the color of the pixel is red enough,
          if (detect1 > this.threshold || detect2> this.threshold) {

            // change state
            this.over = true;
            if (this.lane == 1 || this.lane == 3) {
              this.fillColor = color(255, 0, 0);
            } else if (this.lane == 2 || this.lane == 4) {
              this.fillColor = color(0, 0, 255);
            }
            return;
          }
        }
      }
    }

    this.fillColor = color(255, 255, 255);
  }


  boolean isIntersected(int x1, int y1, int x2, int y2, int r) {
    if (dist(x1, y1, x2, y2) < r) {
      return true;
    } else {
      return false;
    }
  }


  void flash(int accuracy) {
    flashers[this.flasherNumber].accuracy = accuracy;
    flashers[this.flasherNumber].framesPassed = 0;
    this.flasherNumber = (this.flasherNumber + 1) % 5;
    
    //this.accuracyFlash = accuracy;
    //this.flashTimer.start();
  }

  /*
  void flasher() {
    color c;
    switch (this.accuracyFlash) { 
    case 1: 
      c = color(70, 70, 180); 
      break; 
    case 2: 
      c = color(200, 100, 180); 
      break; 
    case 3: 
      c = color(250, 230, 140); 
      break; 
    default: 
      c = color(0, 0, 0); 
      break;
    }
    stroke(c, 255 - 8*this.framesPassed); 
    strokeWeight(9); 
    noFill();
    ellipse(this.xpos, this.ypos, 2.1*this.radius + 5*this.framesPassed, 2.1*this.radius + 5*this.framesPassed);
    this.framesPassed += 1;
  }
  */
}


// HitEffector makes effect when you hit keys

class HitEffector {
  
  int xpos;
  int ypos;
  int radius;

  int lastingFrames = 40;
  int framesPassed = 1000;
  int accuracy = 0;
  
  HitEffector(int xpos, int ypos, int radius) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.radius = radius;
  }
  
  void display() {
    
    if (framesPassed >= lastingFrames) {
      return;
    }
    
    color c;
    switch (this.accuracy) { 
    case 1: 
      c = color(70, 70, 180); 
      //text("BAD", 200, 150); 
      break; 
    case 2: 
      c = color(200, 100, 180);
      //text("GOOD", 200, 150); 
      break; 
    case 3: 
      c = color(250, 230, 140); 
      //text("GREAT" , 200, 150);
      break; 
    default: 
      c = color(0, 0, 0); 
      break;
    }
    stroke(c, 255 - 8*this.framesPassed); 
    strokeWeight(9); 
    noFill();
    
    
     
    ellipse(this.xpos, this.ypos, 2.1*this.radius + 5*this.framesPassed, 2.1*this.radius + 5*this.framesPassed);
    this.framesPassed += 1;
  }
}
