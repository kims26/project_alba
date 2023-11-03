package alba.alba_10_26.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import alba.alba_10_26.vo.BoardVo;


@Mapper
public interface BoardDao {

   public List<BoardVo> selectList();

     public int insertBoard(BoardVo vo);

      List<BoardVo> selectConditionList(Map<String, Object> map);

      int selectRowTotal(Map<String, Object> map);

      int update_readhit(int b_idx);

      BoardVo selectOne(int b_idx);

      // int selectComment(int b_idx);
     
      int update(BoardVo vo);

      int delete(int b_idx);
    
}
