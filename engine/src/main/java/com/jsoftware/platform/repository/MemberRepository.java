package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

@Mapper
public interface MemberRepository {

    Member selectMemberById(int id);

    List<Member> selectAllMembers();

    void insertMember(Member member);

    void updateMember(Member member);

    void deleteMember(Member member);
}