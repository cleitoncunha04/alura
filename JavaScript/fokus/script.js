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
  html.setAttribute("data-contexto", "foco");

  imageBanner.setAttribute("src", "./imagens/foco.png");
});

btnShortRest.addEventListener("click", () => {
  html.setAttribute("data-contexto", "descanso-curto");

  imageBanner.setAttribute("src", "./imagens/descanso-curto.png");

});

btnLongRest.addEventListener("click", () => {
  html.setAttribute("data-contexto", "descanso-longo");

  imageBanner.setAttribute("src", "./imagens/descanso-longo.png");

});

btnTimer.addEventListener("click", () => {});
