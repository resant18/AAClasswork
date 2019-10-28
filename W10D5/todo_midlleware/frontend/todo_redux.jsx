import React from 'react';
import ReactDOM from 'react-dom';

import configureStore from './store/store';
import Root from './components/root';

import { allTodos} from './reducers/selectors';



document.addEventListener( "DOMContentLoaded", () => {  
  const store = configureStore();

  ReactDOM.render( 
    <Root store={store} />, document.getElementById("content")
  );

  window.store = store;
});

