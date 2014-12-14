// Keyboard is a note beater class

class Keyboard {

  // coordinates of the keys
  int xpos;
  int ypos;

  int lane;
  
  PImage image;
  int imagesize;
  
  // color to fill
  //color fillColor;

  // key state
  boolean over;
  HitEffector[] flashers = new HitEffector[5];
  int flasherNumber = 0;

  // constants
  int radius = 30;
  int threshold = 50;

  // constructor
  Keyboard(int lane, int xpos, int ypos) {
    this(lane, xpos, ypos, "key" + lane + ".png");
  }
  
  Keyboard(int lane, int xpos, int ypos, String imagePath) {
    this.lane = lane;
    this.xpos = xpos;
    this.ypos = ypos;
    this.image = loadImage(imagePath);
    this.imagesize = 80;
    //this.fillColor = color(255, 255, 255);
    for (int i=0; i < flashers.length; i++) {
      flashers[i] = new HitEffector(this.xpos, this.ypos, this.radius);
    }
  }


  void drumComponentLoop() {
  }
  
  
  void noteBeaterLoop() {  // ##### experimental
    rect(this.xpos, this.ypos - this.imagesize/2 - 20, 50, notes[0].size/2);
  }


  void display() {

    // show keys
    noStroke();
    //fill(this.fillColor);
    imageMode(CENTER);
    image(this.image, this.xpos, this.ypos, this.imagesize, this.imagesize);

    // show flashes
    for (int i=0; i < flashers.length; i++) {
      flashers[i].display();
    }
    
    imageMode(CORNER);
    strokeWeight(1);
  }
  

  void detectColors() {

    this.over = false;

    // for (each pixel) in the keyboard,  // not looping for every pixel because of performance issue.
    for (int x = this.xpos - this.radius; x < this.xpos + this.radius; x += 5) {
      for (int y = this.ypos - this.radius; y < this.ypos + this.radius; y += 5) {

        // if the pixel is in the circle,
        if (this.isIntersected(x, y, this.xpos, this.ypos, this.radius)) {

          stroke(10, 10, 10); 
          ellipse(x, y, 1, 1); //#####debug

          // pick the color of the pixel
          color pixC = cam.pixels[y*cam.width + x];
          float detect1 = red(pixC) - 0.5*green(pixC)- 0.5*blue(pixC);
          float detect2 = blue(pixC) - 0.5*green(pixC)- 0.5*red(pixC);
        
          // if the color of the pixel is red enough,
          if (detect1 > this.threshold || detect2 > this.threshold) {

            // change state
            this.over = true;
            if (this.lane == 1 || this.lane == 3) {
              //this.fillColor = color(255, 0, 0);
            } else if (this.lane == 2 || this.lane == 4) {
              //this.fillColor = color(0, 0, 255);
            }
            return;
          }
        }
      }
    }

    //this.fillColor = color(255, 255, 255);
  }


  boolean isIntersected(int x1, int y1, int x2, int y2, int r) {
    float tmpDist = dist(x1, y1, x2, y2);
    if (tmpDist < r && tmpDist > 0.625*r) {
      return true;
    } else {
      return false;
    }
  }


  void flash(int accuracy) {
    flashers[this.flasherNumber].accuracy = accuracy;
    flashers[this.flasherNumber].framesPassed = 0;
    this.flasherNumber = (this.flasherNumber + 1) % 5;
  }

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
      //BAD
      break; 
    case 2: 
      c = color(200, 100, 180);
      //GOOD 
      break; 
    case 3: 
      c = color(250, 230, 140); 
      //COOL
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
    strokeWeight(1);
  }
}
