package com.jsoftware.platform.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/*예외처리를 각 컨트롤러마다 try/catch 또는 if절로 처리하고 싶지 않았고
일반 컨트롤러에서 에러 발생 시 에러 페이지로 연결하는 공통 컨트롤러를 만들어 사용하고 싶었다.
구글링 결과 해당 사항에 연관되는 블로그를 찾았고
이에 따라 exception 패키지 이하 클래스들을 작성하게 되었다.*/

@RestControllerAdvice(basePackages = "com.jsoftware.platform.controller")
// 서비스에 따라 각각 처리할 때 이를 상속 받아서 처리하게 만듦
public class AbstractBaseRestController {

    @ExceptionHandler(AbstractEbloBaseException.class)
    /*각 서비스, 컨트롤러에서 예외 발생 시 해당 핸들러를 통해 예외를 자동 처리하게 한다.
    예외에 따라 Response status를 결정하고 에러 코드와 메세지를 생성한다.*/
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
