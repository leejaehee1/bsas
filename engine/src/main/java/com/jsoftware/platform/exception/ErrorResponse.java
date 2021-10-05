package com.jsoftware.platform.exception;

import lombok.Getter;
import lombok.NoArgsConstructor;

/*성공
        200 : OK, 요청 정상 처리
        201 : Created, 생성 요청 성공
        202 : Accepted, 비동기 요청 성공
        204 : No Content, 요청 정상 처리, 응답 데이터 없음.*/
/*실패
        400 : Bad Request, 요청이 부적절 할 때, 유효성 검증 실패, 필수 값 누락 등.
        401 : Unauthorized, 인증 실패, 로그인하지 않은 사용자 또는 권한 없는 사용자 처리
        402 : Payment Required
        403 : Forbidden, 인증 성공 그러나 자원에 대한 권한 없음. 삭제, 수정시 권한 없음.
        404 : Not Found, 요청한 URI에 대한 리소스 없을 때 사용.
        405 : Method Not Allowed, 사용 불가능한 Method를 이용한 경우.
        406 : Not Acceptable, 요청된 리소스의 미디어 타입을 제공하지 못할 때 사용.
        408 : Request Timeout
        409 : Conflict, 리소스 상태에 위반되는 행위 시 사용.
        413 : Payload Too Large
        423 : Locked
        428 : Precondition Required
        429 : Too Many Requests

        500 : 서버 에러*/

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
