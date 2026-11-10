import { GraduationCap, Mail, MapPin } from "lucide-react";
import styles from "./index.module.css";
import type { Admin } from "../../../../types";


export const ProfileCard = ({ admin }: { admin: Admin }) => {

    return (
        <section className={styles.profileCard}>
            <div className={styles.profileAvatar}>
                <img src={admin.avatar} alt={admin.name} />
                <span className={styles.onlineIndicator} />
            </div>

            <h2>{admin.name}</h2>
            <span className={styles.profileRole}>{admin.role}</span>

            <div className={styles.profileDetails}>
                <div>
                    <MapPin size={15} />
                    <span>{admin.department}</span>
                </div>

                <div>
                    <GraduationCap size={15} />
                    <span>{admin.institution}</span>
                </div>
                <div>
                    <Mail size={15} />
                    <span>{admin.email}</span>
                </div>

                
            </div>

            <div className={styles.profileFooter}>
                <span>Periodo {admin.academicPeriod}</span>
            </div>
        </section>
    )
}