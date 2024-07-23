import { conexaoApi } from "./conexaoAPI.js";

const $formulario = document.querySelector("[data-formulario]");

function tratarUrlVideo(url) {
  if(!url.includes("youtube.com/embed")) {
    url = url.replace("https://youtu.be/", "https://www.youtube.com/embed/");
  }

  return url;
}

async function criarVideo(evento) {
  //evita a ação de recarregar a página
  evento.preventDefault();

  const titulo = document.querySelector("[data-titulo]").value;
  const descricao = Math.floor(Math.random() * 10 + 1).toString();
  
  let url = document.querySelector("[data-url]").value;
  url = tratarUrlVideo(url);

  const imagem = document.querySelector("[data-imagem]").value;

  await conexaoApi.setDados(titulo, descricao, url, imagem);

  window.location.href = "./envio-concluido.html";
}

$formulario.addEventListener("submit", (evento) => criarVideo(evento));
