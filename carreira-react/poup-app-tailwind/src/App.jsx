import { Aside } from "./components/Aside";
import Card from "./components/Card";
import { Container } from "./components/Container";
import { DailyBudget } from "./components/DailyBudget";
import { Main } from "./components/Main";
import { SavingsStatus } from "./components/SavingsStatus";
import { SearchInput } from "./components/SearchInput";
import { Typography } from "./components/Typography";
import { List } from "./components/List";
import { v4 as uuidv4 } from 'uuid';
import { TransactionItem } from "./components/TransactionItem";
import { AccountItem } from "./components/AccountItem";
import { Button } from "./components/Button";
import { IconCurrency, IconWallet } from "./assets/Icons/Icons";

const TRANSACTIONS = [
  {
    "id": uuidv4(),
    "description": "iFood",
    "value": -20,
    "date": "2024-10-01T00:00:00-03:00"
  },
  {
    "id": uuidv4(),
    "description": "Papelaria Mila",
    "value": -80,
    "date": "2024-10-03T00:00:00-03:00"
  },
  {
    "id": uuidv4(),
    "description":
      "Freela (2ª parte)",
    "value": 1000,
    "date": "2024-10-03T00:00:00-03:00"
  },
  {
    "id": uuidv4(),
    "description":
      "Magazine Luiza",
    "value": -300,
    "date": "2024-10-05T00:00:00-03:00"
  }
];

const ACCOUNTS = [
  {
    "id": uuidv4(),
    "bank": "Anybank",
    "balance": 1200
  },
  {
    "id": uuidv4(),
    "bank": "Bytebank",
    "balance": 800
  },
  {
    "id": uuidv4(),
    "bank": "Switch Bank",
    "balance": 1800
  }
];


function App() {
  return (
    <>
      <Container>
        <Aside />
        <Main>
          <SearchInput
            placeholder="Procure seu dinheiro..."
            name="search"
            id="search"
            autoComplete="off"
          />
          <div>
            <Typography variant="h1">
              Olá, Cleiton!
            </Typography>
            <Typography>
              Veja como estão suas finanças hoje.
            </Typography>
          </div>
          <section className="w-full grid items-stretch gap-6  grid-cols-2">
            <Card>
              <Card.Header>
                <Typography variant="h2">
                  Orçamento diário disponível:
                </Typography>
              </Card.Header>
              <Card.Body>
                <DailyBudget value={37.55} />
              </Card.Body>
            </Card>
            <Card>
              <Card.Header>
                <Typography variant="h2">
                  Progresso da meta financeira:
                </Typography>
              </Card.Header>
              <Card.Body>
                <SavingsStatus percent={40} />
              </Card.Body>
            </Card>
            <Card>
              <Card.Header>
                <Typography variant="h3">
                  Movimentação financeira:
                </Typography>
              </Card.Header>
              <Card.Body>
                <List items={TRANSACTIONS} renderItem={TransactionItem} />
                <Button>
                  <IconCurrency />
                  Adicionar transação
                </Button>
              </Card.Body>
            </Card>
            <Card>
              <Card.Header>
                <Typography variant="h3">
                  Minhas contas:
                </Typography>
              </Card.Header>
              <Card.Body>
                <List items={ACCOUNTS} renderItem={AccountItem} />
                <Button>
                  <IconWallet />
                  Adicionar conta
                </Button>
              </Card.Body>
            </Card>
          </section>
        </Main>
      </Container>
    </>
  )
}

export default App
