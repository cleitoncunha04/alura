const btnAddTarefa = document.querySelector('.app__button--add-task');
const formAddTarefa = document.querySelector('.app__form-add-task');
const btnCancelarFormaTarefa = document.querySelector('.app__form-footer__button--cancel');
const textArea = document.querySelector('.app__form-textarea');
const btnDeletarTextArea = document.querySelector('.app__form-footer__button--delete');
const ulTarefas = document.querySelector('.app__section-task-list');
const paragrafoDescricaoTarefa = document.querySelector('.app__section-active-task-description');

const btnRemoverConcluidas = document.querySelector('#btn-remover-concluidas');
const btnRemoverTodas = document.querySelector('#btn-remover-todas');

//converte as tarefas (Strings) em um objeto
let tarefas = JSON.parse(localStorage.getItem('tarefas')) || [];
let tarefaSelecionada = null;
let liTarefaSelecionada = null;

function atualizarTarefas() {
  //converte o objeto tarefas em uma string com a API do JSON
  localStorage.setItem('tarefas', JSON.stringify(tarefas));
}

function editarTarefa(button, p, tarefa) {
  button.onclick = () => {
    //armazena a resposta do prompt
    // debugger --> debugar no console
    const novaDescricao = prompt("Qual é o novo nome da tarefa?");
    if(novaDescricao) {
      p.textContent = novaDescricao;
      tarefa.descricao = novaDescricao;
      atualizarTarefas();
    }
    else {
      alert('Informe uma descrição válida para a tarefa...')
    }
  };
}

function criarElementoTarefa(tarefa) {
  const li = document.createElement('li');
  li.classList.add('app__section-task-list-item');

  const svg = document.createElement('svg');
  svg.innerHTML = `
          <svg class="app__section-task-icon-status" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <circle cx="12" cy="12" r="12" fill="#FFF"></circle>
            <path d="M9 16.1719L19.5938 5.57812L21 6.98438L9 18.9844L3.42188 13.4062L4.82812 12L9 16.1719Z" fill="#01080E"></path>
        </svg>`;

  const p = document.createElement('p');
  p.classList.add('app__section-task-list-item-description')
  p.textContent = tarefa.descricao;

  const button = document.createElement('button');
  button.classList.add('app_button-edit');
  //edição da tarefa
  editarTarefa(button, p, tarefa);
  
  const imgButton = document.createElement('img');
  imgButton.setAttribute('src', './imagens/edit.png');

  button.append(imgButton);

  li.append(svg);
  li.append(p);
  li.append(button);

  if(tarefa.completa) {
    li.classList.add('app__section-task-list-item-complete');

    button.setAttribute('disabled', 'disabled');
  }
  else {
    li.onclick = () => {
      document.querySelectorAll('.app__section-task-list-item-active').forEach(element => {
        element.classList.remove('app__section-task-list-item-active')
      });;
      
      if(tarefaSelecionada == tarefa) {
        paragrafoDescricaoTarefa.textContent = '';
        
        tarefaSelecionada = null;
        liTarefaSelecionada = null;
  
        return
      }
      else {
        tarefaSelecionada = tarefa;
        liTarefaSelecionada = li;
  
        paragrafoDescricaoTarefa.textContent = tarefa.descricao;
  
        li.classList.add('app__section-task-list-item-active');
      }
    };
  }


  return li;
}

function addTarefaLista(tarefa) {
  ulTarefas.append(criarElementoTarefa(tarefa));
}

btnAddTarefa.addEventListener('click', () => {
  formAddTarefa.classList.toggle('hidden');
});

function fecharFormAddTarefa() {
  textArea.value = '';
  formAddTarefa.classList.add('hidden');
}

formAddTarefa.addEventListener('submit', (event) => {
  event.preventDefault();

  const tarefa = {
    descricao: textArea.value
  };
  tarefas.push(tarefa);
  
  addTarefaLista(tarefa);

  atualizarTarefas();

  fecharFormAddTarefa();
});


//imprime na tela a lista de tarefas da localStorage
tarefas.forEach(tarefa => {
  addTarefaLista(tarefa);
});

btnCancelarFormaTarefa.addEventListener('click', () => {
  fecharFormAddTarefa();
});

btnDeletarTextArea.addEventListener('click', () => {
  textArea.value = '';
});

document.addEventListener('FocoFinalizado', () => {
  if(tarefaSelecionada && liTarefaSelecionada) {
    liTarefaSelecionada.classList.remove('app__section-task-list-item-active');
    
    liTarefaSelecionada.classList.add('app__section-task-list-item-complete');

    liTarefaSelecionada.querySelector('button').setAttribute('disabled', 'disabled');

    tarefaSelecionada.completa = true
    atualizarTarefas()
  }
});

function removerTarefas(somenteCompletas) {
  const seletor = somenteCompletas ? '.app__section-task-list-item-complete' : '.app__section-task-list-item'
  
  document.querySelectorAll(seletor).forEach(element => {
    element.remove();
  });

  tarefas =  somenteCompletas ? 
            tarefas.filter(tarefa => !tarefa.completa) :
            [];

  atualizarTarefas();
}

btnRemoverConcluidas.addEventListener('click', () => {
  removerTarefas(true);
});


btnRemoverTodas.addEventListener('click', () => {
  removerTarefas(false);
});
