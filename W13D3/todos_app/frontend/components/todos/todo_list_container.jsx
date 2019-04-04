import { connect } from 'react-redux';
import Todolist from './todo_list';
import { allTodos } from './../../reducers/selectors.js';
import { receiveTodo, getTodos, createTodo } from './../../actions/todo_actions';

const mapStateToProps = (state) => {

  return {
    todos: allTodos(state)
  };

};

const mapDispatchToProps = (dispatch) => {

  return {
    getTodos: () => dispatch(getTodos()),
    receiveTodo: (todo) => dispatch(receiveTodo(todo)),
    createTodo: (todo) => dispatch(createTodo(todo))
  };

};

const container = connect(mapStateToProps, mapDispatchToProps)(Todolist);

export default container;