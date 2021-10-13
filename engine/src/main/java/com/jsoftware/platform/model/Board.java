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
    private String filePath;

    public Board() {
        // TODO Auto-generated constructor stub
    }

    public Board(int idx, String title, String contents, String image, String filePath) {
        super();
        this.idx = idx;
        this.title = title;
        this.contents = contents;
        this.image = image;
        this.filePath = filePath;
    }

    @Override
    public String toString() {
        return "Board{" +
                "idx=" + idx + '\'' +
                ", title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", image='" + image + '\'' +
                ", filePath='" + filePath + '\'' +
                '}';
    }

    public void update(Board board) {
        this.title = board.getTitle();
        this.contents = board.getContents();
        this.image = board.getImage();
        this.filePath  = board.getFilePath();
    }
}
