import { RECEIVE_CURRENT_USER, RECEIVE_ERRORS } from './../actions/session_actions';
import { merge } from 'lodash'; 

export default (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return merge({}, state, { errors: null });
    case RECEIVE_ERRORS:
      return merge({}, state, { errors: action.errors });
    default:
      return state;
  }
};