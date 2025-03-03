const express = require('express');
const bodyParser = require('body-parser');
const uuid = require('uuid');

const app = express();
app.use(bodyParser.json());

class Transaction{
  constructor(id, senderId, receiverId, amount, date, type){
    this.id = id;
    this.senderId = senderId;
    this.receiverId = receiverId;
    this.amount = amount;
    this.date = date;
    this.type = type;
  }
}

const transactions = [
  new Transaction(uuid.v4(), "ID001", "ID002", 25.50, "2022-10-13 17:18:45.595" , 0),
  new Transaction(uuid.v4(), "ID002", "ID001", 38.50, "2023-03-19 17:18:45.595" , 1),
  new Transaction(uuid.v4(), "ID001", "ID001", 118, "2023-02-05 17:18:45.595" , 2),
  new Transaction(uuid.v4(), "ID001", "ID001", 4.20, "2022-08-20 17:18:45.595" , 3),
];

const PORT = 3003;

app.post('/create-transaction', (req, res) => {
  const { senderId, receiverId, amount, type, date } = req.body;

  if (senderId === undefined || receiverId === undefined || amount === undefined || type === undefined || date === undefined){
    return res.status(400).json({erro: "requisicao invalida"});
  }

  const newTransaction = new Transaction(
    uuid.v4(),
    senderId,
    receiverId,
    amount,
    date,
    type,
  );
  transactions.push(newTransaction);
  res.json({ mensagem: 'transacao criada com sucesso', transaction: newTransaction });
});

app.get('/transactions/:userId', (req, res) => {
  const userId = req.params.userId;

  if (userId === undefined){
    return res.status(400).json({erro: "requisicao invalida"});
  }

  const transactionsFromSender = transactions.filter((t) => t.senderId === userId || t.receiverId === userId);
  if (transactionsFromSender.length > 0) {
    return res.json(transactionsFromSender);
  } else {
    return res.status(404).json({ erro: 'nenhuma transacao encontrada' });
  }
});

app.listen(PORT, () => {
  console.log(`Serviço de Transação: Rodando na porta ${PORT}.`);
});
