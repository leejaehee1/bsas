package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Board;
import com.jsoftware.platform.model.Reply;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepositoryImpl implements BoardRepository{

    final SqlSessionFactory sqlSessionFactory;

    final SqlSessionTemplate sqlSessionTemplate;


    public BoardRepositoryImpl(SqlSessionFactory sqlSessionFactory, SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionFactory = sqlSessionFactory;
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public void addBoard(Board board) {
        sqlSessionTemplate.insert("insertBoard", board);
    }

    @Override
    public List<Board> getBoards() {
        return sqlSessionTemplate.selectList("selectAllBoards");
    }

    @Override
    public Board getBoardOne(int idx) {
        return sqlSessionTemplate.selectOne("selectBoardById", idx);
    }

    @Override
    public void updateBoard(int idx) throws Exception {
        sqlSessionTemplate.update("updateBoard", idx);
    }

    @Override
    public void updatesBoard(Board board) throws Exception {
        sqlSessionTemplate.update("updatesBoard", board);
    }

    @Override
    public void deleteBoard(int idx) {
        sqlSessionTemplate.delete("deleteBoard", idx);
    }

    public void addReply(Reply reply) {
        sqlSessionTemplate.insert("addReply", reply);
    }

    public List<Reply> getReply(int boardIdx) {
        return sqlSessionTemplate.selectList("getReply", boardIdx);
    }

//    public List<Board> createBySize(String size) {
//        // DB 조회를 했다고 가정하여 카운트를 올린다.
//        dbCount++;
//        ArrayList<Board> boards = new ArrayList<Board>();
//        int count = Integer.parseInt(size);
//
//
//        for (int i = 0; i < count; i++) {
//            boards.add(new Board(i + 0L, i + "번째 게시물", i + "번째 내용"));
//        }
//
//        return boards;
//    }
//
//    public static int getDbCount() {
//        return dbCount;
//    }
}