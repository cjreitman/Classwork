import { connect } from 'react-redux';
import BenchIndex from './bench_index';
import { fetchbenches } from './../actions/bench_actions';

const msp = (state) => {
  let benches = Object.values(state.entities.benches);
  return ({
    benches: benches
  });
};

const mdp = (dispatch) => {
  return ({
    fetchbenches: () => dispatch(fetchbenches())
  });
};


export default connect(msp, mdp)(BenchIndex);


