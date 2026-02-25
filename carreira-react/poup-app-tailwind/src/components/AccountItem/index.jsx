import { IconBank } from "../../assets/Icons/Icons";

export const AccountItem = ({ item }) => {
    const formatCurrency = (value) => {
        return value.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
    }

    return (
        <div className="w-full flex gap-10 items-center p-4">
            <div className="flex gap-2 items-center min-w-[60%]">
                <IconBank />
                <p className="text-[15px] font-bold leading-[120%]">{item.bank}</p>
            </div>
            <div className="flex flex-col gap-2">
                <p className="text-[15px] font-bold leading-[120%]">Saldo</p>
                <p className="text-[15px] font-regular leading-[120%]">{formatCurrency(item.balance)}</p>
            </div>
        </div>
    );
    };