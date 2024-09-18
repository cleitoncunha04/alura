let balance:number = 3000;

const balanceElement = document.querySelector(".saldo-valor .valor") as HTMLElement;

if (balanceElement) {
    balanceElement.textContent = coinFormatter(balance);
}

const accessDateElement = document.querySelector(".block-saldo time") as HTMLTimeElement;

if (accessDateElement) {
    const actualDate: Date = new Date();

    accessDateElement.textContent = dateFormatter(actualDate, DateType.WEEKDAY_DAY_MONTH_YEAR);
}




