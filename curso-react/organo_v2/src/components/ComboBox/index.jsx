import "./ComboBox.css";

const ComboBox = (props) => {
  return (
    <div className="combo-box-container">
      <label className="combo-box-container__label" htmlFor="combo_box_teams">
        {props.label}
      </label>
      <select
        name="combo-box-teams"
        id="combo_box_teams"
        className="combo-box-container__select"
        onChange={(event) => props.onChange(event.target.value)}
        value={props.value}
      >
        {props.items.map((item) => (
          <option
            className="combo-box-container__option"
            key={item.key}
            name=""
            value={item.name}
          >
            {item.name}
          </option>
        ))}
      </select>
    </div>
  );
};

export default ComboBox;
