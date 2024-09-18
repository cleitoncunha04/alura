const formElement = document.querySelector('.block-nova-transacao form') as HTMLFormElement;

formElement.addEventListener("submit", (evt) => {
    evt.preventDefault();

    if (!formElement.checkValidity()) {
        alert("Please, fill all transactions fields!");

        return;
    }

    const transactionTypeInput = document.querySelector("#tipoTransacao") as HTMLSelectElement;
    const transactionValueInput = document.querySelector("#valor") as HTMLInputElement;
    const transactionDate = document.querySelector("#data") as HTMLInputElement;

    let type: TransactionType = transactionTypeInput.value as TransactionType;
    let value: number = transactionValueInput.valueAsNumber;
    let date: Date = new Date(transactionDate.value);

    if (type === TransactionType.DEPOSIT) {
        balance += value;
    } else if (type === TransactionType.TRANSFER || type === TransactionType.BANK_SLIP_PAYMENT) {
        balance -= value;
    } else {
        alert("Invalid transaction!");

        return;
    }

    balanceElement.textContent = coinFormatter(balance)

    const newTransaction:Transaction = {
        transactionType: type,
        value: value,
        date: date
    };

    console.log(newTransaction);

    formElement.reset();
});