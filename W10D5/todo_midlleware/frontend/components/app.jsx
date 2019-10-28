import React from 'react';
import TodoList from './todos/todo_list';
import TodoListContainer from './todos/todo_list_container';

const App = () => {
  return (
    <h1>
      <TodoListContainer />
    </h1>
  );
};

export default App;