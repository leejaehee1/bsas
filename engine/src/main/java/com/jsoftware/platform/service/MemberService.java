package com.jsoftware.platform.service;

import com.jsoftware.platform.model.Member;
import com.jsoftware.platform.model.Role;
import com.jsoftware.platform.repository.MemberRepository;

import lombok.AllArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Set;

@Service
@AllArgsConstructor
public class MemberService implements UserDetailsService {
    final MemberRepository memberRepository;

    @Transactional
    public Long insertMember(Member member) {
        // 비밀번호 암호화
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        member.setMemberPwd(passwordEncoder.encode(member.getMemberPwd()));

        return memberRepository.save(member.toEntity()).getId();
    }

//    @Transactional
//    public Long joinUser(Member member) {
//        // 비밀번호 암호화
//        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//        member.setMemberPwd(passwordEncoder.encode(member.getMemberPwd()));
//
//        return memberRepository.save(member.toEntity()).getId();
//    }

    @Override
    public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
        Member member = memberRepository.findByMemberId(memberId)
                .orElseThrow(() -> new UsernameNotFoundException(memberId));

        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        if (memberId.equals("admin")) {
            grantedAuthorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
        } else {
            grantedAuthorities.add(new SimpleGrantedAuthority(Role.MEMBER.getValue()));
        }

        return new User(member.getMemberId(), member.getMemberPwd(), grantedAuthorities);
    }

    //    @Transactional
//    public void createMember(Member member) {
//        String encodedPassword = passwordEncoder.encode(member.getMemberPwd());
//        member.setMemberPwd(encodedPassword);
//        repository.insertMember(member);
//    }
//
//    // all Members
//    @Transactional
//    public List<Member> readMembers() {
//        return memberRepository.selectAllMembers();
//    }
//
//    // one Member
//    @Transactional
//    public Member readMember(int id) {
//        return repository.selectMemberById(id);
//    }
//
//    @Transactional
//    public Member updateMember(Member member) {
//        repository.updateMember(member);
//        return member;
//    }
//
//    @Transactional
//    public void deleteMember(Member member) {
//        repository.deleteMember(member);
//    }
}
