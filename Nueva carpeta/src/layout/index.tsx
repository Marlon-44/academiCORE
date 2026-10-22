import { Outlet } from "react-router-dom"
import styles from "./index.module.css"
import { Header } from "../shared/Header"
import { Footer } from "../shared/Footer"

export const MainLayout = () => {
    return (
        <div className={styles.global__container}>
            <Header />
            <main className={styles.global__container}>
                <Outlet />
            </main>
            <Footer />
        </div>
    )
}