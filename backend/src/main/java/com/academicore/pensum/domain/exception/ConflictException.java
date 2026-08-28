package com.academicore.pensum.domain.exception;

public class ConflictException extends BusinessException {

    public ConflictException(String message) {
        super("CONFLICT", message);
    }
}
