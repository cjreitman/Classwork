import React from 'react';
import { uniqueId } from './../../util/unique_id.js';
import { merge } from 'lodash';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      id: "",
      title: "",
      body: "",
      done: false
    };
    
    this.createTodo = this.createTodo.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  createTodo(e) {
    e.preventDefault();
    let newTodo = merge( {}, this.state );
    newTodo.id = uniqueId();


  }

  handleChange(field) {
    return (eventO) => {
      this.setState( { [field]: eventO.target.value } );
    };
  }

  render() {
    return (
      <form>
        <label>
          Title:
          <input value={this.state.title} onChange={this.handleChange("title")} type="text"/>
        </label>

        <label>
          Body:
          <input value={this.state.body} onChange={this.handleChange("body")} type="text"/>
        </label>
        
        <button onClick={this.createTodo}>Add Item</button>
      </form>
    )
  }
}

export default TodoForm;
