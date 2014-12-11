// Keyboard is a note beater class

class Keyboard {

  // coordinates of the keys
  int xpos;
  int ypos;

  int lane;
  // color to fill
  color fillColor;

  // key state
  boolean over;
  int accuracyFlash;
  Timer flashTimer;

  // constants
  int radius = 40;
  int threshold = 50;

  // constructor
  Keyboard(int _lane, int _x, int _y) {
    lane = _lane;
    xpos = _x;
    ypos = _y;
    fillColor = color(255, 255, 255);
    over = false;
    flashTimer = new Timer(800);
  }

  void display() {

    // show keys
    noStroke();
    fill(fillColor);
    ellipse(xpos, ypos, 2*radius, 2*radius);

    // show flashes
    if (accuracyFlash > 0) {
      flasher();
      if (flashTimer.isFinished()) {
        accuracyFlash = 0;
        framesPassed = 0;
      }
    }

    strokeWeight(1);

    //#####debug line
    stroke(10, 10, 10);
    line(xpos - radius, ypos - radius, xpos, ypos);
  }

  void detectRed() {

    over = false;

    // for (each pixel) in the keyboard,  // not looping for every pixel because of performance issue.
    for (int x = xpos - radius; x < xpos + radius; x += 5) {
      for (int y = ypos - radius; y < ypos + radius; y += 5) {

        // if the pixel is in the circle,
        if (isIntersected(x, y, xpos, ypos, radius)) {

          stroke(2); 
          ellipse(x, y, 1, 1); //#####debug

          // pick the color of the pixel
          color pixC = cam.pixels[y*cam.width + x];
          float redity = red(pixC) - 0.5*green(pixC)- 0.5*blue(pixC);

          // if the color of the pixel is red enough,
          if (redity > threshold) {

            // change state
            over = true;
            fillColor = color(255, 0, 0);
            return;
          }
        }
      }
    }

    fillColor = color(255, 255, 255);
  }


  boolean isIntersected(int x1, int y1, int x2, int y2, int r) {
    if (dist(x1, y1, x2, y2) < r) {
      return true;
    } else {
      return false;
    }
  }

  void flash(int accuracy) {
    accuracyFlash = accuracy;
    flashTimer.start();
  }


  int framesPassed;
  void flasher() {
    color c;
    switch (accuracyFlash) { 
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
    stroke(c, 255 - 8*framesPassed); 
    strokeWeight(9); 
    noFill();
    ellipse(xpos, ypos, 2.1*radius + 5*framesPassed, 2.1*radius + 5*framesPassed);
    framesPassed += 1;
  }
}
