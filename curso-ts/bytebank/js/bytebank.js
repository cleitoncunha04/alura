var balance = 3000;
var balanceElement = document.querySelector(".saldo-valor .valor");
if (balanceElement) {
    balanceElement.textContent = balance.toString();
}
var formElement = document.querySelector('.block-nova-transacao form');
formElement.addEventListener("submit", function (evt) {
    evt.preventDefault();
    if (!formElement.checkValidity()) {
        alert("Please, fill all transactions fields!");
        return;
    }
    var transactionTypeInput = document.querySelector("#tipoTransacao");
    var transactionValueInput = document.querySelector("#valor");
    var transactionDate = document.querySelector("#data");
    var type = transactionTypeInput.value;
    var value = transactionValueInput.valueAsNumber;
    var date = new Date(transactionDate.value);
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
    var newTransaction = {
        transactionType: type,
        value: value,
        date: date
    };
    console.log(newTransaction);
    formElement.reset();
});
