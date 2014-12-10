// Keyboard is a note beater class

class Keyboard {
  
  // coordinates of the keys
  int xpos;
  int ypos;
  // color to fill
  color fillColor;
  
  // key state
  boolean over;
  
  // constants
  int radius;
  int threshold;
  
  // constructor
  Keyboard(int _x, int _y) {
    xpos = _x;
    ypos = _y;
    radius = 40;
    threshold = 50;
    fillColor = color(255);
    over = false;
  }
  
  void display() {
    noStroke();
    
    fill(fillColor);
    
    // show white, circle-shape keys
    ellipse(xpos, ypos, 2*radius, 2*radius);
    
    //#####debug line
    stroke(5);
    line(xpos - radius, ypos - radius, xpos, ypos);
    
    detectRed();
  }

  void detectRed() {
    
    over = false;
    
    // for (each pixel) in the keyboard,  // not looping for every pixel because of performance issue.
    for (int x = xpos - radius; x < xpos + radius; x += 5) {
      for (int y = ypos - radius; y < ypos + radius; y += 5) {
        
        // if the pixel is in the circle,
        if (intersect(x, y, xpos, ypos, radius)) {
          
          stroke(2); ellipse(x, y, 1, 1); //#####debug
          
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
  
  
  boolean intersect(int x1, int y1, int x2, int y2, int r) {
    if (dist(x1, y1, x2, y2) < r) {
      return true;
    } else {
      return false;
    }
  }
}
