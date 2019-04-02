import React from "react";
// import Tile from "./tile.jsx";
import TileComponent from "./tile.jsx";

export default class Board extends React.Component {
  constructor(props) {
    super(props);
  
  }

  render() {
    return (
      
      <div className="board">
        <ul>
          {this.props.board.grid.map((row, idx) => {
            return <div className="row" key={idx}>
              {row.map((tile, idx) => {
                return <li key={idx}><TileComponent updateGameFcn={this.props.updateGameFcn} tile={tile} /></li> 
              })}
            </div>
          })}
        </ul>
    
      </div>
    )
  }
}