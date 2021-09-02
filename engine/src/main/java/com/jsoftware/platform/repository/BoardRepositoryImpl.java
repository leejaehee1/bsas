package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Board;
import com.jsoftware.platform.model.Product;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class BoardRepositoryImpl implements BoardRepository{

    final SqlSessionFactory sqlSessionFactory;

    final SqlSessionTemplate sqlSessionTemplate;

    // DB 조회 횟수
    private static int dbCount = 0;

    public BoardRepositoryImpl(SqlSessionFactory sqlSessionFactory, SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionFactory = sqlSessionFactory;
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<Board> createBySize(String size) {
        // DB 조회를 했다고 가정하여 카운트를 올린다.
        dbCount++;
        ArrayList<Board> boards = new ArrayList<Board>();
        int count = Integer.parseInt(size);


        for (int i = 0; i < count; i++) {
            boards.add(new Board(i + 0L, i + "번째 게시물", i + "번째 내용"));
        }

        return boards;
    }

    public static int getDbCount() {
        return dbCount;
    }

    @Override
    public Board selectBoardById(Board board) {
//        return sqlSession.openSession().selectOne("selectProductById", product);
        return sqlSessionTemplate.selectOne("selectBoardById", board);
    }

    @Override
    public List<Board> selectAllBoards() {
        return sqlSessionTemplate.selectList("selectAllBoards");
    }

    @Override
    public void insertBoard(Board board) {
        sqlSessionTemplate.insert("insertBoard", board);
    }

    @Override
    public void updateBoard(Board board) {
        sqlSessionTemplate.update("updateBoard", board);
    }

    @Override
    public void deleteBoard(Board board) {
        sqlSessionTemplate.delete("deleteBoard", board);
    }
}