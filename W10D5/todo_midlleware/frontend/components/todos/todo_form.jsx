import React from 'react';

class TodoForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = { 
            title: "",
            body: ""
        }

        this.handleSubmit = this.handleSubmit.bind(this);
        this.update = this.update.bind(this);
    }

    update(input) {        
        return e => this.setState({[input]: e.target.value });
    }

    handleSubmit(e) {
        e.preventDefault();
        
        // we need to copy the state because we need to intercept the id and later is combined with this.state
        const todo = Object.assign({}, this.state, { id: new Date().getTime() })
        this.props.receiveTodo(todo);
        this.setState( {
            title: "",
            body: ""
        })
    }

    render() {
        return (
            <div>
                <form className="form todo" onSubmit={this.handleSubmit} >                    
                    <label htmlFor="todo-title">Title
                        <input type="text" id="todo-title" value={this.state.title} onChange={this.update("title")} />
                    </label> <br/>
                    <label htmlFor="todo-body">Body
                        <textarea id="todo-body" cols="30" rows="10" value={this.state.body} onChange={this.update("body")} />                        
                    </label> <br/>
                    <button className="submit-button">Create Todo!</button>                    
                </form>
            </div>
        )
    }
}

export default TodoForm;