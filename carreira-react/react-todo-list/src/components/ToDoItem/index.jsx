import './todo-item.style.css'
import { IconPencil, IconTrash } from "../icons";
import { use } from 'react';
import TodoContext from '../TodoProvider/TodoContext';

export function ToDoItem({ item }) {
    const {
        removeTodo,
        toggleCompleted,
        openDialog
    } = use(TodoContext);

    const styles = ['todo-item']

    if (item.completed) {
        styles.push('completed')
    }

    return (
        <li className={styles.join(' ')}>
            <p className="date">
                {new Date(item.createdAt).toLocaleDateString('pt-BR')}
            </p>
            <div className="details">
                <input
                    id={item.id}
                    type="checkbox"
                    className="checkbox"
                    defaultChecked={item.completed}
                    onChange={() => toggleCompleted(item.id)}
                />
                <p className="description">
                    {item.description}
                </p>
                <div className="actions">
                    <button
                        className="btn"
                        onClick={() => removeTodo(item.id)}
                    >
                        <IconTrash />
                    </button>
                    <button
                        className="btn"
                        onClick={() => openDialog(item)}
                    >
                        <IconPencil />
                    </button>
                </div>
            </div>
        </li>
    )
}