import "./Card.css";

const Card = (props) => {
  return (
    <div className="card-container">
      <div
        className="card-container__header"
        style={{ backgroundColor: props.highlightColor }}
      >
        <img
          className="card-container__image"
          src={props.imageUrl}
          alt={props.name}
        />
      </div>
      <div className="card-container__footer">
        <h4>{props.name}</h4>
        <h5>{props.jobPosition}</h5>
      </div>
    </div>
  );
};

export default Card;
