let balance = 3000;
const balanceElement = document.querySelector(".saldo-valor .valor");
if (balanceElement) {
    balanceElement.textContent = coinFormatter(balance);
}
const accessDateElement = document.querySelector(".block-saldo time");
if (accessDateElement) {
    const actualDate = new Date();
    accessDateElement.textContent = dateFormatter(actualDate, DateType.WEEKDAY_DAY_MONTH_YEAR);
}
