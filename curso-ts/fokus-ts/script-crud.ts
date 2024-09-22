interface Task {
    description: string;
    isCompleted: boolean;
}

interface AplicationStatus {
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


const updateUI = () => {
    const taskIconSvg = `
        <svg class="app__section-task-icon-status" width="24" height="24" viewBox="0 0 24 24"
            fill="none" xmlns="http://www.w3.org/2000/svg">
            <circle cx="12" cy="12" r="12" fill="#FFF" />
            <path
                d="M9 16.1719L19.5938 5.57812L21 6.98438L9 18.9844L3.42188 13.4062L4.82812 12L9 16.1719Z"
                fill="#01080E" />
        </svg>
    `;

    const ulTaskElement = document.querySelector(".app__section-task-list") as HTMLUListElement;

    const addTaskBt = document.querySelector<HTMLButtonElement>('.app__button--add-task');

    addTaskBt.onclick

    if (ulTaskElement) {
        ulTaskElement.innerHTML = "";
    }

    inicialStatus.tasks.forEach(task => {
        const liTaskElement = document.createElement('li');
        liTaskElement.classList.add('app__section-task-list-item');

        const svgIcon = document.createElement('svg');
        svgIcon.innerHTML = taskIconSvg;

        const descriptionParagraph = document.createElement('p');
        descriptionParagraph.classList.add('app__section-task-list-item-description');
        descriptionParagraph.textContent = task.description;

        const editBt = document.createElement('button');
        editBt.classList.add('app_button-edit');

        const editIcon = document.createElement('img');
        editIcon.setAttribute('src', '/imagens/edit.png');

        editBt.appendChild(editIcon);

        if (task.isCompleted) {
            editBt.setAttribute('disabled', 'true');

            liTaskElement.classList.add('app__section-task-list-item-complete');
        }

        liTaskElement.appendChild(svgIcon);

        liTaskElement.appendChild(descriptionParagraph);

        liTaskElement.appendChild(editBt);

        ulTaskElement?.appendChild(liTaskElement);
    });
};
