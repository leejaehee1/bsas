package com.jsoftware.platform.model;

import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Table(name="center")
public class Center {
    private int id;
    private String name;
    private String phone;
    private String publicPhone;
    private String email;

    public Center() {

    }

    public Center(int id, String name, String phone, String publicPhone, String email) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.publicPhone = publicPhone;
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

    public String getPublicPhone() {
        return publicPhone;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public String toString() {
        return String.format("center[id='%d', name='%s', phone='%s', publicPhone='%s' email='%s']", id, name, phone, publicPhone, email);
    }
}
