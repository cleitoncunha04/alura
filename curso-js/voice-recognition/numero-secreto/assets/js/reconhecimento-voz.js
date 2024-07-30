const elementoChute = document.getElementById("chute");

window.SpeechRecognition =
  window.SpeechRecognition || window.webkitSpeechRecognition;

const recognition = new SpeechRecognition();

recognition.lang = "pt-Br";
recognition.start();

function exibeNaTela(chute) {
  elementoChute.innerHTML = `
  <div> Você disse:</div>
  <span class="box">${chute}</span>
  `;
}

recognition.addEventListener("result", (e) => {
  let chute = e.results[0][0].transcript;
  exibeNaTela(chute);
  //remove os pontos
  isNumber(chute.replace(/\./g, ""));
});

recognition.addEventListener('end', () => recognition.start());
