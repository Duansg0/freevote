package com.freevote.base.service.impl;

import com.freevote.base.dao.VoteInfoDao;
import com.freevote.base.entity.VoteInfo;
import com.freevote.base.service.VoteInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VoteInfoServiceImpl implements VoteInfoService {

    @Autowired
    private VoteInfoDao voteInfoDao;

    @Override
    public VoteInfo getVoteInfo(String voteCode) {
        VoteInfo voteInfo = new VoteInfo();
        voteInfo.setVoteCode(voteCode);
        return voteInfoDao.selectOne(voteInfo);
    }

}
