package alba.alba_10_26.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import alba.alba_10_26.dao.OwnerDao;
import alba.alba_10_26.vo.OwnerVo;

@Controller
public class OwnerController {

    @Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	OwnerDao ownerDao;

   
	public OwnerController(OwnerDao ownerDao) {
		this.ownerDao = ownerDao;
	}

	@RequestMapping(value = "/owner/check_o_id.do", produces = "application/json;charset=utf-8;")
	@ResponseBody
	public Map<String, Boolean> check_o_id(String o_id) {

		OwnerVo vo = ownerDao.selectOneFromId(o_id);

		boolean bResult;
		if (vo == null)
			bResult = true;
		else
			bResult = false;

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", bResult);

		return map;
	}


	@RequestMapping(value = "/owner/check_pwd.do", produces = "application/json;charset=utf-8;")
	@ResponseBody
	public Map<String, Boolean> check_pwd(String o_pwd) {

		OwnerVo vo = ownerDao.selectOneFromId(o_pwd);

		boolean bResult;
		if (vo == null)
			bResult = true;
		else
			bResult = false;

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", bResult);

		return map;
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

		return "redirect:login_form.do";
	}

    @RequestMapping("/owner/login_form.do")
	public String login_form() {

		return "owner/owner_login_form";
	}
	
	@RequestMapping("/owner/login.do")
	public String login(String o_id, String o_pwd, RedirectAttributes ra) {

		OwnerVo owner = ownerDao.selectOneFromId(o_id);
		if (owner == null) {

			ra.addAttribute("reason", "fail_id");
			return "redirect:login_form.do";
		}
		if (owner.getO_pwd().equals(o_pwd) == false) {

			ra.addAttribute("reason", "fail_pwd");
			ra.addAttribute("o_id", "o_id");
			return "redirect:login_form.do";
		}

		if (session.getAttribute("owner") != null) {
			session.invalidate();
		}

		session.setAttribute("owner", owner);
		return "redirect:../main/main.do";
	}

	@RequestMapping("/owner/logout.do")
	public String logout() {

		session.removeAttribute("owner");

		return "redirect:../main/main.do";
	}

	@RequestMapping(value = "/owner/check_id.do", produces = "application/json;charset=utf-8;")
	@ResponseBody
	public Map<String, Boolean> check_id(String o_id) {

		OwnerVo vo = ownerDao.selectOneFromId(o_id);

		boolean bResult;
		if (vo == null)
			bResult = true;
		else
			bResult = false;

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", bResult);

		return map;
	}
    
}
