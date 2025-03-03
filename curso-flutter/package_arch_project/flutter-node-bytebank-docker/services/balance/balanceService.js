const express = require('express');
const bodyParser = require('body-parser');
const uuid = require('uuid');

const app = express();
app.use(bodyParser.json());

const PORT = 3002

class Balance {
  constructor(userId, balance, pin){
    this.userId = userId;
    this.balance = balance;
    this.pin = pin;
  }
}

const balances = [
  new Balance("ID001", 2350, "14863"),
];

app.post('/has-pin', (req, res) => {
  const {userId} = req.body;

  if (userId === undefined){
    return res.status(400).json({erro: "requisicao invalida"});
  }

  const balance = balances.find((u) => u.userId === userId);
  if (!balance){
    res.json({hasPin: false});
  }
  res.json({hasPin: true});
});

app.post('/create-pin', (req, res) => {
  const { userId, newPin } = req.body;  

  if (userId === undefined || newPin === undefined){
    return res.status(400).json({erro: "requisicao invalida"});
  }
  
  var newBalance = new Balance(userId, Math.floor(Math.random() * 1999.9) + 1000, newPin);

  const bal = balances.push(newBalance);

  res.json({ balance: newBalance.balance });
});

app.post('/balance', (req, res) => {
  const { userId, pin } = req.body;

  if (userId === undefined || pin === undefined){
    res.status(400).json({erro: "requisicao invalida"});
  }

  const bal = balances.find((acc) => acc.userId === userId && acc.pin === pin);

  if (!bal) {
    return res.status(401).json({ erro: 'pin inválido' });
  }

  res.json({ balance: bal.balance });
});

app.listen(PORT, () => {
  console.log(`Serviço de Saldo: Rodando na porta ${PORT}.`);
});
