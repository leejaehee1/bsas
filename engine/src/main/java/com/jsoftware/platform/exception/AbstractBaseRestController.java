package com.jsoftware.platform.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice(basePackages = "com.jsoftware.platform.controller")
public class AbstractBaseRestController {

    @ExceptionHandler(AbstractEbloBaseException.class)
    protected ResponseEntity<ErrorResponse> handleApiException(AbstractEbloBaseException e) {
        return ResponseEntity
                .status(e.getHttpStatus())
                .body(
                        new ErrorResponse(
                                e.getHttpStatus().value(),
                                e.getHttpStatus().getReasonPhrase(),
                                e.getDetailMessage()
                        )
                );
    }

    @ExceptionHandler(Exception.class)
    protected ResponseEntity<ErrorResponse> exception(Exception e) {
        return ResponseEntity
                .status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(
                        new ErrorResponse(
                                HttpStatus.INTERNAL_SERVER_ERROR.value(),
                                HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase(),
                                e.getLocalizedMessage()
                        )
                );
    }
}
