package alba.alba_10_26.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import alba.alba_10_26.vo.CommentVo;

@Mapper
public interface CommentDao {

    List<CommentVo> selectList(Map<String, Object>map);

    int selectRowTotal(Map<String,Object>map);

    int insert(CommentVo vo);

    int delete(int c_idx);
    
}
