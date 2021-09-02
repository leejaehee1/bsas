package com.jsoftware.platform.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Board {
    private Long id;
    private String title;
    private String contents;
}
