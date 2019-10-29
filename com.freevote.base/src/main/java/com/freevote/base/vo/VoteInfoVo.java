package com.freevote.base.vo;

import com.freevote.base.entity.User;
import com.freevote.base.entity.VoteInfo;
import lombok.Data;
import java.io.Serializable;
import java.util.List;

@Data
public class VoteInfoVo implements Serializable {

    private static final long serialVersionUID = 2173652088444478344L;
    /**
     * 活动用户集
     */
    private List<User> users;
    /**
     * 投票信息
     */
    private VoteInfo voteInfo;
}
