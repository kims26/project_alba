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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import alba.alba_10_26.dao.BoardDao;
import alba.alba_10_26.dao.EmployeeDao;
import alba.alba_10_26.vo.BoardVo;
import alba.alba_10_26.vo.EmployeeVo;
import util.MyConstant;
import util.Paging;


@Controller
public class BoardController {

     @Autowired
    HttpSession session;

    @Autowired
    HttpServletRequest request;

    BoardDao boardDao;

   

    @Autowired 
    	public BoardController(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

    @RequestMapping("board/board_list.do")
   public String list(@RequestParam(name = "search", defaultValue = "all") String search,
            @RequestParam(name = "search_text", defaultValue = "") String search_text,
            @RequestParam(name = "page", defaultValue = "1") int nowPage, Model model) {

        // 검색조건을 담을 Map
        Map<String, Object> map = new HashMap<String, Object>();

        // 가져올 게시물 시작/끝을 구한다
        int start = (nowPage - 1) * MyConstant.Board.BLOCK_LIST + 1;
        int end = start + MyConstant.Board.BLOCK_LIST - 1;

        map.put("start", start);
        map.put("end", end);

        // 검색 map조건포장
        if (search.equals("e_name_b_title_b_contents")) {
            // 이름 + 제목+ 내용
            map.put("e_name", search_text);
            map.put("b_title", search_text);
            map.put("b_contents", search_text);

        } else if (search.equals("e_name")) {
            // 이름
            map.put("e_name", search_text);
        } else if (search.equals("b_title")) {
            // 제목
            map.put("b_title", search_text);
        } else if (search.equals("b_contents")) {
            // 내용
            map.put("b_contents", search_text);
        }
        List<BoardVo> list = boardDao.selectConditionList(map);

        // 전체 게시물 수
        int rowTotal = boardDao.selectRowTotal(map);// 현재 map 정보는 일단 무시

        // 페이징 메뉴 생성하기
        // 검색 조건 필터
        String search_filter = String.format("search=%s&search_text=%s", search, search_text);

        String pageMenu = Paging.getPaging("board_list.do",
                search_filter,
                nowPage,
                rowTotal,
                MyConstant.Board.BLOCK_LIST,
                MyConstant.Board.BLOCK_PAGE);

        // 이전 view.do에서 session저장해놓은 show값 지우기
        session.removeAttribute("shows");

        // model->DispatcherServlet전달->request binding
        // ->return되는 뷰정보를 이용해서 forward
        model.addAttribute("list", list);
        model.addAttribute("pageMenu", pageMenu);

        return "board/board_list";
    }

    @RequestMapping("board/insert_form.do")
    public String insert_form(){

        return "board/insert_form";
    }


    @RequestMapping("board/insert.do")
    public String insert(BoardVo vo, RedirectAttributes ra) {

        // 로그인 유저정보 구하기
        EmployeeVo member = (EmployeeVo) session.getAttribute("member");

        // 로그아웃된 상태면
        if (member == null) {

            ra.addAttribute("reason", "fail_session_timeout");
            // login_form.do?reason=fail_session_timeout
            return "redirect:../employee/login_form.do";
        }

        // 로그인된 유저정보를 vo에 넣는다
        vo.setE_idx(member.getE_idx());
        vo.setE_name(member.getE_name());

       

        // \n -> <br>
        String b_contents = vo.getB_contents().replaceAll("\n", "<br>");
        vo.setB_contents(b_contents);

        // DB Insert
        int res = boardDao.insertBoard(vo);
        if (res == 0) {
        }

        return "redirect:board_list.do";
    }
    
    
}
