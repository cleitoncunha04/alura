import {TransactionType} from "../types/TransactionType.js";
import {Transaction} from "../types/Transaction.js";
import Account from "../types/Account.js";
import BalanceComponent from "./balance-component.js";
import BankStatementComponent from "./bank-statement-component.js";

const formElement = document.querySelector('.block-nova-transacao form') as HTMLFormElement;

formElement.addEventListener("submit", (evt) => {
    try {
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

        let date: Date = new Date(transactionDate.value + " 00:00:00");

        const newTransaction: Transaction = {
            transactionType: type,
            value: value,
            date: date
        };

        Account.registerTransaction(newTransaction);

        BalanceComponent.update();

        formElement.reset();

        BankStatementComponent.update();
    } catch (error) {
        alert(error.message);
    }
});