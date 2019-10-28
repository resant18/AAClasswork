import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';

// Redux debugging tool
import { composeWithDevTools } from "redux-devtools-extension";

// The store handles updating state when actions are dispatched and tells the necessary components to re-render.
// Store is an object that responsible for:
// - updating an app's state via its reducer
// - broadcasting the state to an application's view layer via subscription
// - listening for actions that tell it how and when to change the global state of an application.

// const store = () => createStore(rootReducer);

const initialState = {
  todos: {
    1: {
      id: 1,
      title: "take a shower",
      body: "and be clean",
      done: false
    },
    2: {
      id: 2,
      title: "wash car",
      body: "wash car before Monday",
      done: false
    }
  },
  steps: {
    1: {
      // this is the step with id = 1
      id: 1,
      title: "walk to store",
      done: false,
      todo_id: 1
    },
    2: {
      // this is the step with id = 2
      id: 2,
      title: "buy soap",
      done: false,
      todo_id: 1
    },
    3: {
      // this is the step with id = 2
      id: 3,
      title: "get water",
      done: false,
      todo_id: 2
    },
    4: {
      // this is the step with id = 2
      id: 4,
      title: "get sponge",
      done: false,
      todo_id: 2
    }
  }
};

const configureStore = (preloadedState = initialState) => {
  return createStore(
    rootReducer,
    preloadedState,
    composeWithDevTools(applyMiddleware(thunk, logger)) // debugging tool
  );
};

export default configureStore;
