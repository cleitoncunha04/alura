//tipos primitivos
let value = 2000;
let personName = "Carlitos";
let isPaid = false;
let anyType = ""; // --> recupera o comportamento padrão do JS
anyType = 20;
//arrays
const list = [];
list.push(1, 2, 3);
//enums
var TransactionType;
(function (TransactionType) {
    TransactionType["DEPOSIT"] = "Dep\u00F3sito";
    TransactionType["TRANSFER"] = "Transfer\u00EAncia";
    TransactionType["BILLS_OF_EXCHANGE"] = "Pagamento de Boleto";
})(TransactionType || (TransactionType = {}));
;
const newTransaction = {
    transactionType: TransactionType.DEPOSIT,
    date: new Date(),
    value: 0
};
