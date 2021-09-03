package com.jsoftware.platform.model;

import javax.persistence.Table;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@RequiredArgsConstructor
@Table(name="user")
public class User {
    @NonNull
    private long id;
    @NonNull
    private String pw;
    @NonNull
    private String name;
    private String phone;
    private String email;
}
