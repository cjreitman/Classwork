const Board = require('./board');
const AIPlayer = require('./player');

// const readline = require('readline');
// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

class Game {
  constructor(reader) {
    // this.reader = reader;
    this.board = new Board();
    this.aip = new AIPlayer(this.board);
  }

  run(reader, completionCallback, mark = 'exe') {
    if (!this.board.won(mark)) {
      if (mark === 'circle') {
        this.aip.makeMove();
        this.aip.board = this.board;
        this.board.print();
        if (mark === 'exe') {
          mark = 'circle';
        } else {
          mark = 'exe';
        }

        if (this.board.winner()) {
          console.log(`The winner is: ${this.board.winner()}!`);
          completionCallback();
        } else {
          this.run(reader, completionCallback, mark);
        }
      } else {
        reader.question(`${mark}'s turn! Please select a row: `, (row) => {
          reader.question("Please select a column: ", (column) => {
            let pos = [];
            pos.push(parseInt(row));
            pos.push(parseInt(column));
            console.log(pos);
            if (!this.board.empty(pos)) {
              console.log("You lost a turn, dumbass.");
            }
            
            this.board.placeMark(pos, mark);
            this.aip.board = this.board;
            this.board.print();

            if (mark === 'exe') {
              mark = 'circle';
            } else {
              mark = 'exe';
            }


            if (this.board.winner()) {
              console.log(`The winner is: ${this.board.winner()}!`);
              completionCallback();
            } else {
              this.run(reader, completionCallback, mark);
            }
          })
        })
      }
    }  
  }
}

module.exports = Game;