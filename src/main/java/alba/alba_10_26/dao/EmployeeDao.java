package alba.alba_10_26.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import alba.alba_10_26.vo.EmployeeVo;


@Mapper
public interface EmployeeDao {

     public int insertEmployee(EmployeeVo vo);

     public List<EmployeeVo> selectList();

     public EmployeeVo selectOneFromIdx(int e_idx);

     public EmployeeVo selectOneFromId(String e_id);

     public int update(EmployeeVo vo);
    
}
