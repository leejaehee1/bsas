//package com.jsoftware.platform.repository;
//
//import com.jsoftware.platform.model.Member;
//
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.stereotype.Repository;
//
//import java.util.List;
//import java.util.Optional;
//
//@Repository
//public class MemberRepositoryImpl implements MemberRepository{
//
//    final SqlSessionFactory sqlSessionFactory;
//
//    final SqlSessionTemplate sqlSessionTemplate;
////
////    // DB 조회 횟수
////    private static int dbCount = 0;
//
//    public MemberRepositoryImpl(SqlSessionFactory sqlSessionFactory, SqlSessionTemplate sqlSessionTemplate) {
//        this.sqlSessionFactory = sqlSessionFactory;
//        this.sqlSessionTemplate = sqlSessionTemplate;
//    }
//
//    @Override
//    public Optional<Member> findByMemberId(String memberId) {
//        return sqlSessionTemplate.selectOne("selectMemberById", memberId);
//    }
//
//    @Override
//    public List<Member> selectAllMembers() {
//        return sqlSessionTemplate.selectList("selectAllMembers");
//    }
//
//    @Override
//    public void insertMember(Member member) {
//        sqlSessionTemplate.insert("insertMember", member);
//    }
//
//    @Override
//    public void updateMember(Member member) {
//        sqlSessionTemplate.update("updateMember", member);
//    }
//
//    @Override
//    public void deleteMember(Member member) {
//        sqlSessionTemplate.delete("deleteMember", member);
//    }
//}