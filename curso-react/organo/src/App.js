import Banner from "./components/Banner";
import Form from "./components/Form";
import {useState} from "react";

function App() {
    const [players, setPlayers] = useState([]);

    const onNewRegisteredPlayer = (player) => {
        setPlayers([
            ...players,
            player
        ]); // não posso fazer o players.push, ent tive q fazer assim

        console.log(players)
    };

    return (
        <div className="App">
            <Banner />
            <Form onRegiteredPlayer={onNewRegisteredPlayer}/>
        </div>
    );
}

export default App;
