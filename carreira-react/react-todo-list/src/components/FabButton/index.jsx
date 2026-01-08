import './fab-button.style.css'

export function FabButton({ children, ...rest }) {
    return (
        <button className='fab' onClick={rest.onClick}>
            {children}
        </button>
    )
}