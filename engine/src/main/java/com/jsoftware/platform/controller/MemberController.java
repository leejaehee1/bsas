package com.jsoftware.platform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.jsoftware.platform.model.Member;
import com.jsoftware.platform.service.MemberService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MemberController {

    private MemberService memberService;

    // test
    @GetMapping("/test")
    public String getMember(Model model) {
        Member member = new Member("kkaok", "테스트", "web");
        model.addAttribute("member", member);
        return "test";
    }

    //회원가입 처리
    @PostMapping("/member/signup")
    public String joinMember(Member member) {
        memberService.createMember(member);
        return "redirect:/member/login";
    }

    //로그인 페이지
    @GetMapping("/member/login")
    public String login() {
        return "login";
    }

    //회원가입 페이지
    @GetMapping("/member/signup")
    public String signpage() {
        return "signup_page";
    }
}