import {DateType} from "../types/DateType.js";

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
    } else if (format === DateType.MONTH_YEAR) {
        dateFormatted = date.toLocaleDateString("pt-br", {
            month:"long",
            year:"numeric"
        });
    } else {
        dateFormatted = date.toLocaleDateString("pt-br");
    }

    return dateFormatted;
}

export const formatter = {
  coinFormatter,
  dateFormatter
};