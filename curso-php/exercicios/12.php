<?php
/*Crie uma enum em PHP com tipos de contas bancárias e implemente um método informando se a conta possui taxas. Contas correntes e de investimento possuem taxas, enquanto contas poupança e universitárias não;*/

/*Crie uma classe que represente uma conta com as propriedades saldo, nome do titular e tipo. Use os tipos e formas de acesso adequadas.*/

enum ContaBancaria
{
    case Corrente;
    case Investimento;
    case Poupanca;
    case Universitaria;

    function temTaxa(): bool
    {
        return match ($this) {
            ContaBancaria::Corrente, ContaBancaria::Investimento => true,
            default => false,
        };
    }
}

class Conta
{
    function __construct(
        public readonly string        $nomeTitular,
        public float                  $saldo,
        public readonly ContaBancaria $tipo,
    )
    {
    }

    public function depositar(float $valor): void
    {
        if ($valor > 0) {
            $this->saldo += $valor;
        }
    }

    public function sacar(float $valor): void
    {
        if ($valor > 0 && $valor <= $this->saldo) {
            $this->saldo -= $valor;
        }
    }
}

$conta = new Conta(nomeTitular: "Carlitos", saldo: 2500, tipo: ContaBancaria::Investimento);

$conta->depositar(2500);
$conta->sacar(1500);

var_dump($conta);

echo $conta->tipo->temTaxa();

