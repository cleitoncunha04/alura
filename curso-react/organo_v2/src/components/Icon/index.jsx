import "./Icon.css";

const Icon = (props) => {
  return (
    <>
      <span className="material-symbols-outlined">{props.iconName}</span>
    </>
  );
};

export default Icon;
