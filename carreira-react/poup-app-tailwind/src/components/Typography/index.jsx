const TAGS = {
    h1: 'h1',
    h2: 'h2',
    h3: 'h3',
    p: 'p',
    strong: 'strong',
    span: 'span',
    
}

const STYLES = {
    h1: 'text-[31px] font-bold leading-[120%]',
    h2: 'text-xl font-bold leading-[120%]',
    h3: 'text-[21px] leading-[150%]',
    p: 'text-base leading-[120%]',
    strong: 'text-[39px] font-bold leading-[125%]',
    span: 'text-base leading-[120%] font-medium',
}

export const Typography = ({ variant, children }) => {
    const Component = TAGS[variant] || 'p';
    const style = STYLES[variant] || STYLES['p'];

    return (
        <Component className={style}>
            {children}
        </Component>
    );
};