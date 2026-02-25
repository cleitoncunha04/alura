import styles from './Transactions.module.css';
import typography from '../Typography/Typography.module.css';
import { v4 as uuidv4 } from 'uuid';
import { TransactionItem } from '../TransactionItem';
import { Button } from '../Button';
import { IconCurrency } from '../../assets/icons/icons';

const TRANSACTIONS = [
    {
        "id": uuidv4(),
        "description": "iFood",
        "value": -20,
        "date": "2024-10-01T00:00:00-03:00"
    },
    {
        "id": uuidv4(),
        "description": "Papelaria Mila",
        "value": -80,
        "date": "2024-10-03T00:00:00-03:00"
    },
    {
        "id": uuidv4(),
        "description":
            "Freela (2ª parte)",
        "value": 1000,
        "date": "2024-10-03T00:00:00-03:00"
    },
    {
        "id": uuidv4(),
        "description":
            "Magazine Luiza",
        "value": -300,
        "date": "2024-10-05T00:00:00-03:00"
    }
];

export const Transactions = () => {
    return (
        <>
            <ul className={styles.list}>
                {TRANSACTIONS.map((t) => (
                    <li key={t.id}>
                        <TransactionItem transaction={t} />
                    </li>
                ))}
            </ul>
            <Button>
                <IconCurrency /> Adicionar Transação
            </Button>
        </>
    );
};