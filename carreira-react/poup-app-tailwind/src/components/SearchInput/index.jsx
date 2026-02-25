import { IconSearch } from "../../assets/Icons/Icons";

export const SearchInput = (props) => {
    return (
        <div className="
            bg-neutral-surface 
            min-h-14
            min-w-full
            rounded-lg 
            flex 
            items-center 
            gap-4 
            px-4 
            py-3 
            focus-within:ring-2 
            focus-within:ring-primary-highlight
        ">
            <IconSearch />
            <input 
                type="text" 
                {...props} 
                className="
                    flex-1 
                    text-xl 
                    leading-[125%]
                    placeholder-neutral-text 
                    focus:outline-none
            " />
        </div>
    );
};