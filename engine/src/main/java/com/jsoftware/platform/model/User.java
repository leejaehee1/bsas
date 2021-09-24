package com.jsoftware.platform.model;

import javax.persistence.Table;

import lombok.*;

@Setter
@Getter
@Table(name="User")
public class User {
    private int id;
    private String name;
    private String phone;
    private String email;

    // postman에서 json 넣기 위해 만듬
    public User() {

    }

    public User(int id, String name, String phone, String email) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
    }

    public int getId() {
        return id;
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
