import styles from './ProgressBar.module.css';
import typography from '../Typography/Typography.module.css';

export const ProgressBar = ({ percent }) => {
    return (
        <div className={styles.wrapper}>
            <div
                className={[styles.filled, typography.m_medium].join(' ')}
                style={{ width: `${percent}%` }}
            >
                {percent}%
            </div>
        </div>
    );
}