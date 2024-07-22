let livros = [];
const endPointAPI =
  "https://guilhermeonrails.github.io/casadocodigo/livros.json";
const elementoInserirLivros = document.getElementById("livros");

async function getBuscarLivroAPI() {
  const resposta = await fetch(endPointAPI);
  livros = await resposta.json();
  
  let livrosComDesconto = aplicarDesconto(livros);

  exibirLivrosTela(livrosComDesconto);
}

getBuscarLivroAPI();
