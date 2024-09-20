import Account from "../types/Account.js";
import BalanceComponent from "./balance-component.js";
import BankStatementComponent from "./bank-statement-component.js";
const formElement = document.querySelector('.block-nova-transacao form');
formElement.addEventListener("submit", (evt) => {
    try {
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
        let date = new Date(transactionDate.value + " 00:00:00");
        const newTransaction = {
            transactionType: type,
            value: value,
            date: date
        };
        Account.registerTransaction(newTransaction);
        BalanceComponent.update();
        formElement.reset();
        BankStatementComponent.update();
    }
    catch (error) {
        alert(error.message);
    }
});
