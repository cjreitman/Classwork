import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './frontend/store/store.js'
import { receiveTodo } from './frontend/actions/todo_actions.js';
import { Root } from './frontend/components/root.jsx';
import { allTodos } from './frontend/reducers/selectors'; 

// function Root() {
//   return (
//     <div>

//     </div>
//   );
// }

document.addEventListener("DOMContentLoaded", () => {

  const store = configureStore();
 
  
  ReactDOM.render(<Root store={store} />, document.getElementById('root'));
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.allTodos = allTodos;
});





