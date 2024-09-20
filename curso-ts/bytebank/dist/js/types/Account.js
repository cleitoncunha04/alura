import { TransactionType } from "./TransactionType.js";
let balance = 3000;
const Account = {
    getBalance() {
        return balance;
    },
    getAccessDate() {
        return new Date();
    },
    registerTransaction(newTransaction) {
        if (newTransaction.transactionType === TransactionType.DEPOSIT) {
            balance += newTransaction.value;
        }
        else if (newTransaction.transactionType === TransactionType.TRANSFER || newTransaction.transactionType === TransactionType.BANK_SLIP_PAYMENT) {
            balance -= newTransaction.value;
        }
        else {
            alert("Invalid transaction!");
            return;
        }
    }
};
export default Account;
