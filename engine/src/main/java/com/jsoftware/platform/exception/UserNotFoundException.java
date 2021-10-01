package com.jsoftware.platform.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class UserNotFoundException extends RuntimeException {
    public UserNotFoundException(String message) {
        // 부모클래스쪽으로 전달받은 메세지를 반환
        super(message);
    }
}
