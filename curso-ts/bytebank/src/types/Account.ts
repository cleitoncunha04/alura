import {Transaction} from "./Transaction.js";
import {TransactionType} from "./TransactionType.js";

let balance: number = 3000;

const Account = {

    getBalance(): number
    {
        return balance;
    },

    getAccessDate(): Date
    {
        return new Date();
    },

    registerTransaction(newTransaction: Transaction): void
    {
        if (newTransaction.transactionType === TransactionType.DEPOSIT) {
            balance += newTransaction.value;
        } else if (newTransaction.transactionType === TransactionType.TRANSFER || newTransaction.transactionType === TransactionType.BANK_SLIP_PAYMENT) {
            balance -= newTransaction.value;
        } else {
            alert("Invalid transaction!");

            return;
        }
    }
};

export default Account;