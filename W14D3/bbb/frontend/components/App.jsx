import React from 'react';
import GreetingContainer from './greeting_container';
import { Route, Switch } from 'react-router-dom';
import LoginFormContainer from './login_form_container';
import SignupFormContainer from './signup_form_container';
import BenchIndexContainer from './bench_index_container';

const App = () => (    
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer />
      <BenchIndexContainer />
    </header>

    <Route path="/login" component={LoginFormContainer} />
    <Route path="/signup" component={SignupFormContainer} />
  </div>
);

export default App;