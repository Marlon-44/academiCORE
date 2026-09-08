package com.academicore.campus.application.usecase;

import com.academicore.campus.domain.model.ProgramaCampus;
import com.academicore.campus.domain.repository.ProgramaCampusRepository;
import com.academicore.pensum.domain.exception.ConflictException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProgramaCampusUseCase {

    private final ProgramaCampusRepository repository;

    @Transactional
    public void vincular(Long programaId, Long campusId) {
        if (repository.existsByProgramaIdAndCampusId(programaId, campusId)) {
            throw new ConflictException("El programa ya está vinculado a este campus");
        }
        ProgramaCampus pc = ProgramaCampus.builder()
                .programaId(programaId)
                .campusId(campusId)
                .estado("ACTIVO")
                .build();
        repository.save(pc);
    }

    @Transactional(readOnly = true)
    public List<ProgramaCampus> campusDePrograma(Long programaId) {
        return repository.findByProgramaId(programaId);
    }
}
