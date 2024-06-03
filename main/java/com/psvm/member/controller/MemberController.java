package com.psvm.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.psvm.member.service.MemberService;
import com.psvm.member.vo.Member;


@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("loginForm.me") //로그인 페이지 이동
	public String loginFormMember(@RequestParam("recentLink") String recentLink, Model model) {
		if (recentLink != "") {
			model.addAttribute("recentLink", recentLink);
			System.out.println(recentLink);
		}
		return "member/login";
	}
	
	@RequestMapping("login.me") //로그인
	public ModelAndView loginMember(Member m, @RequestParam(name="recentLink", defaultValue="/") String recentLink, ModelAndView mv, HttpSession session, String saveId, HttpServletResponse response) {
	    
	    Member loginUser = memberService.loginMember(m);	
	    System.out.println(loginUser);
	    
	    if (loginUser == null) { // 아이디가 없는 경우
	        mv.addObject("errorMessage", "일치하는 아이디를 찾을 수 없습니다.");
	        mv.setViewName("member/login");
	        
	    } else if (!bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())){ 
	        mv.addObject("errorMessage", "비밀번호가 일치하지 않습니다.");
	        mv.setViewName("member/login");
	    } else { // 성공
	        Cookie ck = new Cookie("saveId", loginUser.getUserId());
	        if (saveId == null) {
	            ck.setMaxAge(0);
	        }
	        response.addCookie(ck);
	        session.setAttribute("successMessage", "로그인에 성공했습니다!");
	        session.setAttribute("loginUser", loginUser);
	        mv.setViewName("redirect:" + recentLink);
	        System.out.println("redirect : " + recentLink);
	    }
	    
	    return mv;
	}

	
	@RequestMapping("logout.me") //로그아웃
	public String logoutMember(HttpSession session) {
		session.removeAttribute("loginUser");
		session.setAttribute("successMessage", "로그아웃되었습니다.");
		return "redirect:/";
	}
	
	@RequestMapping("signUpForm.me") //회원가입 페이지 이동
	public String signUpFormMember() {
		return "member/signUp";
	}
	
	@ResponseBody
	@RequestMapping("idCheck.me") //아이디 중복 확인
	public String idCheck(String checkId) {
		
		return memberService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@RequestMapping("signUp.me") //회원가입
	public ModelAndView signupMember(Member m, HttpSession session, ModelAndView mv) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		int result = memberService.signupMember(m);
		
		if(result > 0) {
			session.setAttribute("successMessage", "회원가입에 성공했습니다!");
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMessage", "오류가 발생했습니다.");
	        mv.setViewName("member/signUp");
		}
		
		return mv;
	}
	
	@RequestMapping("update.me") //회원정보 수정
	public String updateMember(Member m, HttpSession session, Model model) {
		
		int result =  memberService.updateMember(m);
		
		return "redirect:/";
		
//		if (result > 0){
//			session.setAttribute("loginUser", memberService.loginMember(m));
//			return "redirect:"; //회원정보 수정 후 이동할 페이지 주소 입력
//		}else {
//			
//		}
	}
	
	@RequestMapping("delete.me") //회원 탈퇴
	public String deleteMember(Member m, HttpSession session) {
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
		
		return "redirect:/";
		
//		if (bcryptPasswordEncoder.matches(m.getUserPwd(), encPwd)) {//암호 일치
//			int result = memberService.deleteMember(m.getUserId());
//			
//			if(result > 0) { //탈퇴 성공
//				session.removeAttribute("loginUser");
//				return "redirect";
//			} else {
//				
//			}
//		} else { //암호 불일치
//			
//		}
	}
	
	
}
