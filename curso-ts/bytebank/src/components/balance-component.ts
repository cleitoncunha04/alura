import { formatter } from "../utils/formatters.js";
import { DateType } from "../types/DateType.js";
import Account from "../types/Account.js";

const balanceElement = document.querySelector(".saldo-valor .valor") as HTMLElement;

const accessDateElement = document.querySelector(".block-saldo time") as HTMLTimeElement;

if (accessDateElement) {
    accessDateElement.textContent = formatter.dateFormatter(Account.getAccessDate(), DateType.WEEKDAY_DAY_MONTH_YEAR);
}

function updateBalanceOnScreen(): void
{
    if (balanceElement) {
        balanceElement.textContent = formatter.coinFormatter(Account.getBalance());
    }
}

updateBalanceOnScreen();

const BalanceComponent = {
    update(): void
    {
        updateBalanceOnScreen();
    }
};

export default BalanceComponent;


