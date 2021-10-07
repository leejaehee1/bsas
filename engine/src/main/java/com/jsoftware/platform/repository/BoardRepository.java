package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Board;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardRepository {

    List<Board> getBoards();
    void addBoard(Board board);
    Board getBoardOne(int idx);
    void updateBoard(Board board);

/*


    String deleteBoard(int idx);


    boolean addReply(Reply reply);
    List<Reply> getReply(int boardIdx);*/

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