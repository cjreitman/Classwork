import React from 'react';
import ToDoListItem from './todo_list_item';
import ToDoForm from './todo_form.jsx';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.getTodos();
  }

  render() {

    return (

    <div>
      <ul>
        {this.props.todos.map( (todo, idx) => {
          return < ToDoListItem key={idx} todo={todo} />
        })}
      </ul>
      < ToDoForm receiveTodo={this.props.receiveTodo}
                 createTodo={this.props.createTodo} />
    </div>
    
    )

  }


  
}

export default TodoList;

// export default (todos) => {

//   console.log(todos)

// };