const menorValor = 1;
const maiorValor = 1000;

const elementoMenorValor = document.getElementById('menor-valor');
elementoMenorValor.innerHTML = menorValor;

const elementoMaiorValor = document.getElementById('maior-valor');
elementoMaiorValor.innerHTML = maiorValor;

//o Math.random() gera números entre a 0 a 1 (o 1 é exclusivo, nunca é alcançado). Para termos números entre 0 e 1000 multiplicamos o valor por 1000 e depois convertemos em Int para tirarmos as casas decimais.
const numeroSorteador = parseInt(Math.random() * maiorValor + 1);

console.log(numeroSorteador);