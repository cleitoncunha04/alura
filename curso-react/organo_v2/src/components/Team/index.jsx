import Card from "../Card";
import "./Team.css";

const Team = (props) => {
  return (
    props.collaborators.length > 0 && (
      <section
        className="team-container"
        style={{ backgroundColor: props.backgroundColor }}
      >
        <div className="team-container__title">
          <h3 className="team-container__heading">{props.name}</h3>
          <div
            className="team-container__border"
            style={{ backgroundColor: props.highlightColor }}
          ></div>
        </div>

        <ul className="team-container__collaborators">
          {props.collaborators.map((collaborator) => (
            <li>
              <Card
                key={collaborator.name}
                {...collaborator}
                highlightColor={props.highlightColor}
              />
            </li>
          ))}
        </ul>
      </section>
    )
  );
};

export default Team;
