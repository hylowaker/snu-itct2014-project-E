// Keyboard is a note beater class

class Keyboard {
  
  int lane;
  int xpos, ypos;
  
  PImage image;
  int imagesize;
  float imageresizer;

  // key state
  boolean over;
  boolean[] overStates = new boolean[2];
  
  AudioPlayer drumsound;
  
  HitEffector[] waves = new HitEffector[5];
  int waveNumber = 0;
  BeatEffector[] flashers = new BeatEffector[2];
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
    this.drumsound = minim.loadFile("DrumSoundSample_"+this.lane+".mp3");
    float tempPan = (this.lane == 2 | this.lane == 3) ? 0 : map(this.lane, 1, 4, -1, 1);
    this.drumsound.setPan(tempPan);
    for (int i=0; i < waves.length; i++) {
      waves[i] = new HitEffector(this.lane, this.xpos, this.ypos);
    }
    for (int i=0; i < flashers.length; i++) {
      flashers[i] = new BeatEffector(this.lane, this.xpos, this.ypos - this.imagesize/2 - 20);
    }
  }


  /*
  void drumComponentLoop() {  // ##### experimental
  }
  
  
  void noteBeaterLoop() {  // ##### experimental
    rect(this.xpos, this.ypos - this.imagesize/2 - 20, 50, notes[0].size/2);
  }
  */


  void display() {  // loop

    // show keys
    noStroke();
    imageMode(CENTER);
    image(this.image, this.xpos, this.ypos, this.imagesize + this.imageresizer, this.imagesize + this.imageresizer);

    // show waves (HitEffector) and play drum sound
    if (this.isHit()) {
      this.imageresizer = 30;
      this.wave();
      //this.drumsound = minim.loadFile("DrumSoundSample_"+this.lane+".mp3"); 
      this.drumsound.rewind();
      this.drumsound.play();
      if (this.lane == 4) {  // autoplay kicksound when cymbal hit
        keys[2].imageresizer = 30;
        keys[2].drumsound.rewind();
        keys[2].drumsound.play();
      }
    }
    for (int i=0; i < waves.length; i++) {
      waves[i].display();
    }
    
    // show flashes (BeatEffector)
    for (int i=0; i < flashers.length; i++) {
      flashers[i].display();
    }
 
    this.imageresizer = (this.imageresizer > 0) ? this.imageresizer - 5 : 0;
    imageMode(CORNER);
    strokeWeight(1);
  }
  

  void detectColors() {  // loop

    this.over = false;

    // for (each pixel) in the keyboard:  // not looping for every pixel because of performance issue.
    for (int x = this.xpos - this.radius; x < this.xpos + this.radius; x += 5) {
      for (int y = this.ypos - this.radius; y < this.ypos + this.radius; y += 5) {

        // if the pixel is in the circle:
        if (this.isIntersected(x, y, this.xpos, this.ypos, this.radius)) {

          //stroke(10, 10, 10); 
          //ellipse(x, y, 1, 1); //#####debug

          // pick the color of the pixel
          color pixC = cam.pixels[y*cam.width + x];
          float detect1 = red(pixC) - 0.5*green(pixC)- 0.5*blue(pixC); // detect red
          float detect2 = blue(pixC) - 0.5*green(pixC)- 0.5*red(pixC); // detect blue
        
          // if the color of the pixel is red or blue enough:
          if (detect1 > this.threshold || detect2 > this.threshold) {

            // change state
            this.over = true;
            this.pushStates(this.over);       
            return;
          }
        }
      }
    }
    this.over = false;
    this.pushStates(this.over); 
    return;
  }


  boolean isIntersected(int x1, int y1, int x2, int y2, int r) {
    float tmpDist = dist(x1, y1, x2, y2);
    if (tmpDist < r && tmpDist > 0.375*r) {
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

  void wave() {
    this.waves[this.waveNumber].framesPassed = 0;
    this.waveNumber = (this.waveNumber + 1) % waves.length;
  }

  void flash(int accuracy) {
    this.flashers[this.flasherNumber].accuracy = accuracy;
    this.flashers[this.flasherNumber].framesPassed = 0;
    this.flasherNumber = (this.flasherNumber + 1) % flashers.length;
  }

}


// HitEffector makes effect when you hit keys

class HitEffector {
  
  int lane;
  int xpos;
  int ypos;
  int size;

  int lastingFrames = 30;
  int framesPassed = 1000;
  int accuracy = 0;
  
  
  HitEffector() {}
  
  HitEffector(int lane, int xpos, int ypos) {
    this(lane, xpos, ypos, 30);
  }
  
  HitEffector(int lane, int xpos, int ypos, int size) {
    this.lane = lane;
    this.xpos = xpos;
    this.ypos = ypos;
    this.size = size;
  }
  
  
  void display() {
    
    if (this.framesPassed >= this.lastingFrames) {
      return;
    }
    
    color c;
    c = color(248, 228, 159);
    stroke(c, 255 - 12*this.framesPassed); 
    strokeWeight(6); 
    noFill();
    
    ellipse(this.xpos, this.ypos, 2.1*this.size + 8*this.framesPassed, 2.1*this.size + 8*this.framesPassed);
    this.framesPassed += 1;
    strokeWeight(1);
  }
}



class BeatEffector extends HitEffector {
  
  int Y_AXIS = 1;
  int X_AXIS = 2;
  color b1, b2, c1, c2;
  
  BeatEffector(int lane, int xpos, int ypos) {
    this(lane, xpos, ypos, 30);
  }
  
  BeatEffector(int lane, int xpos, int ypos, int size) {
    this.lane = lane;
    this.xpos = xpos;
    this.ypos = ypos;
    this.size = size;
  }

  void display() {
    
    if (this.framesPassed >= this.lastingFrames) {
      return;
    }
    
    color c1, c2;
    switch (this.accuracy) { 
    case 1: 
      c1 = color(70, 70, 180, 190); 
      c2 = color(c1, 0);
      //OK
      break; 
    case 2: 
      c1 = color(200, 60, 60, 230);
      c2 = color(c1, 0);
      //GOOD 
      break; 
    case 3: 
      c1 = (this.framesPassed%4 <= 1) ? color(250, 230, 100) : color (244, 160, 90); 
      c2 = color(c1, 0);
      //COOL
      break; 
    default: 
      c1 = color(0, 0, 0);
      c2 = c1;
      break;
    }
    this.setGradient(this.xpos, this.ypos - 260, 2.1*this.size, 260, c2, c1, Y_AXIS);
    this.framesPassed += 1;
  }
  
  
  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

    noFill();
    strokeWeight(1);
    if (axis == Y_AXIS) {  // Top to bottom gradient
      for (int i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c, 255 - 10*this.framesPassed);
        line(x-w/2, i, x+w/2, i);
      }
    } else if (axis == X_AXIS) {  // Left to right gradient
      for (int i = x; i <= x+w; i++) {
        float inter = map(i, x, x+w, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c, 255 - 10*this.framesPassed);
        line(i, y-h/2, i, y+h/2);
      }
    }
  }

}
