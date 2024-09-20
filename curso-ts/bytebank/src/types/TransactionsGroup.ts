import {Transaction} from "./Transaction.js";

export type TransactionsGroup = {
    label: string;
    transactions: Transaction[];
}