// alert("Olá, mundo!");

function playSound(idAudioElement) {
  document.querySelector(idAudioElement).play();
}

const keyList = document.querySelectorAll(".tecla");

// let index = 0;

// keyList.forEach((key) => {
//   const instrument = key.classList[1];

//   key.onclick = function () {
//     playSound(`#som_${instrument}`);
//   };
// });

// while (index < keyList.length) {
//   const key = keyList[index];

//   const instrument = key.classList[1];

//   // string template
//   key.onclick = function () {
//     playSound(`#som_${instrument}`);
//   };

//   index = index + 1;

//   // console.log(index);
// }

for (let index = 0; index < keyList.length; index++) {
  const key = keyList[index];

  const instrument = key.classList[1];

  // string template
  key.onclick = function () {
    playSound(`#som_${instrument}`);
  };
}

