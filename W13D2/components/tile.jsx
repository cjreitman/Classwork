import React from "react";
import { Tile } from "./minesweeper.js";

export default class TileComponent extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick(e) {
    e.preventDefault();
    this.props.updateGameFcn(this.props.tile, e.altKey)
  }

  render() {
    
    // return (
      if (this.props.tile.bombed) {
        return (<div onClick={this.handleClick} className="tile bombed">B</div>)
      } else if (this.props.tile.explored) {
        let num = this.props.tile.adjacentBombCount();
        return (<div onClick={this.handleClick} className="tile explored">{num}</div>)
      } else if (this.props.tile.flagged) {
        return (<div onClick={this.handleClick} className="tile flagged">F</div>)
      } else {
        return (<div onClick={this.handleClick} className="tile"></div>)
      }
      
    // );
  }
}