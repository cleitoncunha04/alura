const Card = ({ children }) => {
    return (
        <div className="
            bg-neutral-surface
            min-h-[14.188rem] 
            rounded-3xl
            flex
            flex-col
         "
        >
            {children}
        </div>
    );
};

export const CardHeader = ({ children }) => {
    return (
        <div className="
            bg-neutral-header 
            p-4 
            rounded-t-3xl 
            text-center
            max-h-[4.188rem]
            w-full"
        >
            {children}
        </div>
    );
};

export const CardBody = ({ children }) => {
    return (
        <div className="
            rounded-b-3xl 
            px-4 
            py-6 
            grow
            flex 
            flex-col 
            justify-between 
            items-center"
        >
            {children}
        </div>
    );
};

Card.Header = CardHeader;
Card.Body = CardBody;

export default Card;