function aplicarDesconto(livros) {
  const desconto = 0.3;
  
  let livroComDesconto = livros.map(
    (livro) => {
      //cria e retorna uma cópia do array, substituindo a propriede "preco"
      return {...livro, preco: livro.preco * (1 - desconto)}
    });

    return livroComDesconto;
}
