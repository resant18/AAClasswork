import { connect } from 'react-redux';
import { stepsByTodoId } from '../../reducers/selectors';
import { receiveStep } from '../../actions/step_actions';

// This container is called from Todo Detail View Component
// and passing 
const mapStateToProps = ({steps}, todo_id) => ({
    steps: stepsByTodoId(steps, todo_id),
    todo_id
})


const mapDispatchToProps = (dispatch) => ({
    receiveStep: (step) => dispatch(receiveStep(step))
})

export default connect(mapStateToProps, mapDispatchToProps)(StepList)

