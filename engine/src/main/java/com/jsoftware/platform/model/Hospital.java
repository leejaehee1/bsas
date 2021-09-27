package com.jsoftware.platform.model;

import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Table(name="hospital")
public class Hospital {
    private int id;
    private String name;
    private String phone;
    private String publicPhone;
    private String email;


}
