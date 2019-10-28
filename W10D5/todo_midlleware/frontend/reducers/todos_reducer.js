import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO } from "../actions/todo_actions";

// const initialState = {
//   1: {
//     id: 1,
//     title: "wash car",
//     body: "with soap",
//     done: false
//   },
//   2: {
//     id: 2,
//     title: "wash dog",
//     body: "with shampoo",
//     done: true
//   }
// };

// It's a function that return new state
// appropriately based on the action.type
export const todosReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = Object.assign({}, state);
  
  switch (action.type) {
    case RECEIVE_TODO:
      nextState[action.todo.id] = action.todo;
      return nextState;
    case RECEIVE_TODOS:
      action.todos.forEach( (todo) => { nextState[todo.id] = todo; } );
      return nextState;
    case REMOVE_TODO:      
      delete nextState[action.todo.id];
      return nextState;
    default:
      return state;
  }
};

// For testing:
// window.todosReducer = todosReducer;

// store.dispatch(
//   receiveTodo({
//     id: 3,
//     title: "wash hand",
//     body: "with water",
//     done: false,
//   })
// );

// {
//   {
//     id: 1,
//       title: "wash car",
//         body: "with soap",
//           done: false
//   },
//   {
//     id: 2,
//       title: "wash dog",
//         body: "with shampoo",
//           done: true
//   },
//   {
//     body: "with water",
//       done: false,
//         id: 3,
//           title: "wash hand",    
//   }
// }

// store.dispatch(receiveTodos(
//   [
//     {
//       id: 1,
//       title: "wash car",
//       body: "with soap",
//       done: false
//     },
//     {
//       id: 2,
//       title: "wash dog",
//       body: "with shampoo",
//       done: true
//     },
//     {
//       body: "with water",
//       done: false,
//       id: 3,
//       title: "wash hand",
//     }
//   ]
// ));
