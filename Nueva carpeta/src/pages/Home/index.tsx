import { Banner2 } from "../../shared/Banner2"
import { CampusSection } from "../Campus";
import { AnunciosSection } from "./components/AnunciosSection";
import { GuiasSection } from "./components/GuiasSection";
import styles from "./index.module.css"

export const Home = () => {

    {/* const services = [
        {
            id: 1,
            title: "Pago en línea",
            description: "Realiza tus pagos de inscripción de forma rápida y segura.",
            linkText: "Ir a pagos",
            img: "/assets/payment.png"
        },
        {
            id: 2,
            title: "Imprime tu factura",
            description: "Consulta e imprime tu factura de inscripción.",
            linkText: "Descargar factura",
            img: "/assets/file.png"
        },
        {
            id: 3,
            title: "Convocatorias",
            description: "Consulta convocatorias vigentes y resultados.",
            linkText: "Ver convocatorias",
            img: "/assets/announcement.png"
        }
    ];
    console.log(services)*/}
    return (
        <div className={styles.homeContainer}>
            <h1>ACADEMI<span className={styles.highlight}>CORE</span></h1>
            <Banner2 />
            <AnunciosSection />
            <GuiasSection />
            <CampusSection/>
        </div>
    )
}