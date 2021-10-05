package com.jsoftware.platform.exception;

import org.springframework.http.HttpStatus;

//Exception 발생 시 Respons status는 Exception에 정의한 HttpStatus를 활용하여 에러 메시지와 HttpStatus의 value를 반환한다.

public abstract class AbstractEbloBaseException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public AbstractEbloBaseException() {
        super();
    }

    public AbstractEbloBaseException(String msg) {
        super(msg);
    }

    public AbstractEbloBaseException(Throwable e) {
        super(e);
    }

    public AbstractEbloBaseException(String errorMessage, Throwable e) {
        super(errorMessage, e);
    }

    public abstract HttpStatus getHttpStatus();

    public abstract String getDetailMessage();
}
