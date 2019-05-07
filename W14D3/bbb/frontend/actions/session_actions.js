import { logIn, logOut, signUp } from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

const receiveCurrentUser = (currentUser) => {
  return {
  type: RECEIVE_CURRENT_USER,
  currentUser: currentUser
  };
};

const logoutCurrentUser = () => {
  
  return {
    type: LOGOUT_CURRENT_USER
  };
};

const receiveErrors = (errors) => {
  return {
    type: RECEIVE_ERRORS,
    errors: errors
  };
};

export const login = (user) => { 
  return (dispatch) => {
    return logIn(user).then((user) => { 
      return dispatch(receiveCurrentUser(user));
    });
  };
};

export const logout = (id) => {
  return (dispatch) => {
    return logOut(id).then(() => {
      return dispatch(logoutCurrentUser());
    });
  };
};

export const signup = (user) => (dispatch) => {
  return signUp(user).then(() => dispatch(receiveCurrentUser()));
};





