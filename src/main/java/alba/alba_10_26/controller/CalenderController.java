package alba.alba_10_26.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import alba.alba_10_26.dao.CalenderDao;
import alba.alba_10_26.vo.CalenderVo;

@Controller
public class CalenderController {

     @Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

    CalenderDao calenderDao;

    public CalenderController(CalenderDao calenderDao) {
		this.calenderDao = calenderDao;
	}

    @RequestMapping("/calender/list.do")
	public String list(Model model) {

		List<CalenderVo> list = calenderDao.selectList();

		model.addAttribute("list", list);

		return "calender/calender_list";
	}
    
}
