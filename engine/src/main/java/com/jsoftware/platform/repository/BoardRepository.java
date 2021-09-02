package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardRepository {

    Board selectBoardById(Board board);

    List<Board> selectAllBoards();

    void insertBoard(Board board);

    void updateBoard(Board board);

    void deleteBoard(Board board);

}