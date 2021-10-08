package com.jsoftware.platform.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Reply {
    private int idx;
    private int boardIdx;
    private int replyIdx;
    private String contents;

    public Reply() {
        // TODO Auto-generated constructor stub
    }


    public Reply(int idx, int boardIdx, int replyIdx, String contents) {
        super();
        this.idx = idx;
        this.boardIdx = boardIdx;
        this.replyIdx = replyIdx;
        this.contents = contents;
    }

}
