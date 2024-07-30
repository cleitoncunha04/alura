// "conexaoApi" é apenas um alias para usar as funções do arquivo "conexaoAPI.js"
import { conexaoApi } from "./conexaoAPI.js";

const $ulLista = document.querySelector("[data-lista]");

export default function construirCard(video) {
  const $liVideo = document.createElement("li");
  $liVideo.className = "videos__item";

  $liVideo.innerHTML = `
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

  return $liVideo;
}

async function listarVideos() {
  try {
    const videos = await conexaoApi.getDados();
  
    videos.forEach((video) => {
      $ulLista.appendChild(construirCard(video));
    });
  } catch (error) {
    $ulLista.innerHTML = `<h2 class="mensagem__titulo">Não foi possível carregar a lista de vídeos: ${error}</h2>`;
  }
}

listarVideos();
