package com.jsoftware.platform.model;

import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Table(name="hotspot")
public class Hotspot {
    private int id;
    private String title;
    private String img_url;
    private String contents;
}
