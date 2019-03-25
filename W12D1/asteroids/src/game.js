const Asteroid = require('./asteroid.js');
// const MovingObject = require('./moving_object')


function Game() {
  this.asteroids = [];
  this.addAsteroids(); 
  this.draw(ctx);
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i <= 5; i++) {
    this.asteroids.push(new Asteroid({ pos: this.randomPosition() }));
  }
}

Game.prototype.randomPosition = function () {

  let x = (Math.random() * 500);
  let y = (Math.random() * 500);
  return [x,y];

}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, 500, 500);
  for(let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].draw(ctx);
  }
}

Game.prototype.moveObjects = function() {
  for(let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move();
  }  
}

module.exports = Game; 
