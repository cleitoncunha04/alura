<?php
/*Crie uma classe ContaBancaria com métodos para realizar operações bancárias como depositar(), sacar() e consultarSaldo(). Em seguida, crie uma subclasse ContaCorrente que herda da classe ContaBancaria. Adicione um método específico para a subclasse, como cobrarTarifaMensal(), que desconta uma tarifa mensal da conta corrente.

Além disso, no método sacar() da ContaCorrente, cobre uma taxa de saque também. Armazene essa taxa como uma constante da classe.*/

class ContaBancariaa
{
    public function __construct(
        public readonly string $nome,
        public float           $saldo
    )
    {
    }

    public function depositar($valor): void
    {
        if ($valor > 0) {
            $this->saldo += $valor;
        }
    }

    public function sacar($valor): void
    {
        if ($valor > 0 && $valor < $this->saldo) {
            $this->saldo -= $valor;
        }
    }

    public function consultarSaldo(): float
    {
        return $this->saldo;
    }
}

class ContaCorrente extends ContaBancariaa {
    public function __construct(string $nome, float $saldo)
    {
        parent::__construct($nome, $saldo);
    }

    #[Override]
    public function sacar($valor): void {
        if ($valor > 0 && $valor < $this->saldo) {
            $this->saldo -= $valor * 1.1;
        }
    }

    public function cobrarTarifaMensal(): void
    {
        $this->saldo -= 15;
    }
}

$conta = new ContaCorrente("Carlitos", 200);

$conta->depositar(50);
$conta->sacar(100);
echo $conta->consultarSaldo();