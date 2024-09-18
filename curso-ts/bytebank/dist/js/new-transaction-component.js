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
    if (type === TransactionType.DEPOSIT) {
        balance += value;
    }
    else if (type === TransactionType.TRANSFER || type === TransactionType.BANK_SLIP_PAYMENT) {
        balance -= value;
    }
    else {
        alert("Invalid transaction!");
        return;
    }
    balanceElement.textContent = coinFormatter(balance);
    const newTransaction = {
        transactionType: type,
        value: value,
        date: date
    };
    console.log(newTransaction);
    formElement.reset();
});
