package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.Member;
import com.jsoftware.platform.service.MemberService;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class MemberController {

    private MemberService memberService;

    //회원가입 처리
    @PostMapping("/member/signup")
    public String joinMember(Member member) {
        memberService.createMember(member);
        return "redirect:/member/login";
    }

    //로그인 페이지
    @CrossOrigin
    @GetMapping("/member/login")
    public boolean login(String id, String pw) {
        System.out.println("id:" + id);
        System.out.println("pw:" + pw);

        for (Member member : memberService.readMembers()) {
            if (member.getMemberId().equals(id) && member.getMemberPwd().equals(pw)) {
                return true;
            }
        }

        return false;
    }

    //회원가입 페이지
    @GetMapping("/member/signup")
    public String signpage() {
        return "signup_page";
    }
}