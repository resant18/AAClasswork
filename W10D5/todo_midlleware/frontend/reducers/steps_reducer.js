import { RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP } from '../actions/step_actions';

// const initialState = {
//   1: {    
//     todo_id: 1,
//     title: "get water",    
//     done: true
//   },
//   2: {    
//     todo_id: 1,
//     title: "get soap",    
//     done: false
//   }
// };

export const stepsReducer = (state =  {} , action) => {
    Object.freeze(state);
    // let nextState = Object.assign({}, state);

    switch (action.type) {
        case RECEIVE_STEP:            
            nextState = {[action.step.id]: action.step};
            return {...state, ...nextState};
            // same as:
            // nextState[action.step.id] = action.step;
            // return nextState;            
        case RECEIVE_STEPS:
            action.steps.forEach(step => nextState[step.id] = step );            
            return {...state, ...nextState};
        case REMOVE_STEP:
            nextState = {...state};
            delete nextState[action.step.id];
            return nextState;
        default:
            return state;
    }
}

window.stepsReducer = stepsReducer;

// store.dispatch(
//   receiveStep({
//     3 : {
//       todo_id: 1,  
//       title: "get sponge",    
//       done: false,
//     }
//   })
// );

// store.dispatch(
//   receiveSteps({
//     1: {
//       todo_id: 1,
//       title: "get sponge",    
//       done: false,
//     },
//     4: {
//       todo_id: 3,
//       title: "get hose",    
//       done: false,
//     }
//   })
// );

// Sample State Shape
// {
//   1: {
//     title: "walk to store",
//     done: false,
//     todo_id: 1
//   },
//   2: {
//     title: "buy soap",
//     done: false,
//     todo_id: 1
//   },
//   3: {
//     title: "walk to park",
//     done: false,
//     todo_id: 3
//   },
//   4: {
//     title: "play with dog",
//     done: false,
//     todo_id: 2
//   }
// };