# Classe **`Buscador`**

A classe **`Buscador`** é responsável por realizar buscas de conteúdo em uma página web, utilizando um cliente HTTP e um parser HTML. O foco principal é extrair uma lista de cursos a partir de uma URL fornecida.

## Propriedades

- **`ClientInterface $httpClient`**: Cliente HTTP utilizado para realizar a requisição à URL fornecida.
- **`Crawler $crawler`**: Objeto responsável por manipular e filtrar o conteúdo HTML retornado pela requisição.

## Construtor

**PHP**

```php
public function __construct(
    public readonly ClientInterface $httpClient,
    public readonly Crawler $crawler
)
```

O construtor da classe **`Buscador`** utiliza a técnica de *constructor property promotion*, que simplifica a declaração de propriedades diretamente no construtor. Ele recebe as instâncias de **`ClientInterface`** e **`Crawler`**, que são armazenadas como propriedades somente leitura (*readonly*).

## Métodos

### **`buscarConteudo(string $url): array`**

```php
public function buscarConteudo(string $url): array
{
    $cursos = [];

    try {
        $resposta = $this->httpClient->request('GET', $url);

        $html = $resposta->getBody();

        $this->crawler->addHtmlContent($html, 'UTF-8');

        //gerei uma lista de cursos pesquisando pelo seletor CSS
        $elementosCursos = $this->crawler->filter('span.card-curso__nome');

        //a lista retornou um "DOM", então fiz um foreach para pegar os textContent's (títulos dos cursos)
        foreach ($elementosCursos as $elemento) {
            $cursos[] = $elemento->textContent;
        }
    } catch (GuzzleException $e) {
        $cursos[] = "Ocorreu um erro ao buscar o curso: " . $e->getMessage();
    }

    if (count($cursos) == 0) {
        $cursos[] = "Nenhum curso encontrado";
    }

    return $cursos;
}
```

Este método realiza a busca de conteúdo na URL fornecida e retorna uma lista de títulos de cursos encontrados.

**Parâmetros:**

- **`string $url`**: A URL da página onde os cursos serão buscados.

**Retorno:**

- **`array`**: Retorna um array contendo os títulos dos cursos encontrados ou mensagens de erro.

**Funcionamento:**

1. **Requisição HTTP**: O método faz uma requisição GET à URL fornecida usando o cliente HTTP (**`$httpClient`**).
2. **Processamento do HTML**: O conteúdo HTML da página é extraído da resposta e adicionado ao **`Crawler`** para ser processado.
3. **Filtragem dos Cursos**: Utiliza um seletor CSS (**`span.card-curso__nome`**) para filtrar os elementos que contêm os títulos dos cursos.
4. **Extração dos Títulos**: Os títulos dos cursos são extraídos através de um loop que percorre os elementos filtrados e adiciona o texto de cada um ao array **`$cursos`**.
5. **Tratamento de Erros**: Em caso de erro na requisição HTTP, uma mensagem de erro é adicionada ao array **`$cursos`**.
6. **Verificação de Resultados**: Se nenhum curso for encontrado, uma mensagem indicando “Nenhum curso encontrado” é adicionada ao array **`$cursos`**.

### Exemplo de Uso:

**PHP**

```php
$buscador = new Buscador($httpClient, $crawler);
$resultados = $buscador->buscarConteudo('https://www.alura.com.br/cursos-online-programacao/php');
foreach ($resultados as $curso) {
    echo $curso . PHP_EOL;
}
```

AI-generated code. Review and use carefully. [More info on FAQ](https://www.bing.com/new#faq).

## Dependências

- **`ClientInterface`**: Interface de um cliente HTTP, normalmente provida por bibliotecas como o Guzzle.
- **`Crawler`**: Classe utilizada para manipulação de documentos HTML, parte da biblioteca Symfony DomCrawler.

by **`GPT`**