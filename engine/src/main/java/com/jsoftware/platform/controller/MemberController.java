package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.Member;
import com.jsoftware.platform.service.MemberService;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class MemberController {

    private MemberService memberService;

    // test
    @GetMapping("/test")
    public String getMember(Model model) {
        Member member = new Member(4, "hi", "test", "web");
        model.addAttribute("member", member);
        memberService.insertMember(member);
        System.out.println("******GET1 register");
        return "test";
    }


    @PostMapping("/test")
    public String getMemberTest(@RequestBody Member member) {
        return "ID : " + member.getId() + ", Member ID : " + member.getMember_id()
                + ", Member PW : " + member.getMember_pwd()+ ", AuthType : " + member.getAuth_type();
    }
    // test 완료

    //회원가입 페이지
    @GetMapping("/member/signup")
    public List<Member> getMembers() {
        System.out.println("******GET1 register");
        return memberService.readMembers();
    }

    //회원가입 처리
    @PostMapping("/member/signup")
    public Member insertMember(Member member) {
        System.out.println("******POST1 register");
        return memberService.insertMember(member);
    }


    // read one
    @GetMapping("/member/login/{id}")
    public Member readMember(@PathVariable("id") int id) {
        System.out.println(id);
        return memberService.readMember(id);
    }

    // update
    @PutMapping("/member/login/{id}")
    public Member putMember(@PathVariable("id") int id, @RequestBody Member Member) {
        return memberService.updateMember(Member);
    }

    // delete
    @DeleteMapping("/member/login/{id}")
    public Member deleteMember(@PathVariable int id, Member Member) {
        return memberService.deleteMember(Member);
    }

//    //로그인 페이지
//    @GetMapping("/member/login")
//    public String login() {
//        return "login";
//    }
//
//    //회원가입 페이지
//    @GetMapping("/member/signup")
//    public String signpage() {
//        return "signup_page";
//    }

//
//    //회원가입 페이지
//    @GetMapping("/member/signup")
//    public void signupGet() {
//        System.out.println("******GET register");
//    }
//
//    //회원가입 처리
//    @PostMapping("/member/signup")
//    public Long insertMember() {
//        System.out.println("******POST register");
////        return memberService.insertMember(member);
////        return Long.valueOf("0");
//        Member member = new Member();
//        member.setMemberId("test10");
//        member.setMemberPwd("test19");
//        memberService.insertMember(member);
//        return 0l;
//    }

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