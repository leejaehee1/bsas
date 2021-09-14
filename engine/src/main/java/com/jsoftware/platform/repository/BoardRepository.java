package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardRepository {

    void addBoard(Board board);
    public List<Board> getBoard();
    public Board getBoardOne(Long id);

//    public boolean addReply(Reply reply);
//    public List<Reply> getReply(int boardIdx);

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