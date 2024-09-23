import './Form.css';
import TextField from "../TextField";
import Dropdown from "../Dropdown";
import Button from "../Button";
import Icon from "../Icon";

const Form = () => {
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

    const onSave = (evt) => {
        evt.preventDefault();

        console.log('submitted form')
    };

    return (
        <section className="container">
            <form className="container__form" onSubmit={onSave}>
                <h2 className="container__form-title">Fill in the data to create a card for the player</h2>
                <TextField required={true} span="person" placeholder="Fill in your nickname"/>
                <TextField span="image" placeholder="Fill in the URL of your image"/>
                <Dropdown required={true} label="Select your role: " items={roles}/>
                <Dropdown required={true} label="Select your main agent: " items={agents}/>
                <Button>
                    <Icon iconName="add"/>
                    Create card
                </Button>
            </form>
        </section>
    );
};

export default Form;