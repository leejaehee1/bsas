package com.jsoftware.platform.model;

import javax.persistence.Table;

import jdk.nashorn.internal.runtime.Debug;
import lombok.*;

@Setter
@Getter
@ToString
@RequiredArgsConstructor
@Table(name="member")
public class Member {
    @NonNull
    private String memberId;
    @NonNull
    private String memberPwd;
    private String authType;


    // postman에서 json으로 넣기 위해 만듦
    public Member() {

    }

    public String getMemberId() {
        return memberId;
    }

    public String getMemberPwd() {
        return memberPwd;
    }

    public String getAuthType() {
        return authType;
    }

    public Member toEntity() {
        return Member.builder()
                .memberId(memberId)
                .memberPwd(memberPwd)
                .authType(authType)
                .build();
    }

    @Builder
    public Member(String memberId, String memberPwd, String authType) {
        this.memberId = memberId;
        this.memberPwd = memberPwd;
        this.authType = authType;
    }

    @Override
    public String toString() {
        return String.format("Member[memberId='%s', memberPwd='%s', authType='%s']", memberId, memberPwd, authType);
    }
}
