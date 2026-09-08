package com.academicore.campus.infrastructure.persistence.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "programa_campus")
@IdClass(ProgramaCampusEntity.PK.class)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProgramaCampusEntity {

    @Id
    @Column(name = "programa_id")
    private Long programaId;

    @Id
    @Column(name = "campus_id")
    private Long campusId;

    @Column(name = "estado", nullable = false, length = 20)
    private String estado;

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    public static class PK implements Serializable {
        private Long programaId;
        private Long campusId;

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (!(o instanceof PK pk)) return false;
            return Objects.equals(programaId, pk.programaId) && Objects.equals(campusId, pk.campusId);
        }

        @Override
        public int hashCode() {
            return Objects.hash(programaId, campusId);
        }
    }
}
