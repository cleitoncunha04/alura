import styles from './Main.module.css';


export const Main = ({ children }) => {
    return (
        <main className={styles.main}>
            {children}
        </main>
    );
}