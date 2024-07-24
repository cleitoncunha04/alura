function validaIdade(dataNascimento) {
  const dataAtual = new Date();

  const dataMaiorIdade = new Date(
    dataNascimento.getUTCFullYear() + 18, //acrescentou 18 anos a data de nascimento
    dataNascimento.getUTCMonth(),
    dataNascimento.getUTCDate()
  );

  return dataAtual >= dataMaiorIdade;
}

export default function isMaiorIdade(campo) {
  const dataNascimento = new Date(campo);

  return validaIdade(dataNascimento);
}
