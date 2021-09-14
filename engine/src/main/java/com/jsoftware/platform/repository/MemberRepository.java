package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long> {
    Optional<Member> findByMemberId(String memberId);



    //    Member selectMemberById(int id);
//
//    List<Member> selectAllMembers();
//
//    void insertMember(Member member);
//
//    void updateMember(Member member);
//
//    void deleteMember(Member member);
}
