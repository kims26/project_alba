package alba.alba_10_26.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import alba.alba_10_26.dao.EmployeeDao;
import alba.alba_10_26.vo.EmployeeVo;


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

     @RequestMapping("/employee/list.do")
	public String list(Model model) {

		List<EmployeeVo> list = employeeDao.selectList();

		model.addAttribute("list", list);

		return "owner/owner_list";
	}

    @RequestMapping("employee/login_form.do")
    public String login_form(){

        return "employee/employee_login_form";
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

    
}
