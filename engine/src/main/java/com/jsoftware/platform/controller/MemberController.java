package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.Member;
import com.jsoftware.platform.model.User;
import com.jsoftware.platform.repository.MemberRepository;
import com.jsoftware.platform.service.MemberService;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class MemberController {

    private final PasswordEncoder passwordEncoder;
    private MemberRepository memberRepository;
    private MemberService memberService;

    //회원가입 페이지
    @GetMapping("/member/signup")
    public void signupGet() {
        System.out.println("******GET register");
    }

    //회원가입 처리
    @PostMapping("/member/signup")
    public Member createUser(Member member) {
        System.out.println("******POST register");
        return memberService.insertMember(member);
    }

    //회원가입 처리
//    @PostMapping("/member/signup")
//    public String createMember(@RequestParam("memberId") String memberId, @RequestParam("memberPwd") String memberPwd) {
//        System.out.println("******POST register");
//        System.out.println("******memberId" + memberId);
//        System.out.println("******memberPwd" + memberPwd);
//
//        Member member = new Member();
//        member.setMemberId(memberId);
//        member.setMemberPwd(memberPwd);
//
//        member.setMemberPwd(passwordEncoder.encode(member.getMemberPwd()));
//        memberRepository.save(member);
//        return memberId;
//    }

//    //로그인 페이지
//    @CrossOrigin
//    @GetMapping("/member/login")
//    public boolean login(String memberId, String memberPwd) {
//        System.out.println("id:" + memberId);
//        System.out.println("pw:" + memberPwd);
//
//        for (Member member : memberService.loadUserByUsername(memberId)) {
//            if (member.getMemberId().equals(memberId) && member.getMemberPwd().equals(memberPwd)) {
//                return true;
//            }
//        }
//        return false;
//    }

    //    // admin 페이지
//    @GetMapping("/admin")
//    public String adminPage(@AuthenticationPrincipal User user,
//                            Map<String, Object> model) {
//        model.put("currentAdminId", user.getUsername());
//        return "adminpage";
//    }

//    // main 페이지
//    @GetMapping("/main")
//    public String mainPage(@AuthenticationPrincipal User user,
//                           Map<String, Object> model) {
//        List<Member> members = memberRepository.findAll();
//        model.put("members", members);
//        model.put("currentMemberId", user.getUsername());
//        return "homepage";
//    }

//    //로그아웃 페이지
//    @GetMapping("/member/logout")
//    public String logout(HttpServletRequest request, HttpServletResponse response) {
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        if (authentication != null) {
//            new SecurityContextLogoutHandler().logout(request, response, authentication);
//        }
//        return "redirect:/";
//    }

//    @GetMapping("/signup/{id}")
//    public Member loadUserByUsername(@PathVariable("id") int id) {
//        System.out.println(id);
//        return memberService.loadUserByUsername();
//    }
}