package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Member;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemberRepository {

    Member selectMemberById(int id);

    List<Member> selectAllMembers();

    void insertMember(Member member);

    void updateMember(Member member);

    void deleteMember(Member member);
}
