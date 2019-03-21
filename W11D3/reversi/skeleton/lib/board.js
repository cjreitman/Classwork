let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let arr = [];

  for ( let i = 0; i <= 7; i++) {
    let subArr = [];
    for ( let j = 0; j <= 7; j++) {
      subArr.push(undefined);
    }
    arr.push(subArr);
  }
  arr[3][4] = new Piece('black');
  arr[4][3] = new Piece('black');
  arr[3][3] = new Piece('white');
  arr[4][4] = new Piece('white');

  return arr;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  const [x, y] = pos;
  if ( x < 0 || x > 7 || y < 0 || y > 7 ) {
    throw new Error('Not valid pos!');
  }
  return this.grid[x][y];
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {//color='black'

};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  const [x, y] = pos;
  if ( this.grid[x][y] !== undefined ) {
    if ( this.grid[x][y].color === color) {
      return true;
    }
  }
  return false;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  // const [x, y] = pos;
  return !!this.getPiece(pos);
  // if ( this.grid[x][y] !== undefined ) {
  //   return true;
  // }
  // return false;
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let [x,y] = pos;
  if (x < 0 || x > 7 || y < 0 || y > 7) {
    return false;
  }
  return true;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
  
  if (!piecesToFlip) {
    piecesToFlip = [];
  } else {
  piecesToFlip.push(pos);
  }
  
  let nextpos = [(pos[0] + dir[0]), (pos[1] + dir[1])];
  // console.log(`${dir} Occ: ${board.isOccupied(nextpos)} Valid: ${board.isValidPos(nextpos)} `  )
  // console.log(nextpos)
  if (!board.isValidPos(nextpos) || !board.isOccupied(nextpos)) {
    return null;
  } else if (!board.isMine(nextpos, color)) {
    return _positionsToFlip(board, nextpos, color, dir, piecesToFlip);
  } else 
    if (piecesToFlip.length > 0) {
        return piecesToFlip;
    } else {
      return null;
    }
  }
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  // if ( this.isValidPos(pos) === false ) {
  //   throw new Error('Invalid Move');
  // };

  // let [x,y] = pos;
  // this.grid[x][y] = new Piece(color);
  

};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  let newArr = [];
  for (let i = 0; i < 8; i++) {
    let subArr = []
    for (let j = 0; j < 8; j++) {
      if ( this.grid[i][j] === undefined ) {
        subArr.push('_');
      } else {
        subArr.push(this.grid[i][j].toString());
      }
    }
    newArr.push(subArr);
  }
  console.log(newArr);
};

Board.prototype.validMove = function (pos, color) {
  // if (this.isOccupied(pos)) {
  //   return false;
  // }

  // let [target_x, target_y] = pos;
  
  // Board.DIRS.forEach(offset => {
  //     let [x_offset, y_offset] = offset;
  //     let checkPos = [target_x, target_y];
  //     for (let i = 1; i <= 7; i++) {
  //       let new_x = checkPos[0] + x_offset;
  //       let new_y = checkPos[1] + y_offset;
  //       let newPos = [new_x, new_y];
  //       if (!this.isValidPos(newPos)) {
  //         break;
  //       } else if (this.grid[new_x][new_y] === undefined) {
  //         break;
  //       } else if (this.grid[new_x][new_y].color === color) {
  //         if ( i === 1) {
  //           break;
  //         } else {
  //           return true;
  //         }
  //       }
  //     }
  //   }
  // )
  // return false;
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {

};

module.exports = Board;

// ///

// let board = new Board();
// console.log('test');
// board.print();
// console.log(board.getPiece(pos));

board = new Board();
pos = [2, 3];
color = 'black';
Board.DIRS.forEach( dir => {
  console.log(_positionsToFlip(board, pos, color, dir));
})
dir = [0, 1];
board.print();
