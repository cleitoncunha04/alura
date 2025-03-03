const express = require('express');
const bodyParser = require('body-parser');
const uuid = require('uuid');

const app = express();
app.use(bodyParser.json());

const PORT = 3001;

class User{
  constructor(id, email, password, name){
    this.id = id;
    this.email = email;
    this.password = password;
    this.name = name;
  }
}

const users = [
  new User("ID001", "dandara@alura.com.br", "123321", "Dandara"),
  new User("ID002", "ricarth@alura.com.br", "123321", "Ricarth"),
];

app.post('/signup', (req, res) => {
  const { email, password, name } = req.body;

  if (email === undefined || password === undefined || name === undefined){
    return res.status(400).json({erro: "requisicao invalida"});
  }

  const newUser = { id: uuid.v4(), email, password, name };
  users.push(newUser);
  res.json({ mensagem: 'usuario criado com sucesso' });
});

app.post('/login', (req, res) => {
  const { email, password } = req.body;

  if (email === undefined || password === undefined){
    return res.status(400).json({erro: "requisicao invalida"});
  }

  const user = users.find((u) => u.email === email && u.password === password);
  if (user) {
    res.json({ mensagem: 'login realizado', user });
  } else {
    res.status(401).json({ erro: 'credenciais invalidas' });
  }
});

app.get('/find-id/:userId', (req, res) => {
  const userId = req.params.userId;

  if (userId === undefined ){
    return res.status(400).json({erro: "requisicao invalida"});
  }

  const user = users.find((u) => u.id === userId);
  if (user) {
    res.json({id: user.id, name: user.name});
  } else {
    res.status(401).json({ erro: 'usuario nao encontrado' });
  }
});

app.get('/find-email/:email', (req, res) => {
  const email = req.params.email;

  if (email === undefined){
    return res.status(400).json({erro: "requisicao invalida"});
  }

  const user = users.find((u) => u.email === email);

  if (user) {
    res.json({id: user.id, name: user.name});
  } else {
    res.status(401).json({ erro: 'usuario nao encontrado' });
  }
});

app.listen(PORT, () => {
  console.log(`Serviço de Autenticação: Rodando na porta ${PORT}.`);
});

