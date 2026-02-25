import { Container } from './components/Container';
import { Aside } from './components/Aside';
import { SearchInput } from './components/SearchInput';
import { Main } from './components/Main';
import { Typography } from './components/Typography';
import Card from './components/Card';
import { DailyBudget } from './components/DailyBudget';
import { SavingsStatus } from './components/SavingsStatus';
import styles from './App.module.css';
import { Transactions } from './components/Transactions';
import { BankAccounts } from './components/BankAccounts';

function App() {
  return (
    <Container>
      <Aside />
      <Main>
        <SearchInput
          type="text"
          name="search"
          id="search"
          placeholder="Procure seu dinheiro..."
          autoComplete="off"
        />
        <div>
          <Typography
            variant="h1"
            color="var(--neutral-text)"
          >
            Olá, Cleiton!
          </Typography>
          <Typography
            variant="body"
            color="var(--neutral-text)"
          >
            Veja como estão suas finanças hoje.
          </Typography>
        </div>
        <section className={styles.grid}>
          <Card>
            <Card.Header>
              <Typography
                variant="h2"
                color="var(--neutral-text)"
              >
                Orçamento diário disponível:
              </Typography>
            </Card.Header>
            <Card.Body>
              <DailyBudget amount={50} />
            </Card.Body>
          </Card>
          <Card>
            <Card.Header>
              <Typography
                variant="h2"
                color="var(--neutral-text)"
              >
                Progresso da meta financeira:
              </Typography>
            </Card.Header>
            <Card.Body>
              <SavingsStatus percent={40} />
            </Card.Body>
          </Card>
          <Card>
            <Card.Header>
              <Typography
                variant="h3"
                color="var(--neutral-text)"
              >
                Movimentação financeira:
              </Typography>
            </Card.Header>
            <Card.Body>
              <Transactions />
            </Card.Body>
          </Card>
          <Card>
            <Card.Header>
              <Typography
                variant="h3"
                color="var(--neutral-text)"
              >
                Minhas contas
              </Typography>
            </Card.Header>
            <Card.Body>
              <BankAccounts />
            </Card.Body>
          </Card>
        </section>
      </Main>
    </Container>
  )
}

export default App
