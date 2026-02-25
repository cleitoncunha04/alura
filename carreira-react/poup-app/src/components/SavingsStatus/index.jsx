import styles from './SavingsStatus.module.css';
import typography from '../Typography/Typography.module.css';
import { IconSavings } from '../../assets/icons/icons';
import { ProgressBar } from '../ProgressBar';

export const SavingsStatus = ({ percent }) => {
    return (
        <div className={styles.container}>
            <p
                className={[styles.title, typography.l_regular].join(' ')}
            >
                <IconSavings /> Econimizar
            </p>
            <ProgressBar percent={percent} />
        </div>
    );
};
