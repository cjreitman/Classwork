let MovingObject = require("./moving_object.js");
let Asteroid = require("./asteroid.js");
let Game = require("./game.js");

window.Game = Game;
window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
document.addEventListener("DOMContentLoaded", function() {
  let canvas = document.getElementById("game-canvas");
  canvas.width = 500;
  canvas.height = 500;

  let ctx = canvas.getContext("2d");
  window.ctx = ctx;
  
})

console.log("hello world")

