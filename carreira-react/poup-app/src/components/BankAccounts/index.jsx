import styles from './BankAccounts.module.css';
import { v4 as uuidv4 } from 'uuid';
import { BankAccountItem } from '../BankAccountItem';
import { Button } from '../Button';
import { IconWallet } from '../../assets/icons/icons';

const ACCOUNTS = [
    {
        "id": uuidv4(),
        "bank": "Anybank",
        "balance": 1200
    },
    {
        "id": uuidv4(),
        "bank": "Bytebank",
        "balance": 800
    },
    {
        "id": uuidv4(),
        "bank": "Switch Bank",
        "balance": 1800
    }
]

export const BankAccounts = () => {
    return (
        <>
            <ul className={styles.list}>
                {ACCOUNTS.map((a) => (
                    <li key={a.id} className={styles.item}>
                        <BankAccountItem account={a} />
                    </li>
                ))}
            </ul>

            <Button>
                <IconWallet />
                Adicionar Conta
            </Button>
        </>
    );
};