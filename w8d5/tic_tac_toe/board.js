class Board {
  constructor() {
    this.grid = Array.from(new Array(3), () => new Array(3).fill(null));

    this.winner = null;
  }

  /**
   * @param {[number, number]} param0
   */
  getMark([x, y]) {
    return this.grid[x][y];
  }

  /**
   * @param {[number, number]} pos
   * @returns {boolean}
   */
  empty(pos) {
    return !this.getMark(pos);
  }

  placeMark(pos, mark) {
    const [x, y] = pos;
    if (this.empty(pos)) {
      this.grid[x][y] = mark;
    } else {
      throw new Error(`Position ${x}, ${y} has already been taken.`);
    }
  }

  won() {
    return (
      this.columns.some(c => this.checkIsFullAndSetWinner(c))
      || this.grid.some(r => this.checkIsFullAndSetWinner(r))
      || this.diagonals.some(d => this.checkIsFullAndSetWinner(r))
    )
  }

  checkIsFullAndSetWinner(arr) {
    if (arr[0] !== null && [...new Set(arr)]) {
      this.winner = arr[0];
      return true;
    } else {
      return false;
    }
  }

  get columns() {
    const result = [];

    for (let i = 0; i < this.grid.length; i++) {
      const column = [];

      for (let j = 0; j < this.grid[i].length; j++) {
        column.push(this.grid[j][i]);
      }
      result.push(column);
    }

    return result;
  }

  get diagonals() {
    const rightDiag = [];

    for (let i = 0; i < this.grid.length; i++) {
      rightDiag.push(this.grid[i][i]);
    }

    const leftDiag = [];

    for (let i = 0; i < this.grid.length; i++) {
      leftDiag.push(this.grid[i][this.grid.length - i - 1]);
    }

    return [rightDiag, leftDiag];
  }

  winner() {
    return this.winner;
  }

  toString() {
    return JSON.stringify(this);
  }

}

let board = new Board();
board.placeMark([1, 2], "X");
console.log(board.getMark([1, 2]));
// board.placeMark([1, 2], "O");
console.log(board.toString())