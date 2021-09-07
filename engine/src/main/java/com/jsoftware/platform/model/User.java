package com.jsoftware.platform.model;

import java.util.List;

import javax.persistence.Table;

import lombok.*;

@Setter
@Getter
@ToString
//@AllArgsConstructor
@RequiredArgsConstructor
@Table(name="user")
public class User {
    @NonNull
    private int id;
    @NonNull
    private String pw;
    @NonNull
    private String name;
    private String phone;
    private String email;

    public User() {

    }

    public User(int id, String pw, String name, String phone, String email) {
        this.id = id;
        this.pw = pw;
        this.name = name;
        this.phone = phone;
        this.email = email;
    }

    public long getId() {
        return id;
    }

    public String getPw() {
        return pw;
    }

    public String getName() {
        return name;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public String toString() {
        return String.format("User[id='%d', name='%s', phone='%s', email='%s']", id, name, phone, email);
    }
}
