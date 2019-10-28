import React from 'react';
import { StepListItemContainer } from './step_list_item_container';

export default class StepListItem extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            done: false
        }

        this.handleRemove = this.handleRemove.bind(this);
    }

    handleRemove(e) {
        e.preventDefault();

        
    }

    render() {
        return (
            <div>
                {step.title} <br />                
                <button onClick={this.toggleDone}>{this.state.done ? "Undo" : "Done"}</button>
                <button onClick={this.handleRemove}>Delete</button>
            </div>
        )
    }
}

export default StepListItem;