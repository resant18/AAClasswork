class Clock {
  constructor() {
    // 1. Create a Date object.
    let nowTime = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hours = nowTime.getHours();
    this.minutes = nowTime.getMinutes();
    this.seconds = nowTime.getSeconds();
    // 3. Call printTime.
    console.clear()
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(this.hours + ':' + this.minutes + ':' + this.seconds);
    setTimeout(function() {console.clear()}, 1000);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.addSecond();
    this.printTime();
  }

  addSecond() {
    // this.seconds += 1; 
    // if (this.seconds === 60) {
    //   this.seconds = 0;
    //   this.minutes += 1;      
    // }

    // if (this.minutes === 60) {
    //   this.minutes = 0;
    //   this.hours += 1;
    // }

    // if (this.hours === 24) {
    //   this.hours = 0;
    // }


    this.seconds += 1;
    if (this.seconds === 60) {
      this.seconds = 0;
      this.minutes += 1;
      if (this.minutes === 60) {
        this.minutes = 0;
        this.hours += 1;
        if (this.hours === 24) {
          this.hours = 0;
        }
      }
    }

    

    
  }
}

const clock = new Clock();