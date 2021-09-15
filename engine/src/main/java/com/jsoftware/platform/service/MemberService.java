package com.jsoftware.platform.service;

import com.jsoftware.platform.model.Member;
import com.jsoftware.platform.repository.MemberRepositoryImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MemberService {

    final MemberRepositoryImpl repository;

    public MemberService(MemberRepositoryImpl repository) {
        this.repository = repository;
    }

    @Transactional
    public Member insertMember(Member member) {
        repository.insertMember(member);
        return member;
    }

    // all Members
    @Transactional
    public List<Member> readMembers() {
        return repository.selectAllMembers();
    }

    // one Member
    @Transactional
    public Member readMember(int id) {
        return repository.selectMemberById(id);
    }

    @Transactional
    public Member updateMember(Member member) {
        repository.updateMember(member);
        return member;
    }

    @Transactional
    public Member deleteMember(Member member) {
        repository.deleteMember(member);
        return member;
    }
}