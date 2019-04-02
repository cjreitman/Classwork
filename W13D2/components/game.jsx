import React from "react";
import { Board, Tile } from "./minesweeper";
import Boardcomponent from "./board";

export default class Game extends React.Component {

  constructor(props) {
    super(props);
    this.state = { board: new Board(15, 1) };
    this.updateGame = this.updateGame.bind(this);
    this.restartGame = this.restartGame.bind(this);
  }

  updateGame(tile, isFlag) {
    if (isFlag) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }
    this.setState( { board: this.state.board } );
    
  }

  restartGame(e) {
    e.preventDefault();
    this.setState({ board: new Board(15, 1) });
  }

  render() {
    // return (
      // <h1>Hello World, Again</h1>
      if (this.state.board.won()) {
        return (<article class="modal-content">
        <span class="modal-close js-hide-modal">×</span>
        <h1>You won but you suck anyway!</h1>
        <p>Deal with it.</p>
        <button onClick={this.restartGame}>Play Again</button>
      </article>)
      } else if (this.state.board.lost()) {
        debugger;
        return (<h1>you lost and that makes colin happy</h1>)
      } else {
        return (
          <div>
            <Boardcomponent board={this.state.board} updateGameFcn={this.updateGame}/>
          </div>
        )
      }
  } 

}

