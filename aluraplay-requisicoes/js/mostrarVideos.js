import { conexaoApi } from "./conexaoAPI.js";

const $lista = document.querySelector("[data-lista]");

function construirCard(video) {
  const $video = document.createElement("li");
  $video.className = "videos__item";

  $video.innerHTML = `
    <iframe width="100%" height="72%" src="${video.url}"
      title="${video.titulo}" frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
      allowfullscreen>
    </iframe>

    <div class="descricao-video">
        <img src="${video.imagem}" alt="logo canal alura">
        <h3>${video.titulo}</h3>
        <p>${video.descricao}</p>
    </div>
  `;

  return $video;
}

async function listarVideos() {
  const videos = await conexaoApi.getDados();

  videos.forEach((video) => {
    $lista.appendChild(construirCard(video));
  });
}

listarVideos();
