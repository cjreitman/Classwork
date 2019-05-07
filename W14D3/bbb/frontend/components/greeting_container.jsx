import { connect } from 'react-redux';
import { logout } from './../actions/session_actions';
import Greeting from './greeting';

const msp = (state) => {
  // debugger;
  return {
    currentUser: state.session.currentUser
  };
};

const mdp = (dispatch) => {
  return {
    logout: (id) => dispatch(logout(id))
  };
};

export default connect(msp, mdp)(Greeting);