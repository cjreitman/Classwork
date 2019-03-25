const Asteroid = require('./asteroid.js');



function Game() {
  this.asteroids = [];
  this.addAsteroids(); 
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i <= 5; i++) {
    this.asteroids.push(new Asteroid({ pos: [`${i + 1}00`, `${i + 1}00`]}));
  }
}

Game.prototype.randomPosition = function () {

}

Game.prototype.draw = function(ctx) {

}

Game.prototype.moveObjects = function() {

}

module.exports = Game; 
