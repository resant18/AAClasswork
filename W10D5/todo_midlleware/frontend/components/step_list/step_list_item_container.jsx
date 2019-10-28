import { connect } from 'react-redux'
import { removeStep, receiveStep } from '../../actions/step_actions';

const mapDispatchToProps = (dispatch) => ({
    receiveStep: (step) => dispatch(receiveStep(step)),
    removeStep: (stepId) => dispatch(removeStep(stepId))
})

export default connect(null, mapDispatchToProps)(StepListItem);
