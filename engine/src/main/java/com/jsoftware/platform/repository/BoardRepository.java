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
    void updateBoard(int idx, Board board);
    void deleteBoard(int idx);

    public void addReply(Reply reply);
    public List<Reply> getReply(int boardIdx);

//    Board selectBoardById(Board board);
//
//    List<Board> selectAllBoards();
//
//    void insertBoard(Board board);
//
//    void updateBoard(Board board);
//
//    void deleteBoard(Board board);

}