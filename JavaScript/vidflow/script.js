const containerVideos = document.querySelector(".videos__container");

async function mostrarVideos(videos) {
  videos.forEach((video) => {
    containerVideos.innerHTML += `
      <li class="videos__item"> 
        <iframe src="${video.url}" title="${video.titulo}" frameborder="0" allowfullscreen></iframe>
        <div class="descricao-video">
          <img class="img-canal" src="${video.imagem}" alt="Logo do canal">
          <h3 class="titulo-video">${video.titulo}</h3>
          <p class="titulo-canal">${video.descricao}</p>
          <p class="categoria" hidden>${video.categoria}</p>
        </div>
      </li>
    `;
  });
}

async function buscarVideos() {
  try {
    // fetch() -> faz a busca, que retorna uma promise
    // .then() -> função assincrona q tem resposta como um agente causador
    const busca = await fetch("http://localhost:3000/videos");

    const videos = await busca.json();

    mostrarVideos(videos);
  } catch (error) {
    containerVideos.innerHTML = `
    <p>Erro ao carregar os vídeos: ${error}</p>`;
  } /*finally {
    sempre vai acontecer
  }*/
}

buscarVideos();

const barraPesquisa = document.querySelector(".pesquisar__input");

function filtrarPesquisa() {
  const videos = document.querySelectorAll(".videos__item");
  let valorPesquisado = barraPesquisa.value.toLowerCase();

  videos.forEach((video) => {
    let titulo = video.querySelector(".titulo-video").textContent.toLowerCase();

    video.style.display = valorPesquisado
      ? titulo.includes(valorPesquisado)
        ? "block"
        : "none"
      : "block";
  });
}

barraPesquisa.addEventListener("input", filtrarPesquisa);

const botoesCategoria = document.querySelectorAll(".superior__item");

function filtrarPorCategoria(filtro) {
  const videos = document.querySelectorAll(".videos__item");

  videos.forEach((video) => {
    let categoria = video.querySelector(".categoria").textContent.toLowerCase();
    let valorFiltro = filtro.toLowerCase();

    video.style.display =
      !categoria.includes(valorFiltro) && valorFiltro != "tudo"
        ? "none"
        : "block";
  });
}

botoesCategoria.forEach((botao) => {
  let nomeCategoria = botao.getAttribute("name");

  botao.addEventListener("click", () => filtrarPorCategoria(nomeCategoria));
});
