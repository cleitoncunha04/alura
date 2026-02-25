import styles from './Button.module.css';
import typography from '../Typography/Typography.module.css';

export const Button = ({ children, ...props }) => {
    return (
        <button {...props} className={styles.button}>
            {children}
        </button>
    );
};