import './TextField.css';

const Index = (props) => {
    return (
        <div className="text-field">
            <span className="material-symbols-outlined text-field__icon">
                {props.span}
            </span>

            <input
                type="text"
                placeholder={`${props.placeholder}...`}
                className="text-field__input"
            />
        </div>
    );
};


export default Index;