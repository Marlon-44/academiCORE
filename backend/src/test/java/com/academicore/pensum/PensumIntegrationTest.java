package com.academicore.pensum;

import com.academicore.pensum.application.dto.*;
import com.academicore.pensum.application.usecase.*;
import com.academicore.pensum.domain.exception.BusinessException;
import com.academicore.pensum.domain.exception.ConflictException;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@ActiveProfiles("test")
@Transactional
class PensumIntegrationTest {

        @Autowired
        private CrearUniversidadUseCase crearUniversidadUseCase;
        @Autowired
        private CrearFacultadUseCase crearFacultadUseCase;
        @Autowired
        private CrearDepartamentoAcademicoUseCase crearDepartamentoUseCase;
        @Autowired
        private CrearProgramaAcademicoUseCase crearProgramaUseCase;
        @Autowired
        private CrearPlanEstudiosUseCase crearPlanEstudiosUseCase;
        @Autowired
        private CambiarEstadoPensumUseCase cambiarEstadoUseCase;
        @Autowired
        private AgregarNivelCurricularUseCase agregarNivelUseCase;
        @Autowired
        private RegistrarAsignaturaUseCase registrarAsignaturaUseCase;
        @Autowired
        private AgregarAsignaturaAPlanUseCase agregarAsignaturaAPlanUseCase;
        @Autowired
        private DefinirRequisitoUseCase definirRequisitoUseCase;
        @Autowired
        private ConsultarMallaCompletaUseCase consultarMallaUseCase;

        private PlanEstudiosResponse crearFlujoCompleto() {
                UniversidadResponse univ = crearUniversidadUseCase.execute(
                                CrearUniversidadRequest.builder().codigo("U001").nombre("Universidad Test").build());

                FacultadResponse fac = crearFacultadUseCase.execute(
                                CrearFacultadRequest.builder().universidadId(univ.getId()).codigo("F001")
                                                .nombre("Facultad de Ingeniería").build());

                DepartamentoResponse dep = crearDepartamentoUseCase.execute(
                                CrearDepartamentoRequest.builder().facultadId(fac.getId()).codigo("D001")
                                                .nombre("Departamento de Sistemas").build());

                ProgramaResponse prog = crearProgramaUseCase.execute(
                                CrearProgramaRequest.builder().facultadId(fac.getId()).codigoInterno("P001")
                                                .codigoSnies("12345")
                                                .nombre("Ingeniería de Sistemas").creditosTotales(144).build());

                return crearPlanEstudiosUseCase.execute(
                                CrearPlanEstudiosRequest.builder().programaId(prog.getId()).periodicidadId(1L)
                                                .codigoPensum("2026").nombre("Pensum 2026")
                                                .fechaVigenciaDesde(LocalDate.of(2026, 1, 1))
                                                .totalCreditos(144).build());
        }

        @Test
        void noSePuedeActivarUnPensumQueNoEstaAprobado() {
                PlanEstudiosResponse plan = crearFlujoCompleto();

                assertEquals("EN_DISENO", plan.getEstado());

                BusinessException ex = assertThrows(BusinessException.class,
                                () -> cambiarEstadoUseCase.execute(plan.getId(),
                                                CambiarEstadoPensumRequest.builder().nuevoEstado("VIGENTE").build()));

                assertTrue(ex.getMessage().contains("APROBADO"));
        }

        @Test
        void prerrequisitoDebeEstarEnNivelAnteriorOIgual() {
                PlanEstudiosResponse plan = crearFlujoCompleto();

                cambiarEstadoUseCase.execute(plan.getId(),
                                CambiarEstadoPensumRequest.builder().nuevoEstado("APROBADO").build());

                NivelCurricularResponse nivel1 = agregarNivelUseCase.execute(plan.getId(),
                                AgregarNivelCurricularRequest.builder().numeroNivel(1).nombre("Nivel 1").build());
                NivelCurricularResponse nivel2 = agregarNivelUseCase.execute(plan.getId(),
                                AgregarNivelCurricularRequest.builder().numeroNivel(2).nombre("Nivel 2").build());

                AsignaturaResponse asig1 = registrarAsignaturaUseCase.execute(
                                RegistrarAsignaturaRequest.builder().departamentoId(1L).codigo("PROG1")
                                                .nombre("Programación I").build());
                AsignaturaResponse asig2 = registrarAsignaturaUseCase.execute(
                                RegistrarAsignaturaRequest.builder().departamentoId(1L).codigo("PROG2")
                                                .nombre("Programación II").build());

                PlanAsignaturaResponse pa1 = agregarAsignaturaAPlanUseCase.execute(plan.getId(),
                                AgregarAsignaturaAPlanRequest.builder().asignaturaId(asig1.getId())
                                                .nivelCurricularId(nivel1.getId())
                                                .tipoAsignaturaId(1L).creditos(new BigDecimal("3.00"))
                                                .horasDocenciaSemanales(new BigDecimal("2.00"))
                                                .horasTrabajoIndependiente(new BigDecimal("4.00"))
                                                .esHabilitable(true).build());

                PlanAsignaturaResponse pa2 = agregarAsignaturaAPlanUseCase.execute(plan.getId(),
                                AgregarAsignaturaAPlanRequest.builder().asignaturaId(asig2.getId())
                                                .nivelCurricularId(nivel2.getId())
                                                .tipoAsignaturaId(1L).creditos(new BigDecimal("3.00"))
                                                .horasDocenciaSemanales(new BigDecimal("2.00"))
                                                .horasTrabajoIndependiente(new BigDecimal("4.00"))
                                                .esHabilitable(true).build());

                assertDoesNotThrow(() -> definirRequisitoUseCase.execute(plan.getId(), pa2.getId(),
                                DefinirRequisitoRequest.builder().planAsignaturaRequeridaId(pa1.getId())
                                                .tipoRequisitoId(1L).build()));

                BusinessException ex = assertThrows(BusinessException.class,
                                () -> definirRequisitoUseCase.execute(plan.getId(), pa1.getId(),
                                                DefinirRequisitoRequest.builder().planAsignaturaRequeridaId(pa2.getId())
                                                                .tipoRequisitoId(1L).build()));

                assertTrue(ex.getMessage().contains("nivel curricular anterior o igual"));
        }

        @Test
        void flujoCompletoCrearPensumYMalla() {
                PlanEstudiosResponse plan = crearFlujoCompleto();

                cambiarEstadoUseCase.execute(plan.getId(),
                                CambiarEstadoPensumRequest.builder().nuevoEstado("APROBADO").build());

                NivelCurricularResponse nivel1 = agregarNivelUseCase.execute(plan.getId(),
                                AgregarNivelCurricularRequest.builder().numeroNivel(1).nombre("Nivel 1").build());

                AsignaturaResponse asig = registrarAsignaturaUseCase.execute(
                                RegistrarAsignaturaRequest.builder().departamentoId(1L).codigo("MAT101")
                                                .nombre("Matemáticas I").build());

                agregarAsignaturaAPlanUseCase.execute(plan.getId(),
                                AgregarAsignaturaAPlanRequest.builder().asignaturaId(asig.getId())
                                                .nivelCurricularId(nivel1.getId())
                                                .tipoAsignaturaId(1L).creditos(new BigDecimal("4.00"))
                                                .horasDocenciaSemanales(new BigDecimal("3.00"))
                                                .horasTrabajoIndependiente(new BigDecimal("6.00"))
                                                .esHabilitable(true).build());

                MallaCurricularResponse malla = consultarMallaUseCase.execute(plan.getId());

                assertEquals("2026", malla.getCodigoPensum());
                assertEquals(1, malla.getNiveles().size());
                assertEquals(1, malla.getNiveles().get(0).getNumeroNivel());
                assertEquals(4, malla.getCreditosCalculados());
        }

        @Test
        void noSePuedeCrearUniversidadConCodigoDuplicado() {
                crearUniversidadUseCase.execute(
                                CrearUniversidadRequest.builder().codigo("DUP").nombre("Universidad 1").build());

                assertThrows(ConflictException.class, () -> crearUniversidadUseCase.execute(
                                CrearUniversidadRequest.builder().codigo("DUP").nombre("Universidad 2").build()));
        }
}
