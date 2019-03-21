class Board {
  constructor() {
    this.grid = this._makeBoard();
  }

  _makeBoard() {
    let arr = [];
    for (let i = 0; i < 3; i++) {
      let subArr = [];
      for (let j = 0; j < 3; j++) {
        subArr.push(undefined);
      }
      arr.push(subArr);
    }
    return arr;
  }

  won(piece) {
    let result = false;
    const possibilities = [
      [this.grid[0][0], this.grid[1][0], this.grid[2][0]],
      [this.grid[0][1], this.grid[1][1], this.grid[2][1]],
      [this.grid[0][2], this.grid[1][2], this.grid[2][2]],
      [this.grid[0][0], this.grid[0][1], this.grid[0][2]],
      [this.grid[1][0], this.grid[1][1], this.grid[1][2]],
      [this.grid[2][0], this.grid[2][1], this.grid[2][2]],
      [this.grid[0][0], this.grid[1][1], this.grid[2][2]],
      [this.grid[2][0], this.grid[1][1], this.grid[0][2]]
    ]

    possibilities.forEach( subArr => {
      if (subArr[0] === piece && subArr[1] === piece && subArr[2] === piece) result = true;
    })

    return result;
  }

  winner() {
    if (this.won('circle')) {
      return 'circle';
    } else if (this.won('exe')) {
      return 'exe';
    }
    return null;
  }

  empty(pos) {
    const [x,y] = pos;
    if ( this.grid[x][y] === undefined ) return true;
    return false;
  }
  
  placeMark(pos, mark) {
    const [x,y] = pos;
    if (this.empty(pos)) {
      this.grid[x][y] = mark;
    }
  }

  print() {
    console.log('\n');
    for (let i = 0; i < 3; i++) {
      let subArr = []
      for (let j = 0; j < 3; j++) {
        if ( this.grid[i][j] === undefined ) {
          subArr.push('_');
        } else if (this.grid[i][j] === 'circle') {
          subArr.push('o');
        } else {
          subArr.push('x');
        }      
      }
      console.log(subArr);
      console.log('\n');
    }
  };
  
  
}

module.exports = Board;