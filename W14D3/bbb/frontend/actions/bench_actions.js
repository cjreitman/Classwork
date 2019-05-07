import { fetchBenches, createBench } from './../util/bench_api_util';

export const RECEIVE_BENCHES = "RECEIVE_BENCHES";
export const CREATE_BENCH = "CREATE_BENCH";

const receiveBenches = (benches) => {
  return {type: RECEIVE_BENCHES,
  benches: benches,
  };
};


export const fetchbenches = () => dispatch => {
  return fetchBenches().then( (benches) => dispatch(receiveBenches(benches)));
};

const makeBench = (bench) => {
  return {
    type: CREATE_BENCH,
    bench: bench
  };
};

export const makebench = (bench) => {
  return (dispatch) => {
    return createBench(bench).then((bench) => {
      return dispatch(makeBench(bench));
    });
  };
};
 















