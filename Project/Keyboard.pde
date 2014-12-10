class Keyboard {
  int xpos;
  int ypos;
  int size;
  int threshold;
  color c;
  boolean over;
  
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
    ellipse(xpos+size/2, ypos+size/2, size, size);//white circle
    for (int x = xpos; x<xpos+size; x+=5) {
      for (int y = ypos; y<ypos+size; y+=5) {
        if (intersect(x, y, xpos, ypos, size/2)) {
          color c = cam.pixels[y*cam.width+x];
          float redity = red(c) - 0.5*green(c)- 0.5*blue(c);
          if (redity > threshold) {
            c = color(255, 0, 0);
            fill(c);
            ellipse(xpos+size/2, ypos+size/2, size, size);
            over = true;
          } else {
            c = color(255);
            over = false;
          }
        }
      }
    }
  }

  boolean intersect(int x1, int y1, int x2, int y2, int r) {
    if (dist(x1, y1, x2, y2)<r) {
      return true;
    } else {
      return false;
    }
  }
}
