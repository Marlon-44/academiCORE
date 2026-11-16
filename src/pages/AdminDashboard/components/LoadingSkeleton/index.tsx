import styles from "../../index.module.css";

export function LoadingSkeleton({ cards = 3 }: { cards?: number }) {
    return (
        <div className={styles.skeletonGrid}>
            {Array.from({ length: cards }, (_, i) => (
                <div key={i} className={styles.skeletonCard} />
            ))}
        </div>
    );
}
