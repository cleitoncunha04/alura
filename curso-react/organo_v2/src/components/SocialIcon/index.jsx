import "./SocialIcon.css";

const SocialIcon = (props) => {
  return (
    <a
      href={props.url}
      className="social-icon-container__link"
      target="_blank"
      rel="noreferrer"
    >
      <img
        src={props.imgPath}
        alt={props.alt}
        className="social-icon-container__img"
      />
    </a>
  );
};

export default SocialIcon;
