import { Link } from "react-router-dom";
import styles from "./index.module.css"
type props = {
    title: string;
    description: string;
    url: string;
}

export const Title = ({ title, description, url }: props) => {
    return (
        < div className={styles.header} >
            <div>
                <span className={styles.eyebrow}>ACTUALIDAD</span>
                <h2>{title}</h2>
                <p>{description}</p>
            </div>

            <Link to={url} className={styles.viewAll}>
                Ver todas
                <span>→</span>
            </Link>
        </div >

    )
}