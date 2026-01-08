import TodoContext from "./TodoContext";
import { use, useEffect, useState } from "react";
import { v4 as uuidv4 } from 'uuid';

const TODOS_KEY = 'todos';

const DESCRIPTION_KEY = 'description';

const TodoProvider = ({ children }) => {
    const storedTodos = localStorage.getItem(TODOS_KEY);

    const [todos, setTodos] = useState(storedTodos ? JSON.parse(storedTodos) : []);

    useEffect(() => {
        localStorage.setItem(TODOS_KEY, JSON.stringify(todos));
    }, [todos]);

    const [selectedTodo, setSelectedTodo] = useState(null);

    const clearSelectedTodo = () => setSelectedTodo(null);

    const [showDialog, setShowDialog] = useState(false);

    const openDialog = (todo) => {
        if (todo) {
            setSelectedTodo(todo);
        }

        setShowDialog(true);
    }

    const closeDialog = () => {
        setShowDialog(false);
        
        clearSelectedTodo();
    }

    const addTodo = (formData) => {

        const description = formData.get(DESCRIPTION_KEY);

        setTodos((prevTodos) => [...prevTodos, {
            id: uuidv4(),
            description,
            completed: false,
            createdAt: new Date().toISOString(),
        }]
        );

        formData.delete(DESCRIPTION_KEY);
    }

    const removeTodo = (id) => {
        setTodos((prevTodos) =>
            prevTodos.filter(todo => todo.id !== id)
        );
    }

    const toggleCompleted = (id) => {
        setTodos((prevTodos) =>
            prevTodos.map((t) => {
                if (t.id === id) {
                    return {
                        ...t,
                        completed: !t.completed
                    }
                }
                return t;
            })
        );
    }

    const updateTodo = (formData) => {
        const description = formData.get(DESCRIPTION_KEY);

        setTodos((prevTodos) =>
            prevTodos.map((t) => {
                if (t.id === selectedTodo.id) {
                    return {
                        ...t,
                        description
                    }
                }
                return t;
            })
        );

        formData.delete(DESCRIPTION_KEY);
    }


    return <TodoContext value={{ todos, showDialog, openDialog, closeDialog, selectedTodo, addTodo, removeTodo, toggleCompleted, updateTodo }}>
        {children}</TodoContext>
};

export default TodoProvider;