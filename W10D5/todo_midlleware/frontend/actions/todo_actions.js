// These are functions that will create (return) the Redux actions object
// that will later tell todosReducer how to update the state. 
// These returned action objects are passed through our rootReducer 
// only when store.dispatch(action) is called.

export const RECEIVE_TODO = "RECEIVE_TODO";
export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const REMOVE_TODO = "REMOVE_TODO";


export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo // same as: todo: todo
});

export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos
});

export const removeTodo = (todo) => ({
  type: REMOVE_TODO,
  todo
});

window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;