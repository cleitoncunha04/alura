const elementoInserirLivros = document.getElementById("livros");
const elementoValorTotalLivrosDisponiveis = document.getElementById('valor_total_livros_disponiveis');

function exibirLivrosTela(livros) {
  elementoInserirLivros.innerHTML = "";
  elementoValorTotalLivrosDisponiveis.innerHTML = "";
  
  livros.forEach((livro) => {
    elementoInserirLivros.innerHTML += `
      <div class="livro">
      <img class="${
        livro.quantidade < 1 ? "livro__imagens indisponivel" : "livro__imagens"
      }" 
        src="${livro.imagem}" alt="${livro.alt}" />
      <h2 class="livro__titulo">
        ${livro.titulo}
      </h2>
      <p class="livro__descricao">${livro.autor}</p>
      <p class="livro__preco" id="preco">R$${livro.preco.toFixed(2)}</p>
      <div class="tags">
        <span class="tag">${livro.categoria}</span>
      </div>
    </div>
    `;
  });
}
