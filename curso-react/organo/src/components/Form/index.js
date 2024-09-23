import './Form.css';
import TextField from "../TextField";

const Form = () => {
    return (
        <section className="container">
            <form className="container__form">
                <h2 className="container__form-title">Fill in the data to create a card for the player</h2>
                <TextField span="person" placeholder="Fill in your name"/>
                <TextField span="hub" placeholder="Fill in your role position"/>
                <TextField span="image" placeholder="Fill in the URL of your image"/>
            </form>
        </section>
    );
};

export default Form;