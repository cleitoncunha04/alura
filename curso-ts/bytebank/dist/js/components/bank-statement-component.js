import Account from "../types/Account.js";
import { formatter } from "../utils/formatters.js";
import { DateType } from "../types/DateType.js";
const registerBankStatementElement = document.querySelector(".extrato .registro-transacoes");
function renderBankStatement() {
    const transactionsGroup = Account.getTransactionsGroup();
    registerBankStatementElement.innerHTML = "";
    let registerTransactionHtml = "";
    for (let transactionGroup of transactionsGroup) {
        let transactionHtmlItem = "";
        for (let transaction of transactionGroup.transactions) {
            transactionHtmlItem += `
                <div class="transacao-item">
                    <div class="transacao-info">
                        <span class="tipo">${transaction.transactionType}</span>
                        <strong class="valor">${formatter.coinFormatter(transaction.value)}
                        </strong>
                    </div>
                    <time class="data">${formatter.dateFormatter(transaction.date, DateType.DAY_MONTH)}</time>
                </div>
            `;
        }
        registerTransactionHtml += `
            <div class="transacoes-group">
                <strong class="mes-group">${transactionGroup.label}</strong>
                ${transactionHtmlItem}
            </div>
        `;
    }
    if (registerTransactionHtml === "") {
        registerTransactionHtml = "<div>There are no transactions recorded</div>";
    }
    registerBankStatementElement.innerHTML = registerTransactionHtml;
}
renderBankStatement();
const BankStatementComponent = {
    update() {
        renderBankStatement();
    }
};
export default BankStatementComponent;
