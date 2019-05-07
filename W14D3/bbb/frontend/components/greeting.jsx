import React from 'react';
import { Link } from 'react-router-dom';

class Greeting extends React.Component {

  constructor(props) {
    super(props);
    this.logOut = this.logOut.bind(this);
  }

  logOut() {

    this.props.logout(this.props.currentUser.id);
  }

  render() {
    
    if (!this.props.currentUser) {
      return <div> <Link to="/signup">Sign Up</Link>  <Link to="/login">Login</Link>  </div> 
    }

    return (
      <div>
        <h1>hello, {this.props.currentUser.username}</h1> 
        <button onClick={this.logOut}>Log Out</button>
      </div>
    )
  }
}

export default Greeting;