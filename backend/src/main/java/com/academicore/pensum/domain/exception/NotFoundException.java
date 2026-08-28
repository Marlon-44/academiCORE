package com.academicore.pensum.domain.exception;

public class NotFoundException extends BusinessException {

    public NotFoundException(String entity, Object id) {
        super("NOT_FOUND", entity + " no encontrado con id: " + id);
    }

    public NotFoundException(String entity, String field, Object value) {
        super("NOT_FOUND", entity + " no encontrado con " + field + ": " + value);
    }
}
