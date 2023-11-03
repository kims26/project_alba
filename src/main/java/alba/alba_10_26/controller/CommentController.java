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
import org.springframework.web.bind.annotation.ResponseBody;

import alba.alba_10_26.dao.CommentDao;
import alba.alba_10_26.vo.CommentVo;
import util.MyConstant;
import util.Paging;

@Controller
public class CommentController {
    
     @Autowired
    HttpSession session;

    @Autowired
    HttpServletRequest request;

    CommentDao commentDao;

    public CommentController(CommentDao commentDao){
        this.commentDao =commentDao;
    }

    @RequestMapping("/board/comment_list.do")
    public String comment_list(int b_idx,
    @RequestParam(name = "page", defaultValue = "1") int nowPage, Model model) {

        Map<String, Object> map = new HashMap<String, Object>();

        // 검색범위 구하기
        int start = (nowPage - 1) * MyConstant.Comment.BLOCK_LIST + 1;
        int end = start + MyConstant.Comment.BLOCK_LIST - 1;

        // 검색조건을 map에 포장
        map.put("b_idx", b_idx);
        map.put("start", start);
        map.put("end", end);

        List<CommentVo> list = commentDao.selectList(map);

        int rowTotal = commentDao.selectRowTotal(map);// 현재 map 정보는 일단 무시

        String pageMenu = Paging.getPaging1("comment_list.do",
                nowPage,
                rowTotal,
                MyConstant.Comment.BLOCK_LIST,
                MyConstant.Comment.BLOCK_PAGE);

        // 이전 view.do에서 session저장해놓은 show값 지우기
        session.removeAttribute("show");

        model.addAttribute("list", list);
        model.addAttribute("pageMenu", pageMenu);

        return "board/comment_list"; 
    }

    @RequestMapping("/board/comment_insert.do")
    @ResponseBody
    public Map<String, String> comment_insert(CommentVo vo) {

        // \n -> <br>
        String c_comment = vo.getC_comment().replaceAll("\n", "<br>");
        vo.setC_comment(c_comment);

        int res = commentDao.insert(vo);

        Map<String, String> map = new HashMap<String, String>();

        if (res == 1) {
            map.put("result", "success");
        } else {
            map.put("result", "fail");
        }
        return map;
    }

    @RequestMapping("/board/comment_delete.do")
    @ResponseBody
    public Map<String, String> comment_delete(int c_idx) {

        int res = commentDao.delete(c_idx);

        Map<String, String> map = new HashMap<String, String>();

        if (res == 1) {

            map.put("result", "success");
        } else {
            map.put("result", "fail");
        }
        return map;

    }

}
