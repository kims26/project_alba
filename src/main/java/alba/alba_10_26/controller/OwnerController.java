package alba.alba_10_26.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import alba.alba_10_26.dao.OwnerDao;
import alba.alba_10_26.vo.OwnerVo;

@Controller
public class OwnerController {

    @Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	OwnerDao ownerDao;

    @Autowired
	public OwnerController(OwnerDao ownerDao) {
		this.ownerDao = ownerDao;
	}

    @RequestMapping("/owner/list.do")
	public String list(Model model) {

		List<OwnerVo> list = ownerDao.selectList();

		model.addAttribute("list", list);

		return "owner/owner_list";
	}

    @RequestMapping("/owner/insert_form.do")
	public String insert_form() {

		return "owner/owner_insert_form";
	}

    @RequestMapping("/owner/insert.do")
	public String insert(OwnerVo vo) {

		int res = ownerDao.insertOwner(vo);
		if (res == 0) {
		}

		return "redirect:main.do";
	}

    @RequestMapping("/owner/login_form.do")
	public String login_form() {

		return "owner/owner_login_form";
	}


    
}
