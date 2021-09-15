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
    private String contents;
}
