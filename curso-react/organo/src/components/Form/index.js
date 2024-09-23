import './Form.css';
import TextField from "../TextField";
import Dropdown from "../Dropdown";
import Button from "../Button";
import Icon from "../Icon";
import {useState} from "react";

const Form = (props) => {
    const roles = [
        'Controllers',
        'Duelist',
        'Flex',
        'Initiator',
        'Sentinel'
    ];

    let agents = [
        "Brimstone",
        "Phoenix",
        "Sage",
        "Sova",
        "Viper",
        "Cypher",
        "Omen",
        "Jett",
        "Breach",
        "Raze",
        "Reyna",
        "Killjoy",
        "Skye",
        "Yoru",
        "Astra",
        "KAY/O",
        "Chamber",
        "Neon",
        "Fade",
        "Harbor",
        "Gekko",
        "Deadlock",
        "Iso",
        "Vyse"
    ];

    agents.sort();

    const [nickname, setNickname] = useState('');
    const [image, setImage] = useState('');
    const [role, setRole] = useState('');
    const [main, setMain] = useState('');

    const onSave = (evt) => {
        evt.preventDefault();

        props.onRegiteredPlayer({
           nickname,
           image,
           role,
           main
        });
    };

    return (
        <section className="container">
            <form className="container__form" onSubmit={onSave}>
                <h2 className="container__form-title">Fill in the data to create a card for the player</h2>
                <TextField
                    required={true}
                    span="person"
                    placeholder="Fill in your nickname"
                    value={nickname}
                    onChange={name => setNickname(name)}
                />

                <TextField
                    span="image"
                    placeholder="Fill in the URL of your image"
                    value={image}
                    onChange={image => setImage(image)}
                />

                <Dropdown
                    required={true}
                    label="Select your role: "
                    items={roles}
                    value={role}
                    onChange={role => setRole(role)}
                />

                <Dropdown
                    required={true}
                    label="Select your main agent: "
                    items={agents}
                    value={main}
                    onChange={main => setMain(main)}
                />

                <Button>
                    <Icon iconName="add"/>
                    Create card
                </Button>
            </form>
        </section>
    );
};

export default Form;