package com.jsoftware.platform.exception;

import org.springframework.http.HttpStatus;

public class EbloNotFoundException extends AbstractEbloBaseException {

    private static final long serialVersionUID = 1L;

    public EbloNotFoundException() {
        super();
    }

    public EbloNotFoundException(Throwable e) {
        super(e);
    }

    public EbloNotFoundException(String errorMessage) {
        super(errorMessage);
    }

    public EbloNotFoundException(String errorMessage, Throwable e) {
        super(errorMessage, e);
    }

    public HttpStatus getHttpStatus() {
        return HttpStatus.NOT_FOUND;
    }

    @Override
    public String getDetailMessage() {
        return null;
    }
}