import { Children, use, useEffect, useRef } from "react"
import { IoMdClose } from "react-icons/io";
import './dialog.style.css';

const Dialog = ({ showDialog, onClose, children }) => {
    const dialogRef = useRef(null);

    const openDialog = () => {
        dialogRef.current.showModal();
    }

    const closeDialog = () => {
        dialogRef.current.close();
    }

    useEffect(() => showDialog ? openDialog() : closeDialog(),
        [showDialog]);

    useEffect(() => { 
        const dialogElement = dialogRef.current;

        dialogElement?.addEventListener('close', onClose);
        
        // return só é executado quando o componente é desmontado
        return () => {
            dialogElement?.removeEventListener('close', onClose);
        }
     }, [onClose]);

    return (
        <>
            <dialog className="dialog" ref={dialogRef}>
                <button
                    className="dialog-container__close-button"
                    onClick={onClose}
                >
                    <IoMdClose style={{ color: 'white' }} />
                </button>

                {children}
            </dialog>
        </>
    );
};

export default Dialog;