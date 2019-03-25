
Function.prototype.inherits = function(superClass) {
  
  var Surrogate = function() {};
  Surrogate.prototype = superClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = superClass.constructor;

};

function MovingObject (name) {
  this.name = name;
}

MovingObject.prototype.move = function() {
  console.log(`${this.name} moves from here to there.`)
};

function Asteroid(name) {
  this.name = name
}
Asteroid.inherits(MovingObject)

Asteroid.prototype.crash = function() {
  console.log(`${this.name} crashes into a planet.`)
}



mo = new MovingObject('Sergey');
mo.move();
c = new Asteroid('Colins Asteroid');
c.move();
c.crash();



