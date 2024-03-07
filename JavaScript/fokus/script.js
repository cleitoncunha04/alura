const html = document.querySelector("html");

const imageBanner = document.querySelector(".app__image");

const title = document.querySelector(".app__title");

const displayTimer = document.querySelector("#timer");

const btnFocus = document.querySelector(".app__card-button--foco");

const btnShortRest = document.querySelector(".app__card-button--curto");

const btnLongRest = document.querySelector(".app__card-button--longo");

const btnTimer = document.querySelector(".app__card-primary-button");

const timers = [1500, 300, 900];

btnFocus.addEventListener("click", () => {
  changeContext("foco");
});

btnShortRest.addEventListener("click", () => {
  changeContext("descanso-curto");
});

btnLongRest.addEventListener("click", () => {
  changeContext("descanso-longo");
});

function changeContext(context) {
  html.setAttribute("data-contexto", context);

  imageBanner.setAttribute("src", `./imagens/${context}.png`);

  switch (context) {
    case "foco":
      // innerHTML é muito útil para criar listas
      title.innerHTML = `Otimize sua produtividade,<br />
        <strong class="app__title-strong">mergulhe no que importa.</strong>`;
      break;
    case "descanso-curto":
      title.innerHTML = `Que tal dar uma respirada?<br />
        <strong class="app__title-strong">Faça uma pausa curta!</strong>`;
      break;

    case "descanso-longo":
      title.innerHTML = `Hora de voltar à superfície.<br />
        <strong class="app__title-strong">Faça uma pausa longa.</strong>`;
      break;
    default:
      break;
  }
}

btnTimer.addEventListener("click", () => {});
