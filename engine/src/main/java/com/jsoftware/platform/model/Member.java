package com.jsoftware.platform.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Entity
@Table(name="member")
public class Member {

    @Id
    private int id;
    private String member_id;
    private String member_pwd;
    private String auth_type;

    @Builder
    public Member(int id, String member_id, String member_pwd, String auth_type) {
        this.id = id;
        this.member_id = member_id;
        this.member_pwd = member_pwd;
        this.auth_type = auth_type;
    }

    public Member() {

    }

    public Member toEntity() {
        return Member.builder()
                .id(id)
                .member_id(member_id)
                .member_pwd(member_pwd)
                .auth_type(auth_type)
                .build();
    }
}
