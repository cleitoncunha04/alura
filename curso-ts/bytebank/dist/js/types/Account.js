var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import { formatter } from "../utils/formatters.js";
import { DateType } from "./DateType.js";
import { TransactionType } from "./TransactionType.js";
import { Storage } from "./Storage.js";
import { ValidateDebit, ValidateDeposit } from "./Decorators.js";
export class Account {
    name;
    balance = Storage.get("balance") || 0;
    transactions = Storage.get(("transactions"), (key, value) => {
        if (key === "date") {
            return new Date(value);
        }
        return value;
    }) || [];
    constructor(name) {
        this.name = name;
    }
    getName() {
        return this.name;
    }
    getBalance() {
        return this.balance;
    }
    getAccessDate() {
        return new Date();
    }
    getTransactionsGroup() {
        const transactionsGroup = [];
        let transactionList = structuredClone(this.transactions); //cria uma cópia do array, para que o objeto nao seja passado por referência
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
    }
    debit(value) {
        this.balance -= value;
        Storage.save("balance", this.balance.toString());
    }
    deposit(value) {
        this.balance += value;
        Storage.save("balance", this.balance.toString());
    }
    registerTransaction(newTransaction) {
        if (newTransaction.transactionType === TransactionType.DEPOSIT) {
            this.deposit(newTransaction.value);
        }
        else if (newTransaction.transactionType === TransactionType.TRANSFER || newTransaction.transactionType === TransactionType.BANK_SLIP_PAYMENT) {
            this.debit(newTransaction.value);
            newTransaction.value *= -1;
        }
        else {
            throw new Error("Invalid transaction type");
        }
        this.transactions.push(newTransaction);
        Storage.save("transactions", JSON.stringify(this.transactions));
    }
}
__decorate([
    ValidateDebit
], Account.prototype, "debit", null);
__decorate([
    ValidateDeposit
], Account.prototype, "deposit", null);
export class PremiumAccount extends Account {
    registerTransaction(transaction) {
        if (transaction.transactionType === TransactionType.DEPOSIT) {
            console.log("+R$ 0,50");
            transaction.value += 0.5;
        }
        super.registerTransaction(transaction);
    }
}
const account = new Account("Cleiton dos Santos Cunha");
const premiumAccount = new PremiumAccount("Cleiton dos Santos Cunha");
console.log(account.getName());
export default account;
