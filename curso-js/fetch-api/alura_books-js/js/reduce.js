function calcularValorTotal(livros) {
  return livros.reduce((accumulator, livro) => accumulator + livro.preco, 0);
}