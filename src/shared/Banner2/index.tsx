import styles from './index.module.css';

export const Banner2 = () => {
    return (
            <div className={styles.container}>
                <h3>Universidad de Cartagena. <br />Siempre a la altura de los timepos</h3>
                <img src="/assets/estudiante.png" alt="Banner Image" className={styles.bannerImage} />
                <p>Universidad líder del Caribe colombiano y con una trayectoria de más de 40 años de cultura de calidad institucional.</p>
            </div>

    );
}
