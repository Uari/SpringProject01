package com.bh.sys;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bh.Service.IF_BBEService;
import com.bh.VO.BBEVO;

@Controller
public class BBEController {
	@Inject
	private IF_BBEService bbeservice;
	
	@RequestMapping(value = "/reservationPOP", method = RequestMethod.GET)
	public String reservationPOP(Model model) throws Exception {
		
		model.addAttribute("BBElist", bbeservice.bbeselectAll());
		
		return "post/popup/reservationPOP";
	}
	
	@RequestMapping(value = "/kind_one", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> kind_one(HttpServletRequest request) throws Exception {
		HashMap<String, Object> result = new HashMap<String, Object>();
		String no = request.getParameter("no");
		BBEVO bbevo = bbeservice.selectone(no);
		result.put("cnt", bbevo.getCnt());
		result.put("price", bbevo.getPrice());
		
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/reservationtaxi", method = RequestMethod.GET)
	public void reservationtaxi(@RequestParam("no") int no, BBEVO bbevo, HttpSession session) throws Exception {
		
		String u_id = (String)session.getAttribute("userid");
		bbevo.setU_id(u_id);
		bbevo.setTaxi_no(no);
		bbeservice.reservationtaxi(bbevo); 
	}
	
	@ResponseBody
	@RequestMapping(value = "/returntaxi", method = RequestMethod.GET)
	public void returntaxi(BBEVO bbevo, HttpSession session) throws Exception {
		
		String u_id = (String)session.getAttribute("userid");
		bbeservice.returntaxi(u_id); 
	}
	
	@RequestMapping(value = "/Ic_history", method = RequestMethod.GET)
	public String history(Model model,HttpSession session) throws Exception {
		String u_id = (String)session.getAttribute("userid");
		model.addAttribute("historylist", bbeservice.history(u_id));
		return "post/history";
	}
}
