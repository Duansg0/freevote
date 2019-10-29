package com.freevote.base.entity;

import com.freevote.common.entity.BaseEntity;
import lombok.Data;

/**
 * @author Duansg
 * @date 2019-09-11
 * @dec 活动详情
 */
@Data
public class VoteInfo extends BaseEntity {

    private static final long serialVersionUID = -6061197461137619995L;
    /**
     * 封面地址
     */
    private String imgUrl;
    /**
     * 活动编码
     */
    private String voteCode;
    /**
     * 活动简介
     */
    private String voteProfile;
    /**
     * 活动规则
     */
    private String voteRule;
    /**
     * 活动奖品
     */
    private String votePrize;

}
