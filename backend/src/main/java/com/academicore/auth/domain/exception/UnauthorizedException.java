package com.academicore.auth.domain.exception;

import com.academicore.pensum.domain.exception.BusinessException;

public class UnauthorizedException extends BusinessException {

    public UnauthorizedException(String message) {
        super("NO_AUTORIZADO", message);
    }
}
