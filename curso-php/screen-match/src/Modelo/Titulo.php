<?php

//a classe título funciona como uma espécie de rascunho para as outras classes -> ideia genérica -> abstract class -> pode ter métodos abstratos, que serão feitos nas classes filhas (derivadas) dela -> classes abstratas não podem ser instanciadas
abstract class Titulo implements Avaliavel
{
    private array $notas;

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
        $this->notas = [];
    }

    /*public function getNome(): string
    {
        return $this->nome;
    }

    public function getAnoLancamento(): int
    {
        return $this->anoLancamento;
    }

    public function getGenero(): string
    {
        return $this->genero;
    }*/

    public function avaliarNota(float $nota): void
    {
        //o "this" é o ponteiro que aponta para o endereço do objeto que executou o método
        if ($nota >= 0 && $nota <= 10) {
            $this->notas[] = $nota;
        }
    }

    public function calcularMediaNotas(): float
    {
        return array_sum($this->notas) / count($this->notas);
    }

    //torno o método como abstract já que a implementação dele varia de classe para classe
    abstract public function calcularDuracaoEmMinutos(): int;
}