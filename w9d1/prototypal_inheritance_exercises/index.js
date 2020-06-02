
// Function.prototype.inherits = function(SuperClass) {
//   const Surrogate = function() {}
//   Surrogate.prototype = SuperClass.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// }

Function.prototype.inherits = function(SuperClass){
  this.prototype = Object.create(SuperClass.prototype);
  this.prototype.constructor = this;
}

function MovingObject () {}

MovingObject.prototype.what = function() {
  return "thing";
}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);

someValue = new Asteroid()
console.log(someValue.what());