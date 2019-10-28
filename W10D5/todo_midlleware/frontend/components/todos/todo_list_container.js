import { connect } from 'react-redux';
import TodoList from './todo_list';
import { receiveTodo, removeTodo } from '../../actions/todo_actions';
import { allTodos } from '../../reducers/selectors';

// Separate presentational components from their connected counterparts
// Not every component needs to be connected to the store. 
// Generally, you will only want to create containers for the 'big' components 
// in the app that represent sections of a page, 
// and contain smaller purely functional presentational components. 
// These larger container components are responsible 
// for mapping state and dispatch props that can be passed down to all their presentational children.

// It is called every time the store state changes.
// It receives the entire store state, and should return an object of data this component needs.

// Therefore, in this project, only TodoList have container, but not TodoListItem.
const mapStateToProps = (state) => {
  return {
    todos: allTodos(state),
    state
  };
}

const mapDispatchToProps = (dispatch) => {
  return {
    receiveTodo: (todo) => dispatch(receiveTodo(todo)),
    removeTodo: (todo) => dispatch(removeTodo(todo)),
  };
};

// here it's connct the container and component, that is why component will receive the data
export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
