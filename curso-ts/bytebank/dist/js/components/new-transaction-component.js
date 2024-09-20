import Account from "../types/Account.js";
import BalanceComponent from "./balance-component.js";
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
    const newTransaction = {
        transactionType: type,
        value: value,
        date: date
    };
    Account.registerTransaction(newTransaction);
    BalanceComponent.update();
    formElement.reset();
});
