package com.jsoftware.platform.model;

import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@Table(name="hospital")
public class Hospital {
    @NonNull
    private int id;
    @NonNull
    private String pw;
    @NonNull
    private String name;
    private String phone;
    private String publicPhone;
    private String email;
}
