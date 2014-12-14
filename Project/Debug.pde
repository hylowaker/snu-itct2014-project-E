class Debug {
  
  void print(String text) {
    println(text);
  }
  
  void printkeystate(int i) {
    int a,b,c;
    if(keys[i].overStates[0]) {a = 1;}
    else {a = 0;}
    if(keys[i].overStates[1]) {b = 1;}
    else {b = 0;}
    //if(keys[i].overStates[2]) {c = 1;}
    //else {c = 0;}
    //println(a+""+b+""+c+"");
    println(a+""+b+"");
  }
  
  void textOnScreen(String text, int paramX, int paramY) {
    text(text, paramX, paramY);
  }
  
}
