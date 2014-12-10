// Keyboard is a note beater class

class Keyboard {
  
  // coordinates of the keys
  int xpos;
  int ypos;
  // color to fill
  color c;
  
  // key state
  boolean over;
  
  // constants
  int size;
  int threshold;
  
  // constructor
  Keyboard(int _x, int _y) {
    xpos = _x;
    ypos = _y;
    size = 80;
    threshold = 50;
    c = color(255);
    over = false;
  }
  
  void display() {
    noStroke();
    
    fill(c);
    
    // show white, circle-shape keys
    ellipse(xpos + size/2, ypos + size/2, size, size);
    
    //#####debug line
    stroke(5);
    line(xpos, ypos, xpos + size/2, ypos + size/2);
    
    detectRed();
  }

  void detectRed() {
    
    over = false;
    
    // for (each pixel) in the keyboard,  // not looping for every pixel because of performance issue.
    for (int x = xpos; x < xpos + size; x += 5) {
      for (int y = ypos; y < ypos + size; y += 5) {
        
        // if the pixel is in the circle,
        if (intersect(x, y, xpos + size/2, ypos + size/2, size/2)) {
          
          stroke(2); ellipse(x, y, 1, 1); //#####debug
          
          // pick the color of the pixel
          color pixC = cam.pixels[y*cam.width + x];
          float redity = red(pixC) - 0.5*green(pixC)- 0.5*blue(pixC);
          
          // if the color of the pixel is red enough,
          if (redity > threshold) {
                  
            // change state
            over = true;
            c = color(255, 0, 0);
            return;
          }
          
        }
        
      }
    }
    
    c = color(255, 255, 255);
    
  }
  
  
  boolean intersect(int x1, int y1, int x2, int y2, int r) {
    if (dist(x1, y1, x2, y2) < r) {
      return true;
    } else {
      return false;
    }
  }
}
