let balance = 3000;

const balanceElement = document.querySelector(".saldo-valor .valor") as HTMLElement;

if (balanceElement) {
    balanceElement.textContent = balance.toString();
}

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

    let type: string = transactionTypeInput.value;
    let value: number = transactionValueInput.valueAsNumber;
    let date: Date = new Date(transactionDate.value);

    if (type === "Depósito") {
        balance += value;
    } else if (type === "Transferência" || type === "Pagamento de boleto") {
        balance -= value;
    } else {
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

