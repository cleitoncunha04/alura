const elementosBotoes = document.querySelectorAll(".btn");

function exibirValorTotalLivrosDisponiveisTela(valorTotal) {
  elementoValorTotalLivrosDisponiveis.innerHTML = `
    <div class="livros__disponiveis">
      <p>Todos os livros disponíveis por R$ <span id="valor">${valorTotal.toFixed(2)}</span></p>
    </div>
  `;
}

function filtrarCategoria(categoria) {
  return livros.filter((livro) => livro.categoria == categoria);
}

function filtrarDisponibilidade() {
  return livros.filter((livro) => livro.quantidade > 0);
}

function filtrarLivros(categoria) {
  if (categoria) {
    let livrosFiltrados =
      categoria == "disponiveis"
        ? filtrarDisponibilidade()
        : filtrarCategoria(categoria);

    exibirLivrosTela(livrosFiltrados);

    if (categoria == "disponiveis") {
      const valorTotal = calcularValorTotal(livrosFiltrados);
      
      exibirValorTotalLivrosDisponiveisTela(valorTotal);
    }
  }
}

elementosBotoes.forEach((botao) => {
  botao.addEventListener("click", () => filtrarLivros(botao.value));
});
