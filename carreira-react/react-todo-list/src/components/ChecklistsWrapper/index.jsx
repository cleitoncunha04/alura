import './checklists-wrapper.style.css'

export function ChecklistsWrapper({ children }) {
    return <section className='wrapper'>
        {children}
    </section>
}