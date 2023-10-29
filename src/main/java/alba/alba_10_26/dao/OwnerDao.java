package alba.alba_10_26.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import alba.alba_10_26.vo.OwnerVo;

@Mapper
public interface OwnerDao {

     public List<OwnerVo> selectList();

     public int insertOwner(OwnerVo vo);

     public OwnerVo selectOneFromIdx(int o_idx);

     public OwnerVo selectOneFromId(String o_id);
    
}
