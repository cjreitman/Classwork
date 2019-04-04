import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import { receiveTodo } from './actions/todo_actions.js';
import { getTodos, createTodo } from './actions/todo_actions.js';
import { Root } from './components/root.jsx';
import { allTodos } from './reducers/selectors'; 


document.addEventListener("DOMContentLoaded", () => {

  const store = configureStore();
 
  ReactDOM.render(<Root store={store} />, document.getElementById("content"));
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.allTodos = allTodos;
  window.getTodos = getTodos;
  window.createTodo = createTodo;

  
});





