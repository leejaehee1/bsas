package com.jsoftware.platform.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Entity
@Table(name="member")
public class Member {

    @Id
    private Long id;
    private String memberId;
    private String memberPwd;
    private String authType;
    private LocalDateTime createdDate;
    private LocalDateTime modifiedDate;

    @Builder
    public Member(Long id, String memberId, String memberPwd, String authType) {
        this.id = id;
        this.memberId = memberId;
        this.memberPwd = memberPwd;
        this.authType = authType;
    }

    public Member() {

    }

    public Member toEntity() {
        return Member.builder()
                .id(id)
                .memberId(memberId)
                .memberPwd(memberPwd)
                .authType(authType)
                .build();
    }
}
