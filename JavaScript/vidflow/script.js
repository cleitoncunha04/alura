const containerVideos = document.querySelector(".videos__container");

// fetch() -> faz a busca, que retorna uma promise
// .then() -> função assincrona q tem resposta como um agente causador
const api = fetch("http://localhost:3000/videos")
  .then((resposta) => resposta.json()) // apos a resposta do fetch, o arquivo é convertido em json 
  .then((videos) => videos.forEach((video) => {
    containerVideos.innerHTML += `
      <li class="videos__item"> 
        <iframe src="${video.url}" title="${video.titulo}" frameborder="0" allowfullscreen></iframe>
        <div class="descricao-video">
        <img class="img-canal" src="${video.imagem}" alt="Logo do canal">
        <h3 class="titulo-video">${video.titulo}</h3>
        <p class="titulo-canal">${video.descricao}</p>
        </div>
      </li>
    `;
  })).catch((erro) => {
    containerVideos.innerHTML = `
    <p>Erro ao carregar o vídeo: ${erro}</p>`;
  });
