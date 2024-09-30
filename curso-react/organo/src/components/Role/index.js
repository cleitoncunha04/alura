import './Role.css';
import Player from "../Player";

const Role = (props) => {
    const css = {backgroundColor: props.secondColor};

    return (
        //renderização condicional no React
        (props.players.length > 0) ? <section className='role' style={css}>
                <h3 className='role__title'>{props.name}</h3>
                <div className='role__title-underline' style={{backgroundColor: props.primaryColor}}></div>

                <div className='role__content'>
                    { props.players.map(player => {


                            return <Player
                                    primaryColor={props.primaryColor}
                                    nickname={player.nickname}
                                    image={player.image}
                                    main={player.main}
                                    key={player.nickname}
                                    onDelete={props.onDelete}
                            />
                        })
                    }
                </div>
            </section>
            : ''
    );
};

export default Role;