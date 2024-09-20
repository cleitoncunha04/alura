import {Transaction} from "./Transaction.js";
import {TransactionsGroup} from "./TransactionsGroup.js";
import {formatter} from "../utils/formatters.js";
import {DateType} from "./DateType.js";
import {TransactionType} from "./TransactionType.js";

export class Account {
    private name: string;

    private balance: number = JSON.parse(localStorage.getItem("balance")) || 0;

    private transactions: Transaction[] = JSON.parse(localStorage.getItem("transactions"), (key: string, value: any) => {
        if (key === "date") {
            return new Date(value);
        }

        return value;
    }) || [];

    constructor(name: string) {
        this.name = name;
    }

    public getBalance(): number {
        return this.balance;
    }

    public getAccessDate(): Date {
        return new Date();
    }

    public getTransactionsGroup(): TransactionsGroup[] {
        const transactionsGroup: TransactionsGroup[] = [];

        let transactionList: Transaction[] = structuredClone(this.transactions); //cria uma cópia do array, para que o objeto nao seja passado por referência

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
    }

    private debit(value: number): void {
        if (value <= 0) {
            throw new Error("The amount debited must be greater than 0");
        } else if (value > this.balance) {
            throw new Error("Insufficient balance");
        } else {
            this.balance -= value;

            localStorage.setItem("balance", this.balance.toString());
        }
    }

    private deposit(value: number): void {
        if (value <= 0) {
            throw new Error("The amount debited must be greater than 0");
        } else {
            this.balance += value;

            localStorage.setItem("balance", this.balance.toString());
        }

    }

    public registerTransaction(newTransaction: Transaction): void {
        if (newTransaction.transactionType === TransactionType.DEPOSIT) {
            this.deposit(newTransaction.value);
        } else if (newTransaction.transactionType === TransactionType.TRANSFER || newTransaction.transactionType === TransactionType.BANK_SLIP_PAYMENT) {
            this.debit(newTransaction.value);

            newTransaction.value *= -1;
        } else {
            throw new Error("Invalid transaction type");
        }

        this.transactions.push(newTransaction);

        localStorage.setItem("transactions", JSON.stringify(this.transactions));
    }
}

const account: Account = new Account("Cleiton dos Santos Cunha");

export default account;