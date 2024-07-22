const elementosBotoes = document.querySelectorAll(".btn");

elementosBotoes.forEach((botao) => {
  botao.addEventListener("click", () => filtrarLivros(botao.value));
});

function filtrarLivros(categoria) {
  if(categoria) {
    let livrosFiltrados = livros.filter((livro) => livro.categoria == categoria);
  
    exibirLivrosTela(livrosFiltrados);
  }
}
