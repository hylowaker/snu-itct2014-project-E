class Timer {
  
  int savedTime;
  int totalTime;
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  void start() {
    savedTime = millis();
  }
  
  boolean isFinished() {
    // calculates time passed
    int timePassed = millis() - savedTime;
    // check time passed
    if (timePassed > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
