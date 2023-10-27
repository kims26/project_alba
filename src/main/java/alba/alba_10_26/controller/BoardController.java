package alba.alba_10_26.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

     @Autowired
    HttpSession session;

    @Autowired
    HttpServletRequest request;

    @RequestMapping("board/board_list.do")
    public String board_list(){

        return "board/board_list";

    }
    
}
