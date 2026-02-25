export const TransactionItem = ({ item }) => {
    const formatCurrency = (value) => {
        return value.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
    };

    const formatDate = (date) => {
        const options = { day: '2-digit', month: '2-digit', year: 'numeric' };
        return new Date(date).toLocaleDateString('pt-BR', options);
    }

    const COLOR_STYLE = item.value < 0 ? '--color-secondary-expense' : '--color-secondary-income';

    return (
        <div
            className="p-4 flex items-start justify-between">
            <div
                style={{ color: `var(${COLOR_STYLE})` }}
                className="flex flex-col gap-2">
                <p className="text-[15px] font-bold leading-[120%]">{item.description}</p>
                <p>{formatCurrency(item.value)}</p>
            </div>
            <div>
                <p className="text-[15px] font-regular leading-[120%]">{formatDate(item.date)}</p>
            </div>
        </div>
    );
};