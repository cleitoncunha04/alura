import { IconSavings } from "../../assets/Icons/Icons";
import { Typography } from "../Typography";

export const SavingsStatus = ({ percent }) => {
    return (
        <>
            <div className="flex items-center text-secondary-income gap-2">
                <IconSavings />
                <Typography variant="h3">
                    Economizar
                </Typography>
            </div>
            <div className="bg-neutral-darker w-full h-10 rounded-lg overflow-hidden">
                <div
                    style={{ width: `${percent}%` }}
                    className=" 
                        h-full 
                        bg-primary-highlight  
                        flex 
                        items-center 
                        justify-center 
                        text-neutral-darker
                        transition-all
                        duration-500
                        ease-in-out
                    ">
                    <Typography variant="span">
                        {percent}%
                    </Typography>
                </div>
            </div>
        </>
    );
}