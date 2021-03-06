import { RECEIVE_TODOS, RECEIVE_TODO } from './../actions/todo_actions';
import { merge } from 'lodash';

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  let newState = merge( {}, state );
  switch(action.type) {
    case RECEIVE_TODOS:
      action.todos.forEach((obj) => {
        newState[obj.id] = obj;
      });
      return newState;
    case RECEIVE_TODO:
      newState[action.todo.id] = action.todo;
      return newState;
    default:
      return state;
  }
};

export default todosReducer;


// const todosReducer = (state = initialState, action) => {
//   switch(action.type) {
//     case RECEIVE_TODOS:
//       // return the todos from the action
//     case RECEIVE_TODO:
//       // Make a new object setting a single key value pair for action.todo
//       // Return a new state object by merging your previous state and your
//       // new object
//     default:
//       return state;
//   }
// };
