import styles from './TransactionItem.module.css';
import typography from '../Typography/Typography.module.css';

export const TransactionItem = ({ transaction }) => {
    const isNegative = transaction.value < 0;

    const valueColor = isNegative ? 'var(--secondary-expense)' : 'var(--secondary-income)';

    const date = new Date(transaction.date).toLocaleDateString('pt-BR', {
        day: '2-digit',
        month: '2-digit',
        year: 'numeric'
    });

    const formatter = new Intl.NumberFormat('pt-BR', {
        style: 'currency',
        currency: 'BRL',
    });

    return (
        <div className={styles.container}>
            <div
                className={[styles.content, isNegative ? styles.expense : styles.income].join(' ')}
            >
                <p
                    className={[styles.description, typography.m_medium].join(' ')}
                >
                    {transaction.description}
                </p>
                <p
                    className={[styles.value, typography.m_regular].join(' ')}
                >
                    {formatter.format(transaction.value).replace('.', ',')}
                </p>
            </div>
            <div className={styles.aside}>
                <p className={[styles.date, typography.m_regular].join(' ')}>
                    {date}
                </p>
            </div>
        </div>
    );
};