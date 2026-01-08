import './empty-state.styles.css';

const EmptyState = () => {
    return (
        <div className="empty-state">
            <p className='empty-state__text'>Ainda não tem tarefas cadastradas, adicione para começar!</p>

            <img 
                className='empty-state__icon' 
                src="/empty.svg" 
                alt="Nenhuma tarefa encontrada" 
            />
        </div>
    )
}

export default EmptyState;