export const Container = ({ children }) => {
    return (
        <div className="bg-neutral-background min-h-screen max-w-300 flex gap-6 mx-auto">
            {children}
        </div>
    );
};