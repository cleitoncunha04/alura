function isNumber(chute) {
  const numero = +chute;

  if (Number.isNaN(numero)) {
    elementoChute.innerHTML += "<span>Valor inválido</span>";
  } else {
    if (isNoIntervalo(numero)) {
      elementoChute.innerHTML += `
    <span>
      Valor inválido: o número precisa estar entre 
      <strong>${menorValor}</strong> e <strong>${maiorValor}</strong>
    </span>
    `;
    } else {
      if (numero === numeroSecreto) {
        document.body.innerHTML = `
        <h1>Parabéns, você acertou!!!</h1>
        <h2>O número secreto era: <strong>${numeroSecreto}<strong></h2>
        <input type="submit" id="jogar-novamente" class="btn" value="Jogar Novamente">
      `;
      } else if (numero < numeroSecreto) {
        elementoChute.innerHTML += `
      <span>O número secreto é maior <i class="fa-solid fa-arrow-up"></i></span>
      `;
      } else {
        elementoChute.innerHTML += `
      <span>O número secreto é menor <i class="fa-solid fa-arrow-down"></i></span>
      `;
      }
    }
  }
}

function isNoIntervalo(numero) {
  return numero > maiorValor || numero < menorValor;
}

document.body.addEventListener("click", (evt) => {
  if (evt.target.id == "jogar-novamente") {
    window.location.reload();
  }
});
