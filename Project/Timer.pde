class Timer {

  int savedTime;
  int totalTime;

  Timer(int totalTime) {
    this.totalTime = totalTime;
  }

  void start() {
    this.savedTime = millis();
  }

  boolean isFinished() {
    // calculates time passed
    int timePassed = millis() - this.savedTime;
    // check time passed
    if (timePassed > this.totalTime) {
      return true;
    } else {
      return false;
    }
  }
}

