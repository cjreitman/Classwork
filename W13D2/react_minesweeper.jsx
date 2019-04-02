import React from 'react';
import ReactDOM from 'react-dom';
import Game from './components/game';

function Root() {
  return (
    <div>
      <Game />
    </div>
    // <Modal />
  );
}

document.addEventListener("DOMContentLoaded", () => {

  ReactDOM.render(<Root />, document.getElementById('root'));

});



