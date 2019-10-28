import React from 'react';
import TodoListItem from './todo_list_item';
import TodoListForm from './todo_form';

// we need object destructuring here because the object that is passed is props.
// Instead of saying props.todos.map(), we can destructure it to make it simple.

const TodoList = ({ todos, receiveTodo }) => {
  return (    
    <div>
      To Do List hereee
      {
        todos.map( (todo, i) => {
          return (
            <ul className="todo-list" key={i}>            
              <TodoListItem 
                todo={todo} 
                receiveTodo={receiveTodo} //this will pass into TodoListItem.jsx to update the Done/Undo button
              />
            </ul>          
          )
        })
      }
      <TodoListForm receiveTodo={receiveTodo} />
    </div>
  )
}

export default TodoList;