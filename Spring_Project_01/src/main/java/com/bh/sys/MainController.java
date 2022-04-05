package com.bh.sys;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bh.Service.IF_BBEService;
import com.bh.Service.IF_reviewService;
import com.bh.VO.PageVO;


@Controller
public class MainController {
	@Inject
	private IF_reviewService reviewservice;
	@Inject
	private IF_BBEService bbeservice;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainpage() throws Exception {

		return "mainpage";
	}

	@RequestMapping(value = "/Ic_reservation", method = RequestMethod.GET)
	public String reservation() throws Exception {
		
		return "post/reservation";
	}

	@RequestMapping(value = "/Ic_review", method = RequestMethod.GET)
	public String review(PageVO pagevo, Model model) throws Exception {
		
		if (pagevo.getPage() == null) {
			pagevo.setPage(1);
		}
		pagevo.setPerPageNum(3);
		pagevo.setTotalCount(reviewservice.reviewcnt());
		model.addAttribute("reviewList", reviewservice.selectAll(pagevo));
		model.addAttribute("pageVO", pagevo);
		
		return "post/review";
	}
	
	@RequestMapping(value = "/Ic_return", method = RequestMethod.GET)
	public String returnbbe(HttpSession session, Model model) throws Exception {
		String u_id = (String)session.getAttribute("userid");
		model.addAttribute("BBEhistory", bbeservice.bbeselectOne(u_id));
		return "post/returnbbe";
	}
	
}
