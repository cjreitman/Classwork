const Board = require('./board');

class AIPlayer {
    constructor(board) {
        this.mark = 'circle';
        this.board = board;
    }

    makeMove() {
        let result = this.preventWin();
        if (!result) {
            for (let i = 0; i < 3; i++) {
                for (let j = 0; i < 3; j++) {
                    if (this.board.empty([i,j])) {
                        this.board.placeMark([i, j], this.mark); 
                        return true;
                    }
                }
            }
        }
    }

    preventWin() {
        let board_dup = Array.from(this.board);
        let result = false;
        for(let i = 0; i < 3; i++) {
          for( let j = 0; j < 3; j++) {
            if (!board_dup.empty([i, j])) {
                board_dup.placeMark([i, j], 'exe');
                if (board_dup.winner() === 'exe') {
                    this.board.placeMark([i, j], this.mark);
                    result = true;
                    break;
                }
            }
            
          }
          if (result === true) break;
        }
        return result;
    }


}

module.exports = AIPlayer;