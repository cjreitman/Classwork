import SessionForm from './session_form.jsx';
import { connect } from 'react-redux';
import { login } from './../actions/session_actions';

const msp = (state, ownProps) => {
  // debugger;
  return {
    formType: "Login"
  };
};

const mdp = (dispatch, ownProps) => {

  return {
    processForm: (user) => dispatch(login(user))
  };

};

export default connect(msp, mdp)(SessionForm);