package alba.alba_10_26.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVo {

    int b_idx;
    String b_title;
    String b_contents;
    String b_create_date;
    String b_update_date;
    int b_view_cnt;
    int m_idx;
    
}
