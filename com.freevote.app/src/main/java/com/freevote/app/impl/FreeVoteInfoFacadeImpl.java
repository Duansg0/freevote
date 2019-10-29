package com.freevote.app.impl;

import com.freevote.base.entity.VoteInfo;
import com.freevote.base.facade.FreeVoteInfoFacade;
import com.freevote.base.service.VoteInfoService;
import com.freevote.base.vo.VoteInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreeVoteInfoFacadeImpl implements FreeVoteInfoFacade {

    @Autowired
    private VoteInfoService voteInfoService;

    @Override
    public VoteInfoVo getVoteInfoAndUsers(String voteCode, String userInfo) {
        VoteInfo voteInfo = voteInfoService.getVoteInfo(voteCode);

        return null;
    }
}
