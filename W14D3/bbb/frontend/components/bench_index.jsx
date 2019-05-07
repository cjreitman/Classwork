import React from 'react';

class BenchIndex extends React.Component {

  constructor(props) {
    super(props);
  }

  componentDidMount() {
     this.props.fetchbenches();
  }

  render() {

    return <h1>oiaersntr</h1>
   
    }
};

export default BenchIndex;