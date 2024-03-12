const html = document.querySelector("html");

const imageBanner = document.querySelector(".app__image");

const title = document.querySelector(".app__title");

const displayTimer = document.querySelector("#timer");

const btnFocus = document.querySelector(".app__card-button--foco");

const btnShortRest = document.querySelector(".app__card-button--curto");

const btnLongRest = document.querySelector(".app__card-button--longo");

const buttons = document.querySelectorAll(".app__card-button");

const tglSongFocusInput = document.querySelector("#alternar-musica");

const song = new Audio("./sons/luna-rise-part-one.mp3");
song.loop = true;
song.volume = 0.1;

const startAudio = new Audio("./sons/play.wav");
const pauseAudio = new Audio("./sons/pause.mp3");
const finishAudio = new Audio("./sons/beep.mp3");

const btnTimer = document.querySelector("#start-pause");
const btnTimerText = document.querySelector("#start-pause span");
btnTimerImage = document.querySelector(".app__card-primary-butto-icon");

let timeInSeconds = 1500;
let intervalId = null;

tglSongFocusInput.addEventListener("change", () => {
  if (song.paused) {
    song.play();
  } else {
    song.pause();
  }
});

btnFocus.addEventListener("click", () => {
  timeInSeconds = 1500;
  changeContext("foco");

  btnFocus.classList.add("active");
});

btnShortRest.addEventListener("click", () => {
  timeInSeconds = 300;

  changeContext("descanso-curto");

  btnShortRest.classList.add("active");
});

btnLongRest.addEventListener("click", () => {
  timeInSeconds = 900;

  changeContext("descanso-longo");

  btnLongRest.classList.add("active");
});

function removeFocusOnBtn() {
  buttons.forEach(function (cxt) {
    cxt.classList.remove("active");
  });
}

function changeContext(context) {
  printTimeOnScreen();

  removeFocusOnBtn();

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

const countdown = () => {
  if (timeInSeconds > 0) {
    timeInSeconds--;

    printTimeOnScreen();
  } else {
    finishAudio.play();
    reset();
  }
};

function start() {
  if (intervalId) {
    pauseAudio.play();

    reset();

    return;
  }
  startAudio.play();

  intervalId = setInterval(countdown, 1000);

  btnTimerText.textContent = "Pausar";
  btnTimerImage.setAttribute("src", "./imagens/pause.png");
}

function reset() {
  clearInterval(intervalId);

  intervalId = null;

  btnTimerText.textContent = "Começar";
  btnTimerImage.setAttribute("src", "./imagens/play_arrow.png");
}

btnTimer.addEventListener("click", start);

function printTimeOnScreen() {
  const time = new Date(timeInSeconds * 1000);
  let formatedTime = time.toLocaleTimeString("pt-br", {
    minute: "2-digit",
    second: "2-digit",
  });
  displayTimer.innerHTML = `${formatedTime}`;
}

printTimeOnScreen();
