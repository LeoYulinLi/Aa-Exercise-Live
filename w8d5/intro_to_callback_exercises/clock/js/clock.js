class Clock {
  constructor() {
    // 1. Create a Date object.
    this.date = new Date();

    // 2. Store the hours, minutes, and seconds.
    this.hours = this.date.getHours();
    this.minutes = this.date.getMinutes();
    this.seconds = this.date.getSeconds();

    // 3. Call printTime.
    this.printTime();

    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this), 1000);
  }

  get timeString() {
    // return this.date.toLocaleTimeString("en-us", {
    //   hour: "2-digit",
    //   minute: "2-digit",
    //   second: "2-digit",
    //   hour12: false
    // });
    return `${this.hours}:${this.minutes}:${this.seconds}`;
  }

  displayTime() {
    $("#clock").text(this.timeString);
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(this.timeString);
  }

  _tick() {
    // 1. Increment the time by one second.
    this.date.setSeconds(++this.seconds);
    this.hours = this.date.getHours();
    this.minutes = this.date.getMinutes();
    this.seconds = this.date.getSeconds();
    // 2. Call printTime.
    this.printTime();
    // this.displayTime();
  }
}

const clock = new Clock();