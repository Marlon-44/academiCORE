import styles from "../../index.module.css";

export function ErrorAlert({ message }: { message: string }) {
    if (!message) return null;
    return (
        <div className={styles.loadError} role="alert">
            {message}
        </div>
    );
}
