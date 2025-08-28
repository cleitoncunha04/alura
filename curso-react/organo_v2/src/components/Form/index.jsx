import "./Form.css";
import TextField from "../TextField";
import Button from "../Button";
import ComboBox from "../ComboBox";
import { useState } from "react";

const Form = (props) => {
  const [nameValue, setNameValue] = useState("");

  const [jobPositionValue, setJobPositionValue] = useState("");

  const [imageUrlValue, setImageUrlValue] = useState("");

  const [teamValue, setTeamValue] = useState(props.teams[0].name);

  function cleanFields() {
    setNameValue("");
    setJobPositionValue("");
    setImageUrlValue("");
    setTeamValue(props.teams[0].name);
  }

  return (
    <section className="form-container">
      <form
        onSubmit={(event) => {
          event.preventDefault();

          const collaborator = {
            name: nameValue,
            jobPosition: jobPositionValue,
            imageUrl: imageUrlValue,
            team: teamValue,
          };

          props.onCollaboratorSaved(collaborator);

          cleanFields();
        }}
        className="form-container__form"
      >
        <h2 className="form-container__title">
          Preencha os dados para criar o card do colaborador:
        </h2>
        <TextField
          value={nameValue}
          onChange={(value) => setNameValue(value)}
          name="name"
          id="name"
          placeholder="Informe o seu nome..."
          iconName="person"
          required={true}
        />
        <TextField
          value={jobPositionValue}
          onChange={(value) => setJobPositionValue(value)}
          name="job-position"
          id="job_position"
          placeholder="Informe o seu cargo..."
          iconName="work"
          required={true}
        />
        <TextField
          value={imageUrlValue}
          onChange={(value) => setImageUrlValue(value)}
          name="image-url"
          id="image_url"
          placeholder="Informe o endereço da imagem..."
          iconName="image"
        />
        <ComboBox
          label="Time:"
          items={props.teams}
          onChange={(value) => setTeamValue(value)}
          value={teamValue}
        />
        <Button>Criar Card</Button>
      </form>
    </section>
  );
};

export default Form;
