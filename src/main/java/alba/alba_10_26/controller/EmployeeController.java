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

import alba.alba_10_26.dao.EmployeeDao;
import alba.alba_10_26.vo.EmployeeVo;
import alba.alba_10_26.vo.OwnerVo;


@Controller
public class EmployeeController {

    @Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

    EmployeeDao employeeDao;

    public EmployeeController(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}


	@RequestMapping(value = "/employee/check_e_id.do", produces = "application/json;charset=utf-8;")
	@ResponseBody
	public Map<String, Boolean> check_e_id(String e_id) {

		EmployeeVo vo = employeeDao.selectOneFromId(e_id);

		boolean bResult;
		if (vo == null)
			bResult = true;
		else
			bResult = false;

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", bResult);

		return map;
	}


	@RequestMapping(value = "/employee/check_pwd.do", produces = "application/json;charset=utf-8;")
	@ResponseBody
	public Map<String, Boolean> check_pwd(String e_pwd) {

		EmployeeVo vo = employeeDao.selectOneFromId(e_pwd);

		boolean bResult;
		if (vo == null)
			bResult = true;
		else
			bResult = false;

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", bResult);

		return map;
	}

     @RequestMapping("/employee/list.do")
	public String list(Model model) {

		List<EmployeeVo> list = employeeDao.selectList();

		model.addAttribute("list", list);

		return "owner/owner_list";
	}

   

    @RequestMapping("/employee/insert_form.do")
	public String insert_form() {

		return "employee/employee_insert_form";
	}

    @RequestMapping("/employee/insert.do")
	public String insert(EmployeeVo vo) {

		int res = employeeDao.insertEmployee(vo);
		if (res == 0) {
		}

		return "redirect:login_form.do";
	}
	 @RequestMapping("employee/login_form.do")
    public String login_form(){

        return "employee/employee_login_form";
    }

	@RequestMapping("/employee/login.do")
	public String login(String e_id, String e_pwd, RedirectAttributes ra) {

		EmployeeVo member = employeeDao.selectOneFromId(e_id);
		if (member == null) {

			ra.addAttribute("reason", "fail_id");
			return "redirect:login_form.do";
		}
		if (member.getE_pwd().equals(e_pwd) == false) {

			ra.addAttribute("reason", "fail_pwd");
			ra.addAttribute("e_id", "e_id");
			return "redirect:login_form.do";
		}

		if (session.getAttribute("member") != null) {
			session.invalidate();
		}

		session.setAttribute("member", member);
		return "redirect:../main/main.do";
	}

	@RequestMapping("/employee/logout.do")
	public String logout() {

		session.removeAttribute("member");

		return "redirect:../main/main.do";
	}

	@RequestMapping(value = "/employee/check_id.do", produces = "application/json;charset=utf-8;")
	@ResponseBody
	public Map<String, Boolean> check_id(String e_id) {

		EmployeeVo vo = employeeDao.selectOneFromId(e_id);

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
