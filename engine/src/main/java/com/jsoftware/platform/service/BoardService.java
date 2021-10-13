package com.jsoftware.platform.service;

import com.jsoftware.platform.model.Board;
import com.jsoftware.platform.model.Reply;
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

    @Transactional
    public void deleteBoard(int idx) {
        repository.deleteBoard(idx);
    }

    public void addReply(Reply reply) {
        repository.addReply(reply);
    }
    public List<Reply> getReply(int boardIdx) {
        return repository.getReply(boardIdx);
    }

//    @Cacheable(key = "#size", value = "getBoards")
//    public List<Board> getBoards(String size) {
//        return repository.createBySize(size);
//    }
//
//    public static int getDbCount() {
//        return BoardRepositoryImpl.getDbCount();
//    }
}