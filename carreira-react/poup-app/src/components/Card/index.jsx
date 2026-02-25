import styles from './Card.module.css';

const Card = ({ children }) => {
  return (
    <div className={styles.card}>
      {children}
    </div>
  )
};

export const CardHeader = ({ children }) => {
return (
    <div className={styles.card__header}>
      {children}
    </div>
  )
};

export const CardBody = ({ children }) => {
  return (
    <div className={styles.card__body}>
      {children}
    </div>
  )
};    

Card.Header = CardHeader;
Card.Body = CardBody;

export default Card;