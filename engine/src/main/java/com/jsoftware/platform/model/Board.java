package com.jsoftware.platform.model;

import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Table(name="board")
public class Board {
    private int idx;
    private String title;
    private String contents;
    private String image;

    public Board() {
        // TODO Auto-generated constructor stub
    }

    public Board(int idx, String title, String contents, String image) {
        super();
        this.idx = idx;
        this.title = title;
        this.contents = contents;
        this.image = image;
    }

    @Override
    public String toString() {
        return String.format("board[idx='%d', title='%s', contents='%s', image='%s']", idx, title, contents, image);
    }
}
