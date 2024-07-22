let livros = [];
const endPointAPI =
  "https://guilhermeonrails.github.io/casadocodigo/livros.json";
const elementoInserirLivros = document.getElementById("livros");

function exibirLivrosTela(livros) {
  livros.forEach(livro => {
    elementoInserirLivros.innerHTML += `
      <div class="livro">
      <img class="livro__imagens" src="${livro.imagem}" alt="${livro.alt}" />
      <h2 class="livro__titulo">
        ${livro.titulo}
      </h2>
      <p class="livro__descricao">${livro.autor}</p>
      <p class="livro__preco" id="preco">R$${livro.preco}</p>
      <div class="tags">
        <span class="tag">${livro.categoria}</span>
      </div>
    </div>
    `;
  });
}

async function getBuscarLivroAPI() {
  const resposta = await fetch(endPointAPI);
  livros = await resposta.json();
  console.table(livros);

  exibirLivrosTela(livros);
}

getBuscarLivroAPI();
