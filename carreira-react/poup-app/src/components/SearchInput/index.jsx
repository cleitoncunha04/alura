import styles from './SearchInput.module.css';
import typography from '../Typography/Typography.module.css';
import { IconSearch } from '../../assets/icons/icons';


export const SearchInput = (props) => {
    return (
        <div className={styles.container}>
            <IconSearch />
            <input
                className={[styles.input, typography.l_regular].join(' ')}
                {...props}
            />
        </div>
    );
}