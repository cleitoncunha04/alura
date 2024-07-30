function mascaraCpf(input) {
  var valorInput = input.value;

  if (isNaN(valorInput[valorInput.length - 1])) {
    // impede entrar outro caractere que não seja número
    input.value = valorInput.substring(0, valorInput.length - 1);
    return;
  }

  if (valorInput.length == 3 || valorInput.length == 7) input.value += ".";
  if (valorInput.length == 11) input.value += "-";
}

function limpaMascaraCpf(cpf) {
  //tira os "." e os "-" do cpf
  cpf = cpf.replace(/\.|-/g, "");
  console.log(cpf);

  return cpf;
}

function validaNumerosRepetidos(cpf) {
  const numerosRepetidos = [
    "00000000000",
    "11111111111",
    "22222222222",
    "33333333333",
    "44444444444",
    "55555555555",
    "66666666666",
    "77777777777",
    "88888888888",
    "99999999999",
  ];

  return numerosRepetidos.includes(cpf);
}

function validaPrimeiroDigito(cpf) {
  let soma = 0;
  let multiplicador = 10;

  for (let indice = 0; indice < 9; indice++) {
    soma += cpf[indice] * multiplicador;
    multiplicador--;
  }

  soma = (soma * 10) % 11;

  if (soma == 10 || soma == 11) {
    soma = 0;
  }

  return soma != cpf[9];
}

function validaSegundoDigito(cpf) {
  let soma = 0;
  let multiplicador = 11;

  for (let indice = 0; indice < 10; indice++) {
    soma += cpf[indice] * multiplicador;
    multiplicador--;
  }

  soma = (soma * 10) % 11;

  if (soma == 10 || soma == 11) {
    soma = 0;
  }

  return soma != cpf[10];
}

function isCpf(cpf) {
  cpf = limpaMascaraCpf(cpf);

  if (
    validaNumerosRepetidos(cpf) ||
    validaPrimeiroDigito(cpf) ||
    validaSegundoDigito(cpf)
  ) {
    return false;
  } else {
    return true;
  }
}

export const validaCpf = {
  mascaraCpf,
  isCpf,
};
