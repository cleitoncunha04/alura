import { useEffect, useState } from 'react'
import './App.css'



function App() {
  const [dogs, setDogs] = useState([]);

  const [isLoading, setIsLoading] = useState(false);

  const fetchDogs = (name) => {
    setIsLoading(true);

    setTimeout(() => {
      setIsLoading(false);
    }, 2000);

    const url = name === ''
      ? 'http://localhost:8080/doguinhos'
      : `http://localhost:8080/doguinhos?nome=${name}`;

    fetch(url)
      .then((response) => response.json())
      .then((data) => setDogs(data));
  }

  useEffect(() => fetchDogs(''), []);

  const onSubmit = (event) => {
    event.preventDefault();

    const formData = new FormData(event.target);
    
    const name = formData.get('name') || '';
    
    fetchDogs(name);
  }

  return (
    <>
      <h1>Bem-vindo aos Doguinhos!</h1>
      <h2>Confira abaixo uma lista das raças dos doguinhos</h2>
      <form onSubmit={onSubmit}>
        <input type="text" name="name" placeholder="Buscar por nome" autoComplete='off' />
        <button type="submit">Buscar</button>
      </form>
      {isLoading ? (<p>Carregando...</p>) : (
        <ul>
          {dogs.map((dog) => (
            <li key={dog.id}>{dog.nome}</li>
          ))}
        </ul>
      )}

    </>
  )
}

export default App
