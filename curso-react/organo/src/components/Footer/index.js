import './Footer.css';

const Footer = () => {
    return (
        <footer className='footer'>
            <div className='footer__social-media'>
                <a href="#" target="_blank">
                    <img src="/images/fb.png" alt="Link para o Facebook"/>
                </a>

                <a href="#" target="_blank">
                    <img src="/images/tw.png" alt="Link para o finado X"/>
                </a>

                <a href="#" target="_blank">
                    <img src="/images/ig.png" alt="Link para o Instagram"/>
                </a>
            </div>

            <img src="/images/logo.png" alt="Logo do organo" className='footer__logo'/>

            <p className='footer__author'>Cleiton Cunha</p>
        </footer>
    );
}

export default Footer;