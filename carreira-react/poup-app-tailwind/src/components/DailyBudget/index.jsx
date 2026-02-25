import { Typography } from "../Typography";

export const DailyBudget = ({ value }) => {
    const formattedValue = value.toLocaleString('pt-BR', {
        style: 'currency',
        currency: 'BRL',
    });

    return (
        <div className="flex-1 text-primary-highlight flex items-center justify-center">
            <Typography variant="strong">
                {formattedValue}
            </Typography>
        </div>
    );
};