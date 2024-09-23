import './TextField.css';
import Icon from "../Icon";

const TextField = (props) => {
    return (
        <div className="text-field">
            <Icon iconName={props.span} className="text-field__icon"/>

            <input
                type="text"
                placeholder={`${props.placeholder}...`}
                className="text-field__input"
                required={props.required}
            />
        </div>
    );
};


export default TextField;