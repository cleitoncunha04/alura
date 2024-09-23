interface Task {
    description: string;
    isCompleted: boolean;
}

interface AplicationStatus {
    tasks: Task[];
    selectedTask: Task | null;
    isEditing: boolean;
}

let initialStatus: AplicationStatus = {
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
    selectedTask: null,
    isEditing: false
};

const selectTask = (status: AplicationStatus, task: Task): AplicationStatus => {
    return {
        ...status,
        selectedTask: task === status.selectedTask ? null : task
    };
};

const addTask = (status: AplicationStatus, task: Task): AplicationStatus => {
    return {
        ...status, // faço uma cópia do objeto antigo
        tasks: [
            ...status.tasks, // modifico as tarefas, adicionando a nova task
            task
        ]
    };
};

const editTask = (status: AplicationStatus, updatedTask: Task): AplicationStatus => {
    return {
        ...status,
        tasks: status.tasks.map(task =>
            task === status.selectedTask ? updatedTask : task
        ),
        selectedTask: null,
        isEditing: false
    };
};

const tooggleVisibilityForm = (form: HTMLFormElement) => {
    form.classList.toggle("hidden");
};

const cleanFields = (textArea: HTMLTextAreaElement) => {
    textArea.value = "";
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

    const selectedTaskLabel = document.querySelector<HTMLLabelElement>('.app__section-active-task-label');

    const deleteCompletedTasksBt = document.querySelector<HTMLButtonElement>('#btn-remover-concluidas');

    const deleteAllTasksBt = document.querySelector<HTMLButtonElement>('#btn-remover-todas');

    const ulTaskElement = document.querySelector<HTMLUListElement>(".app__section-task-list");

    const addTaskBt = document.querySelector<HTMLButtonElement>('.app__button--add-task');

    const addTaskForm = document.querySelector<HTMLFormElement>(".app__form-add-task");

    const taskTextArea = document.querySelector<HTMLTextAreaElement>(".app__form-textarea");

    const cancelAddTaskBt = document.querySelector<HTMLButtonElement>('.app__form-footer__button--cancel');

    const cleanTextAreaBt = document.querySelector<HTMLButtonElement>('.app__form-footer__button--delete');

    deleteCompletedTasksBt!.onclick = () => {
        initialStatus.tasks = initialStatus.tasks.filter((task) => !task.isCompleted);

        updateUI();
    };

    deleteAllTasksBt!.onclick = () => {
        initialStatus.tasks = [];

        updateUI();
    };

    if (!addTaskBt) {
        throw new Error("Unknown element: addTaskBt");
    }

    addTaskBt.onclick = () => {
        tooggleVisibilityForm(addTaskForm!);
    };

    addTaskForm!.onsubmit = (evt) => {
        evt.preventDefault();

        const newTask = {
            description: taskTextArea!.value,
            isCompleted: initialStatus.isEditing ? initialStatus.selectedTask!.isCompleted : false
        };

        if (initialStatus.isEditing && initialStatus.selectedTask) {
            initialStatus = editTask(initialStatus, newTask);
        } else {
            initialStatus = addTask(initialStatus, newTask);
        }

        updateUI();
        taskTextArea!.value = "";
    };

    cancelAddTaskBt!.onclick = () => {
        tooggleVisibilityForm(addTaskForm!);
    };

    cleanTextAreaBt!.onclick = () => {
        cleanFields(taskTextArea!);
    };

    if (ulTaskElement) {
        ulTaskElement.innerHTML = "";
    }

    initialStatus.tasks.forEach(task => {
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

        liTaskElement.addEventListener("click", () => {
            initialStatus = selectTask(initialStatus, task);

            tooggleVisibilityForm(addTaskForm!);

            selectedTaskLabel!.innerHTML = `#Em andamento: ${task.description}`;

            taskTextArea!.value = task.description;

            updateUI();
        });

        if (task === initialStatus.selectedTask) {
            liTaskElement.classList.add('app__section-task-list-item-active');
        }

        svgIcon.addEventListener("click", () => {
            task.isCompleted = !task.isCompleted;

            updateUI();
        });

        editBt.onclick = (evt) => {
            evt.stopPropagation();

            initialStatus = {
                ...initialStatus,
                isEditing: true,
                selectedTask: task
            };

            tooggleVisibilityForm(addTaskForm!);

            selectedTaskLabel!.innerHTML = `#Em andamento: ${task.description}`;

            taskTextArea!.value = task.description;

            updateUI();
        };

        ulTaskElement?.appendChild(liTaskElement);
    });
};

document.addEventListener("TarefaFinalizada", () => {
    if (initialStatus.selectedTask) {
        initialStatus.selectedTask.isCompleted = true;

        updateUI();
    }
});

updateUI();


