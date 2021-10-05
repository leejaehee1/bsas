package com.jsoftware.platform.model;

import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Table(name="board")
public class Board {
    private int id;
    private String title;
    private String contents;

    @Override
    public String toString() {
        return String.format("board[id='%d', title='%s', contents='%s']", id, title, contents);
    }
}
