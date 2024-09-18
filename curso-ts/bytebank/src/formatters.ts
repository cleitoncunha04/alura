function coinFormatter(value: number): string
{
    return value.toLocaleString("pt-br", {
        currency: "BRL",
        style: "currency"
    });
}

function dateFormatter(date: Date, format: DateType = DateType.DEFAULT): string
{
    let dateFormatted = "";

    if (format === DateType.WEEKDAY_DAY_MONTH_YEAR) {
        dateFormatted = date.toLocaleDateString("pt-br", {
            weekday: "long",
            day: "2-digit",
            month: "2-digit",
            year: "numeric"
        });
    } else if (format === DateType.DAY_MONTH) {
        dateFormatted = date.toLocaleDateString("pt-br", {
            day: "2-digit",
            month: "2-digit"
        });
    } else {
        dateFormatted = date.toLocaleDateString("pt-br");
    }

    return dateFormatted;
}