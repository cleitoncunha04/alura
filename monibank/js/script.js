import { validaCpf } from "./validaCpf.js";
import isMaiorIdade from "./validaIdade.js";
import validaIdade from "./validaIdade.js";

const $camposFormulario = document.querySelectorAll("[required]");
const $formulario = document.querySelector("[data-formulario]");

$formulario.addEventListener("submit", (evento) => {
  evento.preventDefault();

  const listaResposta = {
    nome: evento.target.elements["nome"].value,
    email: evento.target.elements["email"].value,
    rg: evento.target.elements["rg"].value,
    cpf: evento.target.elements["cpf"].value,
    aniversario: evento.target.elements["aniversario"].value,
  };

  localStorage.setItem("cadastro", JSON.stringify(listaResposta));

  window.location.href = "./abrir-conta-form-2.html";
});

const tiposErro = [
  "valueMissing",
  "typeMismatch",
  "patternMismatch",
  "tooShort",
  "customError",
];

const mensagens = {
  nome: {
    valueMissing: "O campo de nome não pode estar vazio.",
    patternMismatch: "Por favor, preencha um nome válido.",
    tooShort: "Por favor, preencha um nome válido.",
  },
  email: {
    valueMissing: "O campo de e-mail não pode estar vazio.",
    typeMismatch: "Por favor, preencha um email válido.",
    tooShort: "Por favor, preencha um e-mail válido.",
  },
  rg: {
    valueMissing: "O campo de RG não pode estar vazio.",
    patternMismatch: "Por favor, preencha um RG válido.",
    tooShort: "O campo de RG não tem caractéres suficientes.",
  },
  cpf: {
    valueMissing: "O campo de CPF não pode estar vazio.",
    patternMismatch: "Por favor, preencha um CPF válido.",
    customError: "O CPF digitado não existe.",
    tooShort: "O campo de CPF não tem caractéres suficientes.",
  },
  aniversario: {
    valueMissing: "O campo de data de nascimento não pode estar vazio.",
    customError: "Você deve ser maior que 18 anos para se cadastrar.",
  },
  termos: {
    valueMissing: "Você deve aceitar nossos termos antes de continuar.",
  },
};

function verificaCampo(campo) {
  //informo qualquer coisa para o customValidity para que a mensagem de erro não seja exibida
  campo.setCustomValidity("");

  let mensagem = "";

  if (campo.name == "cpf") {
    if (!validaCpf.isCpf(campo.value)) {
      campo.setCustomValidity("erro-cpf-invalido");
    }
  }

  if (campo.name == "aniversario" && campo.value != "") {
    if (!isMaiorIdade(campo.value)) {
      //aqui era pra a mensagem do erro ser definida (teoricamente), como eu estou usando uma matriz para informar os erros, posso digitar qualquer coisa que o valor não será exibido
      campo.setCustomValidity("erro-menor-idade");
    }
  }

  tiposErro.forEach((erro) => {
    if (campo.validity[erro]) {
      mensagem = mensagens[campo.name][erro];
    }
  });
  //.parentNode -> buscou a classe mais próxima do escopo, nesse caso, o input
  const $mensagemErro = campo.parentNode.querySelector(".mensagem-erro");
  const validadorInput = campo.checkValidity();

  if (!validadorInput) {
    $mensagemErro.textContent = mensagem;
  } else {
    $mensagemErro.textContent = "";
  }
}

$camposFormulario.forEach((campo) => {
  //evento "blur" é quando o input perde o foco
  campo.addEventListener("blur", () => verificaCampo(campo));

  //impede que as mensagens padrão de erros apareçam
  campo.addEventListener("invalid", (evento) => evento.preventDefault());
});
