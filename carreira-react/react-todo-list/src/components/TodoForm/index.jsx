import './todo-form.style.css';
import Input from '../Input';
import Button from '../Button';

const TodoForm = ({ children, defaultValue, ...rest }) => {
    return (
        <form
            className="todo-form"
            {...rest}
        >
            <Input
                name='description'
                type='text'
                placeholder='Digite o item que deseja adicionar...'
                autoComplete='off'
                defaultValue={defaultValue}
                required
            />
            <Button>
                Salvar item
            </Button>
        </form>
    );
}

export default TodoForm;