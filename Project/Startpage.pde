// Start page class

class Startpage {
  PImage [] imgs = new PImage[10]; 
  int xpos1 = 250;
  int ypos1 = 120;
  int xpos2 = 250;
  int ypos2 = 195;
  int xpos3 = 250;
  int ypos3 = 270;
  int pagecount = 0;
  Startpage() {
    imgs[0]= loadImage("lab.png");
    imgs[1]= loadImage("lab_01.png");
    imgs[2]= loadImage("lab_02.png");
    imgs[3]= loadImage("poster.png");
    imgs[4]= loadImage("poster_01.png");
    imgs[5]= loadImage("band.png");
    imgs[6]= loadImage("band_01.png");
    imgs[7]= loadImage("band_02.png");
  }

  void display() {
    if(pagecount == 0){
      image(imgs[0],0,0);
    }
    else if(pagecount == 1){
    background(123, 200, 0);
    fill(255);
    rect(xpos1, ypos1, 150, 50);
    rect(xpos2, ypos2, 150, 50);
    rect(xpos3, ypos3, 150, 50);//button 3
    fill(0);
    textSize(20);
    text("Demo Game", 270, 100);
    text("I love you", xpos1+20, ypos1+30);
    text("Song 2", xpos2+20, ypos2+30);
    text("Get Lucky", xpos3+20, ypos3+30);
    }
  }




  int over() {
    if (mouseX>xpos1 && mouseY>ypos1 && mouseX<xpos1+150 && mouseY<= ypos1+50) {
      return 1;//button 3
    } else if (mouseX>xpos2 && mouseY>ypos2 && mouseX<xpos2+150 && mouseY<= ypos2+50) {
      return 2;//button 3
    } else if (mouseX>xpos3 && mouseY>ypos3 && mouseX<xpos3+150 && mouseY<= ypos3+50) {
      return 3;//button 3
    } else {
      return 0;
    }
  }
}
