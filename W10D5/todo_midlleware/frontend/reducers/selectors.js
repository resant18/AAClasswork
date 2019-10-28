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

export const allTodos = ( {todos} ) => {
  // return Object.keys(todos).map(id => todos[id]);    
  // same as:
  return Object.values(todos).map(todo => todo);    
};

export const stepsByTodoId = ({ steps }, todoId) => {
  const stepsByTodoId = [];
  Object.keys(steps).forEach(stepId => {
    if (steps[stepId].todo_id === todoId) stepsByTodoId.push(steps[stepId]);
  })
  return stepsByTodoId;
}

