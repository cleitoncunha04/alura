import './Icon.css';

const Icon = (props) => {
    const className = `material-symbols-outlined ${props.className ? props.className : ""}`;

    return (
        <span className={className}>
            {props.iconName}
        </span>
    );
};

export default Icon;