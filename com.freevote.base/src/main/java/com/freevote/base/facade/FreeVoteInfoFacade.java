package com.freevote.base.facade;

import com.freevote.base.vo.VoteInfoVo;

public interface FreeVoteInfoFacade {
    /**
     * 1：根据投票编码查询投票信息
     * 2：根据投票编码和用户编码查询投票信息
     * 2：根据投票编码和用户名称查询投票信息
     * @param voteCode
     * @param userInfo
     * @return
     */
    VoteInfoVo getVoteInfoAndUsers(String voteCode, String userInfo);
}
