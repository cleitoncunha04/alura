import {Transaction} from "./Transaction.js";
import {TransactionType} from "./TransactionType.js";
import {TransactionsGroup} from "./TransactionsGroup.js";
import {formatter} from "../utils/formatters.js";
import {DateType} from "./DateType.js";

let balance: number = JSON.parse(localStorage.getItem("balance")) || 0;

const transactions: Transaction[] = JSON.parse(localStorage.getItem("transactions"), (key: string, value: string) => {
    if (key === "date") {
        return new Date(value);
    }

    return value;
}) || [];

function debit(value: number): void
{
    if (value <= 0)  {
        throw new Error("The amount debited must be greater than 0");
    } else if (value > balance) {
        throw new Error ("Insufficient balance");
    } else {
        balance -= value;

        localStorage.setItem("balance", balance.toString());
    }
}

function deposit(value: number): void
{
    if (value <= 0)  {
        throw new Error("The amount debited must be greater than 0");
    } else {
        balance += value;

        localStorage.setItem("balance", balance.toString());
    }

}

const OldAccount = {

    getBalance(): number
    {
        return balance;
    },

    getAccessDate(): Date
    {
        return new Date();
    },

    getTransactionsGroup(): TransactionsGroup[]
    {
        const transactionsGroup: TransactionsGroup[] = [];

        let transactionList: Transaction[] = structuredClone(transactions); //cria uma cópia do array, para que o objeto nao seja passado por referência

        transactionList = transactionList.sort((t1, t2) => t2.date.getTime() - t1.date.getTime());

        let actualTransactionGroupLabel: string = "";

        for (let transaction of transactionList) {
            let transactionGroupLabel: string = formatter.dateFormatter(transaction.date, DateType.MONTH_YEAR);

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

    registerTransaction(newTransaction: Transaction): void
    {
        if (newTransaction.transactionType === TransactionType.DEPOSIT) {
            deposit(newTransaction.value);
        } else if (newTransaction.transactionType === TransactionType.TRANSFER || newTransaction.transactionType === TransactionType.BANK_SLIP_PAYMENT) {
            debit(newTransaction.value);

            newTransaction.value *= -1;
        } else {
            throw new Error("Invalid transaction type");
        }

        transactions.push(newTransaction);

        console.log(this.getTransactionsGroup());

        localStorage.setItem("transactions", JSON.stringify(transactions));
    }
};

export default OldAccount;