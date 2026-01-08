
import { use } from "react"
import TodoContext from "./components/TodoProvider/TodoContext.js";
import { ChecklistsWrapper } from "./components/ChecklistsWrapper"
import { Container } from "./components/Container"
import { FabButton } from "./components/FabButton"
import { Footer } from "./components/Footer"
import { Header } from "./components/Header"
import { Heading } from "./components/Heading"
import { IconPlus, IconSchool } from "./components/icons"
import Dialog from "./components/Dialog"
import TodoForm from "./components/TodoForm";
import TodoGroup from "./components/TodoGroup";
import EmptyState from "./components/EmpyState/index.jsx";

function App() {

  const {
    todos,
    selectedTodo,
    updateTodo,
    addTodo,
    showDialog,
    openDialog,
    closeDialog
  } = use(TodoContext);

  const handleFormAction = (formData) => {
    selectedTodo ? updateTodo(formData) :
      addTodo(formData);

    closeDialog();
  };

  return (
    <main>
      <Container>
        <Header>
          <Heading>
            <IconSchool /> Plano de estudos
          </Heading>
        </Header>
        <ChecklistsWrapper>
          <TodoGroup
            title='Para Estudar'
            todos={todos.filter((t) => t.completed === false)}
          />

          {
            todos.length === 0 &&
            <EmptyState />
          }

          <TodoGroup
            title='Concluído'
            todos={todos.filter((t) => t.completed)}
          />

          <Footer>
            <Dialog
              showDialog={showDialog}
              onClose={closeDialog}
            >
              <TodoForm
                action={handleFormAction}
                defaultValue={selectedTodo?.description}
              >
              </TodoForm>
            </Dialog>

            <FabButton onClick={() => openDialog()}>
              <IconPlus />
            </FabButton>
          </Footer>
        </ChecklistsWrapper>
      </Container>
    </main>
  )
}

export default App
