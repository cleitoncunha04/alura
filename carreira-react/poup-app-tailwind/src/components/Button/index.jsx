export const Button = ({ children })=> {
    return (
        <button className="border border-neutral-text border-solid rounded-3xl px-6 py-3 flex items-center gap-2 text-base font-medium leading-[120%] cursor-pointer">
            {children}
        </button>
    );
};