interface Task
{
    description: string;
    isCompleted: boolean;
}

interface AplicationStatus
{
    tasks: Task[];
    selectedTask: Task | null;
}

let inicialStatus: AplicationStatus = {
    tasks: [
        {
            description: 'Tarefa concluída',
            isCompleted: true
        },
        {
            description: 'Tarefa pendente 1',
            isCompleted: false
        },
        {
            description: 'Tarefa pendente 2',
            isCompleted: false
        }
    ],
    selectedTask: null
}

const selectTask = (status: AplicationStatus, task: Task): AplicationStatus => {
    return {
        ...status,
        selectedTask: task === status.selectedTask ? null : task
    };
};