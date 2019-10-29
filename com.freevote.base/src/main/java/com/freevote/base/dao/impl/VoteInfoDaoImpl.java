package com.freevote.base.dao.impl;

import com.freevote.base.dao.VoteInfoDao;
import com.freevote.base.entity.VoteInfo;
import com.freevote.common.base.impl.BaseDaoImpl;
import org.springframework.stereotype.Repository;

@Repository
public class VoteInfoDaoImpl extends BaseDaoImpl<VoteInfo,Long> implements VoteInfoDao {

}
