import React from 'react'
import StepListItemContainer from './step_list_item_container';

const StepList = ({steps, todo_id, receiveStep}) => {
    const stepItems = steps.map(step => {        
        <StepListItemContainer 
            step = {step} />        
    });

    return (
        <div>
            <ul className="step-item">
                { stepItems }
            </ul>
        </div>
    )
}

export default StepList;