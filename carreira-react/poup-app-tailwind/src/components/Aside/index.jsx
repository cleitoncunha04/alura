import logo from '../../assets/logo.svg';

export const Aside = () => {
    return (
        <aside className="bg-neutral-header min-h-screen max-w-70.5 py-20 px-10 flex flex-col gap-14">
            <img src={logo} alt="Logo da PoupApp" />
            <footer>
                <p className="text-[13px] leading-[120%] text-center">
                    Desenvolvido por Cleiton Cunha em conjuto com a Alura. Projeto fictício sem fins comerciais.
                </p>
            </footer>
        </aside>
    );
};