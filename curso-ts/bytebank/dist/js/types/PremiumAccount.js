import { TransactionType } from "./TransactionType";
export class PremiumAccount {
    registerTransaction(transaction) {
        if (transaction.transactionType === TransactionType.DEPOSIT) {
            console.log("+R$ 0,50");
            transaction.value += 0.5;
        }
        this.registerTransaction(transaction);
    }
}
