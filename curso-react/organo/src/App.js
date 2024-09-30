import Banner from "./components/Banner";
import Form from "./components/Form";
import {useState} from "react";
import Role from "./components/Role";
import Footer from "./components/Footer";

function App() {
    const roles = [
        {
            name: 'Controllers',
            primaryColor: '#57C278',
            secondColor: '#D9F7E9'
        },
        {
            name: 'Duelist',
            primaryColor: '#82CFFA',
            secondColor: '#E8F8FF'
        },
        {
            name: 'Flex',
            primaryColor: '#A6D157',
            secondColor: '#F0F8E2'
        },
        {
            name: 'Initiator',
            primaryColor: '#E06B69',
            secondColor: '#FDE7E8'
        },
        {
            name: 'Sentinel',
            primaryColor: '#DB6EBF',
            secondColor: '#FAE9F5'
        }
    ];

    const [players, setPlayers] = useState([]);

    const onNewRegisteredPlayer = (player) => {
        console.log(player);

        setPlayers([
            ...players,
            player
        ]); // não posso fazer o players.push, ent tive q fazer assim
    };

    const deletePlayer = () => {
        console.log('deleting');
    };

    return (
        <div className="App">
            <Banner/>
            <Form onRegisteredPlayer={onNewRegisteredPlayer} rolesName={roles.map(role => role.name)}/>
            {roles.map(role => <Role
                    key={role.name}
                    name={role.name}
                    primaryColor={role.primaryColor}
                    secondColor={role.secondColor}
                    players={players.filter(player => player.role === role.name)}
                    onDelete={deletePlayer}
                />
            )}
            <Footer />
        </div>
    );
}

export default App;
