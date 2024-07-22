const elementoBtnOrdenarPreco = document.querySelector('#btnOrdenarPorPreco');

function ordenarLivroPreco() {
  livrosOrdenados = livros.sort((a, b) => a.preco - b.preco)

  exibirLivrosTela(livrosOrdenados)
}

elementoBtnOrdenarPreco.addEventListener('click', ordenarLivroPreco);