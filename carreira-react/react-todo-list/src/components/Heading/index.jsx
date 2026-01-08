import './heading.style.css'

export function Heading ({ children }) {
    return (
        <h1 className='heading'>
            { children }
        </h1>
    )
}