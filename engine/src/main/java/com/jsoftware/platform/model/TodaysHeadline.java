package com.jsoftware.platform.model;

import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="todaysheadline")
public class TodaysHeadline {
    private int id;
    private String title;
    private String img_url;

    @Override
    public String toString() {
        return String.format("todaysheadline[id='%d', title='%s', img_url='%s']", id, title, img_url);
    }
}