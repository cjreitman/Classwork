import { connect } from 'react-redux';
import Todolist from './todo_list';
import { allTodos } from './../../reducers/selectors.js';
import { receiveTodo } from './../../actions/todo_actions';

const mapStateToProps = (state) => {

  return {
    todos: allTodos(state)
  };

};

const mapDispatchToProps = (dispatch) => {

  return {
    receiveTodo: (todo) => dispatch(receiveTodo(todo))
  };

};

const container = connect(mapStateToProps, mapDispatchToProps)(Todolist);

export default container;