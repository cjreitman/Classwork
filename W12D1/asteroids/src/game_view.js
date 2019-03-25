
function GameView(game, ctx) {
  this.game = game;
  this.ctx = ctx;
  this.start(this.game.moveObjects(), this.game.draw())
}

GameView.prototype.start = function(move, draw) {
  setInterval(func, 20);
}

