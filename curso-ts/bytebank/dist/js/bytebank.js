let balance = 3000;
const balanceElement = document.querySelector(".saldo-valor .valor");
if (balanceElement) {
    balanceElement.textContent = balance.toString();
}
const formElement = document.querySelector('.block-nova-transacao form');
formElement.addEventListener("submit", (evt) => {
    evt.preventDefault();
    if (!formElement.checkValidity()) {
        alert("Please, fill all transactions fields!");
        return;
    }
    const transactionTypeInput = document.querySelector("#tipoTransacao");
    const transactionValueInput = document.querySelector("#valor");
    const transactionDate = document.querySelector("#data");
    let type = transactionTypeInput.value;
    let value = transactionValueInput.valueAsNumber;
    let date = new Date(transactionDate.value);
    if (type === "Depósito") {
        balance += value;
    }
    else if (type === "Transferência" || type === "Pagamento de boleto") {
        balance -= value;
    }
    else {
        alert("Invalid transaction!");
        return;
    }
    balanceElement.textContent = balance.toString();
    const newTransaction = {
        transactionType: type,
        value: value,
        date: date
    };
    console.log(newTransaction);
    formElement.reset();
});
