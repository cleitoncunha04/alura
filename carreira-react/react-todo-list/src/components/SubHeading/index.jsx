import './sub-heading.style.css'

export function SubHeading ({ children }) {
    return (
        <h2 className='subheading'>
            { children }
        </h2>
    )
}