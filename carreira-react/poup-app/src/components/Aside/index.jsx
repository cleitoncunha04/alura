import styles from './Aside.module.css';
import typography from '../Typography/Typography.module.css';
import logo from '../../assets/logo.svg';

export const Aside = () => {
    return (
        <aside className={styles.aside}>
            <img
                className={styles.logo}
                src={logo}
                alt="Logo da PoupApp"
            />
            <footer className={[styles.footer, typography.s_regular].join(' ')}>
                Desenvolvido por Cleiton Cunha em parceira com a Alura. Projeto fictício sem fins comerciais.
            </footer>
        </aside>
    )
}