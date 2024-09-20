import { TransactionType } from "./TransactionType.js";
import { formatter } from "../utils/formatters.js";
import { DateType } from "./DateType.js";
let balance = JSON.parse(localStorage.getItem("balance")) || 0;
const transactions = JSON.parse(localStorage.getItem("transactions"), (key, value) => {
    if (key === "date") {
        return new Date(value);
    }
    return value;
}) || [];
function debit(value) {
    if (value <= 0) {
        throw new Error("The amount debited must be greater than 0");
    }
    else if (value > balance) {
        throw new Error("Insufficient balance");
    }
    else {
        balance -= value;
        localStorage.setItem("balance", balance.toString());
    }
}
function deposit(value) {
    if (value <= 0) {
        throw new Error("The amount debited must be greater than 0");
    }
    else {
        balance += value;
        localStorage.setItem("balance", balance.toString());
    }
}
const Account = {
    getBalance() {
        return balance;
    },
    getAccessDate() {
        return new Date();
    },
    getTransactionsGroup() {
        const transactionsGroup = [];
        let transactionList = structuredClone(transactions); //cria uma cópia do array, para que o objeto nao seja passado por referência
        transactionList = transactionList.sort((t1, t2) => t2.date.getTime() - t1.date.getTime());
        let actualTransactionGroupLabel = "";
        for (let transaction of transactionList) {
            let transactionGroupLabel = formatter.dateFormatter(transaction.date, DateType.MONTH_YEAR);
            if (actualTransactionGroupLabel != transactionGroupLabel) {
                actualTransactionGroupLabel = transactionGroupLabel;
                transactionsGroup.push({
                    label: actualTransactionGroupLabel,
                    transactions: []
                });
            }
            // @ts-ignore
            transactionsGroup.at(-1).transactions.push(transaction);
        }
        return transactionsGroup;
    },
    registerTransaction(newTransaction) {
        if (newTransaction.transactionType === TransactionType.DEPOSIT) {
            deposit(newTransaction.value);
        }
        else if (newTransaction.transactionType === TransactionType.TRANSFER || newTransaction.transactionType === TransactionType.BANK_SLIP_PAYMENT) {
            debit(newTransaction.value);
            newTransaction.value *= -1;
        }
        else {
            throw new Error("Invalid transaction type");
        }
        transactions.push(newTransaction);
        console.log(this.getTransactionsGroup());
        localStorage.setItem("transactions", JSON.stringify(transactions));
    }
};
export default Account;
