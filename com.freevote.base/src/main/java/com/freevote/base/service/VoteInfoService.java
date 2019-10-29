package com.freevote.base.service;

import com.freevote.base.entity.VoteInfo;

public interface VoteInfoService {

    /**
     * 根据活动编码获取活动信息
     * @param voteCode
     * @return
     */
    VoteInfo getVoteInfo(String voteCode);

}
