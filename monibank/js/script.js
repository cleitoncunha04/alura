import { validaCpf } from "./validaCpf.js";
import isMaiorIdade from "./validaIdade.js";
import validaIdade from "./validaIdade.js";

const $camposFormulario = document.querySelectorAll("[required]");

function verificaCampo(campo) {
  let isValido = false;

  switch (campo.name) {
    case "cpf":
      isValido = validaCpf.isCpf(campo.value);
      console.log(isValido);
      break;
    case "aniversario":
      isValido = isMaiorIdade(campo.value);
      console.log(isValido);
      break;
    default:
      break;
  }
}

$camposFormulario.forEach((campo) => {
  //evento "blur" é quando o input perde o foco
  campo.addEventListener("blur", () => verificaCampo(campo));
});
