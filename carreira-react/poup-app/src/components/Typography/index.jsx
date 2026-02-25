import typography from './Typography.module.css';

const TAGS = {
    h1: 'h1',
    h2: 'h2',
    h3: 'h3',
    body: 'p',
}

const CLASS_NAMES = {
    h1: typography.xxl_bold,
    h2: typography.l_bold,
    h3: typography.m_medium,
    body: typography.m_regular,
}

export const Typography = ({ children, variant, color }) => {
    const Component = TAGS[variant] || TAGS.body;
    const className = CLASS_NAMES[variant] || CLASS_NAMES.body;

    return (
        <Component
            className={className}
            style={{ color: color }}
        >
            {children}
        </Component>
    );
};  