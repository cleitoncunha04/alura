import './TextField.css';
import Icon from "../Icon";
import {useState} from "react";

const TextField = (props) => {
   /* const [value, setValue] = useState(''); //hook do estado -> retorna 2 valores: o valor e um setter do valor*/

    const onType = (evt) => {
        props.onChange(evt.target.value);
    };

    return (
        <div className="text-field">
            <Icon iconName={props.span} className="text-field__icon"/>

            <input
                type="text"
                placeholder={`${props.placeholder}...`}
                className="text-field__input"
                required={props.required}
                onChange={onType}
                value={props.value}
            />
        </div>
    );
};


export default TextField;