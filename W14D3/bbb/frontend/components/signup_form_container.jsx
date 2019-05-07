import SessionForm from './session_form.jsx';
import { connect } from 'react-redux';
import { signup } from './../actions/session_actions';

const msp = (state, ownProps) => {
  return {
    formType: "Sign-up"
  };
};

const mdp = (dispatch, ownProps) => {

  return {
    processForm: (user) => dispatch(signup(user))
  };

};

export default connect(msp, mdp)(SessionForm);