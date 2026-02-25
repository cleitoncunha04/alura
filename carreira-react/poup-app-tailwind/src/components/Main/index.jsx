export const Main = ({ children }) => {
    return (
        <main className="py-20 w-full flex flex-col items-start justify-start gap-10">
            {children}
        </main>
    );
};