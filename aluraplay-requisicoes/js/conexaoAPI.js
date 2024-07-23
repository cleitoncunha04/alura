async function getDados() {
  // requisição GET --> retorna algo
  const conexao = await fetch("http://localhost:3000/videos");
  // preciso esperar a conexao para converter para JSON
  const dados = await conexao.json();

  return dados;
}

async function setDados(titulo, descricao, url, imagem) {
  const conexao = await fetch("http://localhost:3000/videos", {
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

  const dados = await conexao.json();

  return dados;
}

export const conexaoApi = {
  getDados,
  setDados,
};
