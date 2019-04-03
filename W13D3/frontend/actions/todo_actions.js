export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';


export const receiveTodos = function(todos) {

  return {
    type: RECEIVE_TODOS,
    todos
  };

};

// return { type: RECEIVE_TODOS, todo: [ all the todo stuff ] }

export const receiveTodo = function(todo) {

  return {
    type: RECEIVE_TODO,
    todo
  };

};