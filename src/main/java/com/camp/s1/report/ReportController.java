package com.camp.s1.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.board.BoardDTO;

@RequestMapping("/report/*")
@Controller
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	
	
	@GetMapping("report")
	public ModelAndView setReportAdd(BbsDTO bbsDTO, @RequestParam(name = "commentNum", required = false) Long commentNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("report/report");
		mv.addObject("dto", bbsDTO);
		mv.addObject("commentNum", commentNum);
		return mv ;
	}
	
	@PostMapping("report")
	public ModelAndView setReportAdd(ReportDTO reportDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("Num :" + reportDTO.getNum());
		System.out.println("BoardID :" + reportDTO.getBoardId());
		System.out.println("CommentNum :" + reportDTO.getCommentNum());
		
		int result = reportService.setReportAdd(reportDTO);
		
		String msg = "신고가 정상적으로 신청되지 못했습니다";
		
		if(result == 1) {
			msg = "신고 신청이 완료되었습니다. 검토 후 처리될 예정입니다";
		}
		else if(result == 2) {
			msg = "같은 글에 대해 중복 신고는 허용하지 않습니다";
		}
		
		mv.setViewName("common/result");
		
		
		mv.addObject("result", msg);
		mv.addObject("url", "/");
		return mv ;
	}
}
