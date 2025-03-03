const express = require('express');
const axios = require('axios');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

const PORT = 3000;
const IP = "localhost";

// Defina as URLs dos serviços
const AUTH_SERVICE_URL = 'http://auth-service:3001';
const BALANCE_SERVICE_URL = 'http://balance-service:3002';
const TRANSACTION_SERVICE_URL = 'http://transaction-service:3003';

// Rotas para autenticação
app.post('/auth/signup', async (req, res) => {
  try {
    const response = await axios.post(`${AUTH_SERVICE_URL}/signup`, req.body);
    res.json(response.data);
  } catch (error) {
    res.status(error.response?.status || 500).json(error.response?.data || { message: 'Erro desconhecido ao cadastrar' });
  }
});

app.post('/auth/login', async (req, res) => {
  try {
    const response = await axios.post(`${AUTH_SERVICE_URL}/login`, req.body);
    res.json(response.data);
  } catch (error) {
    res.status(error.response?.status || 500).json(error.response?.data || { message: 'Erro desconhecido ao logar' });
  }
});

app.get('/auth/find-id', async (req, res) => {
  try {
    const response = await axios.get(`${AUTH_SERVICE_URL}/find-id/${req.query.userId}`);
    res.json(response.data);
  } catch (error) {
    res.status(error.response?.status || 500).json(error.response?.data || { message: 'Erro desconhecido ao consultar' });
  }
});

app.get('/auth/find-email', async (req, res) => {
  try {
    const response = await axios.get(`${AUTH_SERVICE_URL}/find-email/${req.query.email}`);
    res.json(response.data);
  } catch (error) {
    res.status(error.response?.status || 500).json(error.response?.data || { message: 'Erro desconhecido ao consultar' });
  }
});

// Rotas para saldo
app.post('/balance/has-pin', async (req, res) => {
  try {
    const response = await axios.post(`${BALANCE_SERVICE_URL}/has-pin`, req.body);
    res.json(response.data);
  } catch (error) {
    res.status(error.response?.status || 500).json(error.response?.data || { message: 'Erro desconhecido ao consultar o PIN' });
  }
});

app.post('/balance/create-pin', async (req, res) => {
  try {
    const response = await axios.post(`${BALANCE_SERVICE_URL}/create-pin`, req.body);
    res.json(response.data);
  } catch (error) {
    res.status(error.response?.status || 500).json(error.response?.data || { message: 'Erro desconhecido ao criar o PIN' });
  }
});

app.post('/balance/user-balance', async (req, res) => {
  try {
    const response = await axios.post(`${BALANCE_SERVICE_URL}/balance`, req.body);
    res.json(response.data);
  } catch (error) {
    res.status(error.response?.status || 500).json(error.response?.data || { message: 'Erro desconhecido ao consultar o saldo' });
  }
});

// Rotas para transações
app.post('/transaction/create-transaction', async (req, res) => {
  try {
    const response = await axios.post(`${TRANSACTION_SERVICE_URL}/create-transaction`, req.body);
    res.json(response.data);
  } catch (error) {
    res.status(error.response?.status || 500).json(error.response?.data || { message: 'Erro desconhecido ao criar uma transação' });
  }
});

app.get('/transaction/user-transactions/', async (req, res) => {
  try {
    const response = await axios.get(`${TRANSACTION_SERVICE_URL}/transactions/${req.query.userId}`);
    res.json(response.data);
  } catch (error) {
    res.status(error.response?.status || 500).json(error.response?.data || { message: 'Erro desconhecido ao consultar transações' });
  }
});

// Inicie o servidor
app.listen(PORT, () => {
  console.log(`BFF Mobile: Rodando na porta ${PORT}.`);
});
