// alert("Olá, mundo!");

function playSound(audioSelector) {
  try {
    document.querySelector(audioSelector).play();
  } catch (error) {
    console.log(error);
  }
}

const keyList = document.querySelectorAll(".tecla");

// let index = 0;

keyList.forEach((key) => {
  const instrument = key.classList[1];

  key.onclick = function () {
    playSound(`#som_${instrument}`);
  };

  //toda função em js oferece o agente causador como parâmetro
  key.onkeydown = function (event) {
    console.log(event.code);

    if (event.code === "Space" || event.code === "Enter") {
      key.classList.add("ativa");
    }
  };

  key.onkeyup = function () {
    key.classList.remove("ativa");
  };
});

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

// for (let index = 0; index < keyList.length; index++) {
//   const key = keyList[index];

//   const instrument = key.classList[1];

//   // string template
//   key.onclick = function () {
//     playSound(`#som_${instrument}`);
//   };

//   key.onkeydown = function () {
//     key.classList.add('ativa');
//   };

//   key.onkeyup = function () {
//     key.classList.remove('ativa');
//   }
// }
