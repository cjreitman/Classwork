import React from 'react';

class SessionForm extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
  this.handleSubmit = this.handleSubmit.bind(this);  
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  update(field) {
    return e => this.setState({
      [field]: e.currentTarget.value
    });
  }
 
  render() {
    return (
      <div>
      <h3>{this.props.formType}</h3>

      <label>
      username:  
      <input type="text" onChange={this.update('username')} value={this.state.username}/>
      </label>
      <br/>
      <br/>
      <label>
      password:   
      <input type="password" onChange={this.update('password')} value={this.state.password}/>
      </label>
      <br/>
      <br/>
      <button onClick={this.handleSubmit}>{this.props.formType}</button>
      </div>
      
    );

  }

}

export default SessionForm;