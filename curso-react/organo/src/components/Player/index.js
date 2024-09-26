import './Player.css';

const Player = ({ primaryColor, nickname, image, main }) => {
    return (
        <div className="container__player">
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