import { SubHeading } from '../SubHeading';
import { ToDoList } from '../ToDoList';
import { ToDoItem } from '../ToDoItem';

const TodoGroup = ({ todos, title }) => {
    return (<>
        <SubHeading>{title}</SubHeading>

        <ToDoList>
            {todos.map((t) =>
                <ToDoItem
                    key={t.id}
                    item={t}
                />
            )}
        </ToDoList>
    </>);
}

export default TodoGroup;