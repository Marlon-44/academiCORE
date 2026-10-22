import { Link } from "react-router-dom"
import styles from "./index.module.css"
type props ={
    title: string,
    description: string,
    linkText: string,
    img:string
}
export const ServiceCard = ({title, description, linkText, img}: props) => {
    return (

        
            <div className={styles.cardContainer}>
                <div className={styles.infoContainer}>
                    <div>
                        <h3>{title}</h3>
                        <p>{description}</p>
                    </div>
                    
                    <Link to="/" className={styles.refLink}>{linkText}</Link>
                </div>
                <img src={img} alt={title} />
            </div>


    )
}