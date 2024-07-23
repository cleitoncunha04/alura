async function getDados() {
  // requisição GET --> retorna algo
  const conexao = await fetch("http://localhost:3000/videos");
  // preciso esperar a conexao para converter para JSON
  const dados = conexao.json();
  
  return dados;
}

export const conexaoApi = {
  getDados,
};
