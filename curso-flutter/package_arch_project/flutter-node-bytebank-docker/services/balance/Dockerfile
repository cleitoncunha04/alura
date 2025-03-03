# Use a base image com Node.js instalado
FROM node:14

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie os arquivos do serviço para o diretório de trabalho
COPY package.json package-lock.json /app/
COPY balanceService.js /app/

# Instale as dependências
RUN npm install

# Defina o comando de inicialização do serviço
CMD ["node", "balanceService.js"]
