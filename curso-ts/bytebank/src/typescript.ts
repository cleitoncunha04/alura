//tipos primitivos
let value: number = 2000;

let personName: string = "Carlitos";

let isPaid: boolean = false;

let anyType: any = ""; // --> recupera o comportamento padrão do JS

anyType = 20;

//arrays
const list: number[] = [];

list.push(1, 2, 3);

//enums
enum TransactionType {
    DEPOSIT = "Depósito",
    TRANSFER = "Transferência",
    BILLS_OF_EXCHANGE =  "Pagamento de Boleto"
};

//type alias
type Transaction = {
    transactionType: TransactionType;
    date: Date;
    value:number;
}

const newTransaction: Transaction = {
    transactionType: TransactionType.DEPOSIT,
    date: new Date(),
    value: 0
};