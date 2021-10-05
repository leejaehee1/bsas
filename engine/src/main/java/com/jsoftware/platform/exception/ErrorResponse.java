package com.jsoftware.platform.exception;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ErrorResponse {

    private int httpStatus;

    private String errorMessage;

    private String detailMessage;

    public ErrorResponse(int httpStatus, String errorMessage, String detailMessage) {
        super();
        this.httpStatus = httpStatus;
        this.errorMessage = errorMessage;
        this.detailMessage = detailMessage;
    }
}
