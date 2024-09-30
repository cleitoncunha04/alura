import './Player.css';
import Icon from "../Icon";
import { AiFillCloseCircle } from "react-icons/ai";


const Player = ({ onDelete, primaryColor, nickname, image, main }) => {
    return (
        <div className="container__player">
            {/*<div className='container__delete-player'>
                <button className='container__delete-player__button' onClick={onDelete}>
                    <Icon iconName='close'/>
                </button>
            </div>*/}

            <AiFillCloseCircle size={25} className='container__delete-player' onClick={onDelete}/>

            <div className="container__player__header" style={{backgroundColor: primaryColor}}>
                <img className="container__player__header-image"
                     src={image}
                     alt={nickname}/>
            </div>

            <div className="container__player__footer">
                <h4 className="container__player__footer-nickname">{nickname}</h4>
                <h5 className="container__player__footer-main">{main}</h5>
            </div>
        </div>
    );
};

export default Player;