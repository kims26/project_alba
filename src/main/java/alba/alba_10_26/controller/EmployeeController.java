package alba.alba_10_26.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmployeeController {

    @RequestMapping("employee/login_form.do")
    public String login_form(){

        return "employee/employee_login_form";
    }

    @RequestMapping("/employee/insert_form.do")
	public String insert_form() {

		return "employee/employee_insert_form";
	}

    
}
