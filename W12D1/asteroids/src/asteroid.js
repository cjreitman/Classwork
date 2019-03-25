const Util = require("./util.js");
const MovingObject = require("./moving_object.js")

const defaults = { color: 'grey', radius: 30 }

function Asteroid(options) {
  this.pos = options.pos;
  this.vel = Util.randomVec(5);
  this.radius = defaults.radius;
  this.color = defaults.color;
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;