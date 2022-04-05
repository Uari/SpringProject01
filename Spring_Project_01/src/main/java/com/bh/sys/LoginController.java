package com.bh.sys;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bh.Service.IF_userService;
import com.bh.VO.UserVO;

@Controller
public class LoginController {
	@Inject
	private IF_userService userservice;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() throws Exception {

		return "login/loginForm";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVO uservo) throws Exception {
		userservice.insert(uservo);
		return "redirect:/login";
	}

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(HttpServletRequest request, UserVO uservo) throws Exception {
		String tagetUrl = "";
		UserVO userif = userservice.userOne(uservo.getU_id());
		if (userif == null) {	//아이디 없음
			System.out.println("로그인 실패");
			tagetUrl = "redirect:/login";
		} else {
			if (userif.getU_pwd().equals(uservo.getU_pwd())) {
				System.out.println("로그인 성공");
				HttpSession session = request.getSession();
				session.setAttribute("userid", uservo.getU_id());
				tagetUrl = "redirect:/";
			} else {	//비밀번호 없음
				System.out.println("로그인 실패");
				tagetUrl = "redirect:/login";
			}
		}
		return tagetUrl;
	}
	
	@RequestMapping(value = "/id_check", method = RequestMethod.POST)
	@ResponseBody
	public HashMap <String, String> id_check(HttpServletRequest request) throws Exception {
		HashMap<String, String> result = new HashMap <String,String>();
		String id = request.getParameter("u_id");
		UserVO userif = userservice.userOne(id);
		if(userif != null) {
			String check = "아이디 중복!!";
			result.put("check", check);
			return result;
		}else {
			String check = "아이디 사용가능!!";
			result.put("check", check);
			return result;
		}
	}
}
