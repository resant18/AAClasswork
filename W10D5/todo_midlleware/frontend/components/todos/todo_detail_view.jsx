import React from 'react';

import StepListContainer from "../step_list/step_list_container";

class TodoDetailView extends React.Component {
  constructor(props) {
      super(props);

      this.removeTodo = this.removeTodo.bind(this);
  }

  handleRemove(e) {
    e.preventDefault();

    this.props.removeTodo(this.props.todo);
  }

  render() {
    const { todo } = this.props;
    return (
      <div>
        <p className="todo-body">{todo.body}</p>
        <StepListContainer todo_id={todo.id} />
        <button className="delete-button" onClick={this.handleRemove}>
          Delete Todo
        </button>
      </div>
    );
  }
}

export default TodoDetailView;