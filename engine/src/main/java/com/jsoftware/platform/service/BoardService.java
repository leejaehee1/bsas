package com.jsoftware.platform.service;

import com.jsoftware.platform.model.Board;
import com.jsoftware.platform.repository.BoardRepositoryImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BoardService {

    final BoardRepositoryImpl repository;

    public BoardService(BoardRepositoryImpl repository) {
        this.repository = repository;
    }

    @Transactional
    public List<Board> getBoards() {
        return repository.getBoards();
    }

    @Transactional
    public void addBoard(Board board) {
        repository.addBoard(board);
    }

    @Transactional
    public Board getBoardOne(int idx) {
        Board board = new Board();
        board.setIdx(idx);
        return repository.getBoardOne(idx);
    }

    @Transactional
    public void updateBoard(Board board) {
        repository.updateBoard(board);
    }

    /*
    @Transactional
    public void deleteBoard(int id) {
        repository.deleteBoard(id);
    }*/





//    @Cacheable(key = "#size", value = "getBoards")
//    public List<Board> getBoards(String size) {
//        return repository.createBySize(size);
//    }
//
//    public static int getDbCount() {
//        return BoardRepositoryImpl.getDbCount();
//    }
//
//    public Board getBoardById(Long id) {
//        Board board = new Board();
//        board.setId(id);
//        return repository.selectBoardById(board);
//    }
//
//    public List<Board> getAllBoards() {
//        return repository.selectAllBoards();
//    }
//
//    @Transactional
//    public void addBoard(Board board) {
//        repository.insertBoard(board);
//    }
//
//    @Transactional
//    public void updateBoard(Board board) {
//        repository.updateBoard(board);
//    }
//
//    @Transactional
//    public void deleteBoard(Board board) {
//        repository.deleteBoard(board);
//    }
}
