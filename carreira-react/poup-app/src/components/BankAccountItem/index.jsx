import styles from './BankAccountItem.module.css';
import typography from '../Typography/Typography.module.css';
import { IconBank } from '../../assets/icons/icons';
export const BankAccountItem = ({ account }) => {
    const formatter = new Intl.NumberFormat('pt-BR', {
        style: 'currency',
        currency: 'BRL',
    });

    return (
        <div className={styles.container}>
            <div className={[styles.title, typography.m_medium].join(' ')}>
                <IconBank />
                <p>{account.bank}</p>
            </div>
            <div className={styles.value}>
                <p
                    className={typography.m_medium}
                >
                    Saldo
                </p>
                <p
                    className={typography.m_regular}
                >
                    {formatter.format(account.balance)}
                </p>
            </div>
        </div>
    );
};