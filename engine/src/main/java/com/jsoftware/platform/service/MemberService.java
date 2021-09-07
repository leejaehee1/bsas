package com.jsoftware.platform.service;

import com.jsoftware.platform.model.Member;
import com.jsoftware.platform.repository.MemberRepositoryImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MemberService {

    final MemberRepositoryImpl repository;

    public MemberService(MemberRepositoryImpl repository) {
        this.repository = repository;
    }

    // SecurityConfig에서 Bcrypt가 있는지 확인할 것
    // 비밀번호 암호화
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Transactional
    public void createMember(Member member) {
        String encodedPassword = passwordEncoder.encode(member.getMemberPwd());
        member.setMemberPwd(encodedPassword);
        repository.insertMember(member);
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
    public void deleteMember(Member member) {
        repository.deleteMember(member);
    }
}
