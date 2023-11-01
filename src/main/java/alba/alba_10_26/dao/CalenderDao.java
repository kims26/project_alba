package alba.alba_10_26.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import alba.alba_10_26.vo.CalenderVo;

@Mapper
public interface CalenderDao {

    public List<CalenderVo> selectList();
    
}
