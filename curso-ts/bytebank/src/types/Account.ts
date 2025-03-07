import {Transaction} from "./Transaction.js";
import {TransactionsGroup} from "./TransactionsGroup.js";
import {formatter} from "../utils/formatters.js";
import {DateType} from "./DateType.js";
import {TransactionType} from "./TransactionType.js";
import {Storage} from "./Storage.js";
import {ValidateDebit, ValidateDeposit} from "./Decorators.js";

export class Account {
    private name: string;

    private balance: number = Storage.get<number>("balance") || 0;

    private transactions: Transaction[] = Storage.get<Transaction[]>(("transactions"), (key: string, value: any) => {
        if (key === "date") {
            return new Date(value);
        }

        return value;
    }) || [];

    constructor(name: string) {
        this.name = name;
    }

    public getName(): string {
        return this.name;
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

    @ValidateDebit
    private debit(value: number): void {


        this.balance -= value;

        Storage.save("balance", this.balance.toString());
    }

    @ValidateDeposit
    private deposit(value: number): void {
        this.balance += value;

        Storage.save("balance", this.balance.toString());
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

        Storage.save("transactions", JSON.stringify(this.transactions));
    }
}

export class PremiumAccount extends Account {
    registerTransaction(transaction: Transaction): void {
        if (transaction.transactionType === TransactionType.DEPOSIT) {
            console.log("+R$ 0,50");

            transaction.value += 0.5;
        }

        super.registerTransaction(transaction);
    }
}

const account: Account = new Account("Cleiton dos Santos Cunha");

const premiumAccount = new PremiumAccount("Cleiton dos Santos Cunha");

console.log(account.getName());
export default account;