package com.bh.sys;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bh.Service.IF_reviewService;
import com.bh.VO.ReviewVO;

@Controller
public class ReviewController {
	@Inject
	private IF_reviewService reviewService;

	@RequestMapping(value = "/reviewpopup", method = RequestMethod.GET)
	public String reviewpopup() throws Exception {

		return "post/popup/reviewpopup";
	}

	@RequestMapping(value = "/reviewInsert", method = RequestMethod.GET)
	public String reviewInsert(ReviewVO reviewvo, HttpSession session) throws Exception {
		String u_id = (String)session.getAttribute("userid");
		reviewvo.setU_id(u_id);
		reviewService.reviewInsert(reviewvo);
	
	return "redirect:/Ic_review";
	}
	
	@ResponseBody
	@RequestMapping(value = "/deletereview", method = RequestMethod.GET)
	public void deletereview(@RequestParam("no") int no) throws Exception {
		reviewService.reviewDel(no);
	}
}
