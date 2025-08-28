import "./TextField.css";
import Icon from "../Icon";

const TextField = (props) => {
  return (
    <>
      <div className="text-field">
        <Icon iconName={props.iconName} />
        <input
          value={props.value}
          onChange={(event) => props.onChange(event.target.value)}
          className="text-field__input"
          type="text"
          name={props.name}
          id={props.id}
          autoComplete={props.name}
          placeholder={props.placeholder}
          required={props.required}
        />
      </div>
    </>
  );
};

export default TextField;
