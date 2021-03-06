package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Board;
import com.jsoftware.platform.model.Reply;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardRepository {

    List<Board> getBoards();
    void addBoard(Board board);
    Board getBoardOne(int idx);
    void updateBoard(int idx) throws Exception;
    void updatesBoard(Board board) throws Exception;
    void deleteBoard(int idx);

    void addReply(Reply reply);
    List<Reply> getReply(int boardIdx);
}