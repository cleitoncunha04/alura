import { conexaoApi } from "./conexaoAPI.js";
import construirCard from "./mostrarVideos.js";

async function buscarVideo(evento) {
  //evita a página de recarregar
  evento.preventDefault();

  const dadosPesquisa = document.querySelector("[data-pesquisa]").value;
  const videosPesquisados = await conexaoApi.getDados(dadosPesquisa);

  const $ulLista = document.querySelector("[data-lista]");
  // $ulLista.innerHTML = ""; --> possibilidade para limpar a <ul>

  if (videosPesquisados.length === 0) {
    $ulLista.innerHTML = `<h2 class="mensagem__titulo">Não existem vídeos com este termo</h2>`;
  } 
  else {
    //remove todos os filhos da <ul>
    while ($ulLista.firstChild) {
      $ulLista.removeChild($ulLista.firstChild);
    }

    videosPesquisados.forEach((videoP) => {
      $ulLista.appendChild(construirCard(videoP));
    });
  }
}

const $botaoPesquisa = document.querySelector("[data-botao-pesquisa]");

$botaoPesquisa.addEventListener("click", (evento) => {
  buscarVideo(evento);
});
