import './todo-list.style.css'

export function ToDoList ({ children }) {
    return (
        <ul className='todo-list'>
            {children}
        </ul>
    )
}