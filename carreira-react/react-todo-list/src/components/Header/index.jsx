import './header.style.css'

export function Header ({ children }) {
    return (<header className="header">
        {children}
    </header>)
}