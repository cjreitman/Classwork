import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import Root from './components/root';
import { fetchBenches, createBench } from './util/bench_api_util';
import { makebench, fetchbenches } from './actions/bench_actions';

window.fetchBenches = fetchBenches;
window.createBench = createBench;
window.makebench = makebench;
window.fetchbenches = fetchbenches;

document.addEventListener('DOMContentLoaded', () => {
  
  const root = document.getElementById("root");
  ReactDOM.render(<Root store={store} />, root);
  window.dispatch = store.dispatch;

});


let store = configureStore();
window.dispatch = store.dispatch;

