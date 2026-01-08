import './container.style.css'

export function Container ({ children }) {
    return (<section className='container'>
        {children}
    </section>)
}