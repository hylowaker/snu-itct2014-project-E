// Keyboard is a note beater class

class Keyboard {
  
  int lane;
  int xpos, ypos;
  
  PImage image;
  int imagesize;

  // key state
  boolean over;
  boolean[] overStates = new boolean[2];
  
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
    for (int i=0; i < flashers.length; i++) {
      flashers[i] = new HitEffector(this.xpos, this.ypos, this.radius);
    }
  }


  void drumComponentLoop() {  // ##### experimental
  }
  
  
  void noteBeaterLoop() {  // ##### experimental
    rect(this.xpos, this.ypos - this.imagesize/2 - 20, 50, notes[0].size/2);
  }


  void display() {  // loop

    // show keys
    noStroke();
    imageMode(CENTER);
    image(this.image, this.xpos, this.ypos, this.imagesize, this.imagesize);

    // show flashes
    for (int i=0; i < flashers.length; i++) {
      flashers[i].display();
    }
    
    imageMode(CORNER);
    strokeWeight(1);
  }
  

  void detectColors() {  // loop

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
        
          // if the color of the pixel is red enough,
          if (detect1 > this.threshold || detect2 > this.threshold) {

            // change state
            this.over = true;
            this.pushStates(this.over);       
            return;
          }
        }
      }
    }
    this.pushStates(this.over); 
  }


  boolean isIntersected(int x1, int y1, int x2, int y2, int r) {
    float tmpDist = dist(x1, y1, x2, y2);
    if (tmpDist < r && tmpDist > 0.625*r) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean isHit() {
    return !this.overStates[0] && this.overStates[1];
  }
  
  void pushStates(boolean over) {
    this.overStates[0] = this.overStates[1];
    this.overStates[1] = over;
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
