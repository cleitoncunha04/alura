const elementosBotoes = document.querySelectorAll(".btn");

elementosBotoes.forEach((botao) => {
  botao.addEventListener("click", () => filtrarLivros(botao.value));
});

function filtrarLivros(categoria) {
  if (categoria) {
    let livrosFiltrados =
      categoria == "disponiveis"
        ? livros.filter((livro) => livro.quantidade > 0)
        : livros.filter((livro) => livro.categoria == categoria);

    exibirLivrosTela(livrosFiltrados);
  }
}
