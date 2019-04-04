import { createStore, applyMiddleware } from 'redux';
import rootReducer from './../reducers/root_reducer.js'; 
import { myMiddleware } from './../middleware/thunk';

const configureStore = () => { 
  return createStore(rootReducer, {}, applyMiddleware(myMiddleware));
};

export default configureStore;