import SocialIcon from "../SocialIcon";
import "./Footer.css";

const Footer = () => {
  const socialIcons = [
    {
      key: 1,
      url: "https://www.facebook.com/",
      imgPath: "/images/fb.png",
      alt: "Facebook",
    },
    {
      key: 2,
      url: "https://twitter.com/",
      imgPath: "/images/tw.png",
      alt: "Twitter",
    },
    {
      key: 3,
      url: "https://www.instagram.com/",
      imgPath: "/images/ig.png",
      alt: "Instagram",
    },
  ];

  return (
    <footer className="footer-container">
      <ul className="footer-container__social-icons">
        {socialIcons.map((socialIcon) => (
          <li
            className="footer-container__social-icons-item"
            key={socialIcon.key}
          >
            <SocialIcon {...socialIcon} />
          </li>
        ))}
      </ul>
      <img
        src="/images/logo.png"
        alt="Logo do Organo"
        className="footer-container__logo"
      />
      <p className="footer-container__author">Desenvolvido por <strong>Cleiton Cunha</strong></p>
    </footer>
  );
};

export default Footer;
