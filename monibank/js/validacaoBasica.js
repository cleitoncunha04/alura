import { validaCpf } from "./validaCpf.js";

const $inputNome = document.querySelector("#nome");
$inputNome.setAttribute("required", "true");
$inputNome.setAttribute("minLength", "3");

const $inputEmail = document.querySelector("#email");
$inputEmail.setAttribute("required", "true");
$inputEmail.setAttribute("minLength", "4");

const $inputRg = document.querySelector("#rg");
$inputRg.setAttribute("required", "true");

const $inputCpf = document.querySelector("#cpf");
$inputCpf.setAttribute("required", "true");
$inputCpf.setAttribute("minLength", "14");

//passo o próprio input como parâmetro com o ".target" e dentro da função o ".value" para pegar/alterar o que foi digitado
$inputCpf.addEventListener("input", (evento) =>
  validaCpf.mascaraCpf(evento.target)
);

const $inputDataNasc = document.querySelector("#aniversario");
$inputDataNasc.setAttribute("required", "true");

const $inputTermo = document.querySelector(".termos__input");
$inputTermo.setAttribute("required", "true");
