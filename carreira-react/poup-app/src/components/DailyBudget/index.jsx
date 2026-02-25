import styles from './DailyBudget.module.css';
import typography from '../Typography/Typography.module.css';

const formatter = new Intl.NumberFormat('pt-BR', {
    style: 'currency',
    currency: 'BRL',
});

export const DailyBudget = ({ amount }) => {
    return (
        <p
            className={[styles.daily_budget, typography.xxxl_bold].join(' ')}
        >
            {formatter.format(amount)}
        </p>
    );
};