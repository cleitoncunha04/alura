import Banner from "./components/Banner/Banner";
import Form from "./components/Form";
import { useState } from "react";
import Team from "./components/Team";
import Footer from "./components/Footer";
import TitleTeams from "./components/TitleTeams";

function App() {
  const [collaborators, setCollaborators] = useState([]);

  const teams = [
    {
      key: 1,
      name: "Programação",
      backgroundColor: "#D9F7E9",
      highlightColor: "#57C278",
    },
    {
      key: 2,
      name: "Front-End",
      backgroundColor: "#E8F8FF",
      highlightColor: "#82CFFA",
    },
    {
      key: 3,
      name: "Data Science",
      backgroundColor: "#F0F8E2",
      highlightColor: "#A6D157",
    },
    {
      key: 4,
      name: "Devops",
      backgroundColor: "#FDE7E8",
      highlightColor: "#E06B69",
    },
    {
      key: 5,
      name: "UX e Design",
      backgroundColor: "#FAE9F5",
      highlightColor: "#DB6EBF",
    },
    {
      key: 6,
      name: "Mobile",
      backgroundColor: "#FFF5D9",
      highlightColor: "#FFBA05",
    },
    {
      key: 7,
      name: "Inovação e Gestão",
      backgroundColor: "#FFFEDF",
      highlightColor: "#FF8A29",
    },
  ];

  return (
    <>
      <Banner />
      <main className="main">
        <Form
          teams={teams}
          onCollaboratorSaved={(collaborator) => {
            setCollaborators([...collaborators, collaborator]);
          }}
        />
        {collaborators.length > 0 && <TitleTeams />}
        {teams.map((team) => (
          <Team
            key={team.key}
            name={team.name}
            backgroundColor={team.backgroundColor}
            highlightColor={team.highlightColor}
            collaborators={collaborators.filter(
              (collaborator) => collaborator.team === team.name
            )}
          />
        ))}
      </main>
      <Footer />
    </>
  );
}

export default App;
