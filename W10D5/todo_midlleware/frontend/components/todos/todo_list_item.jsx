import React from 'react';
import TodoDetailViewContainer from './todo_detail_view_container';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      detail: false
    }

    this.toggleDetail = this.toggleDetail.bind(this);
    this.toggleDone = this.toggleDone.bind(this);
  }

  toggleDetail(e) {
    e.preventDefault();
    this.setState( {detail: !this.state.detail} );
  }

  toggleDone(e) {
    e.preventDefault();
    const toggledTodo = Object.assign({}, this.props.todo, {
      done: !this.props.todo.done
    });

    this.props.receiveTodo(toggledTodo);
  }

  render() {
    const { todo } = this.props;
    const { done } = todo;
    let detailView;
    if (this.state.detail) detailView = <TodoDetailViewContainer todo={todo} />
    return (
      <div>
        <li className="todo-list-item">
          {todo.title} <br/>     
          <button onClick={this.toggleDone}>{done ? "Done" : "Undo"}</button>     
          <button className="show-button" onClick={this.toggleDetail}>{this.state.detail ? "Hide" : "Show"}</button>
          { detailView }
        </li>
      </div>
    )
  }
}

export default TodoListItem;




