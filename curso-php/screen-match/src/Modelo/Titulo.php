<?php
//espécie de "pasta virtual"
namespace ScreenMatch\Modelo;

//a classe título funciona como uma espécie de rascunho para as outras classes -> ideia genérica -> abstract class -> pode ter métodos abstratos, que serão feitos nas classes filhas (derivadas) dela -> classes abstratas não podem ser instanciadas
abstract class Titulo implements Avaliavel
{
    //--> basicamente, copia o código da trait e cola aqui
    use ComAvaliacao;

    //método construtor -> não pode retornar nada, o retorno é o próprio objeto que foi criado
    //geralmente, toda inicialização de atributo fica no construtor
    //quando defino um padrão de acesso no construtor, ele vira um atributo da classe -> não precisa definir esse atributo na classe -> equivale ao "$this->" -> sempre precisa ser tipado (primitivo)
    public function __construct(
        //espécie de "private" -> uma propriedade readonly só pode ser atribuída 1 vez -> fazendo isso podemos deixá-las como "public" e podemos apagar os getters já que os atributos são acessíveis agora.
        public readonly string $nome,
        public readonly int    $anoLancamento,
        public readonly Genero $genero,
    )
    {
    }

    //torno o método como abstract já que a implementação dele varia de classe para classe
    abstract public function calcularDuracaoEmMinutos(): int;
}