const urlEndPointApi = "http://localhost:3000/videos";

async function getDados(termoBusca) {
  // requisição GET --> retorna algo
  const conexao = termoBusca
    ? await fetch(`${urlEndPointApi}?q=${termoBusca}`) 
    : await fetch(urlEndPointApi);
  // preciso esperar a conexao para converter para JSON
  const dados = await conexao.json();

  return dados;
}

async function setDados(titulo, descricao, url, imagem) {
  const conexao = await fetch(urlEndPointApi, {
    method: "POST",
    headers: {
      //especifica o tipo de arquivo (enviado/recebido)
      "Content-type": "application/json",
    },
    //corpo da requisição --> stringify transforma tudo numa String
    body: JSON.stringify({
      titulo: titulo,
      descricao: `${descricao} mil visualizações`,
      url: url,
      imagem: imagem,
    }),
  });

  if(!conexao.ok) {
    throw new Error("Não foi possível enviar o vídeo...");
  }

  const dados = await conexao.json();

  return dados;
}

// async function searchDados(termoBusca) {
//   const conexao = await fetch(`${urlEndPointApi}?q=${termoBusca}`);
//   dados = await conexao.json();

//   return dados;
// }

export const conexaoApi = {
  getDados,
  setDados,
};
