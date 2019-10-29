package com.freevote.base.entity;

import com.freevote.common.entity.BaseEntity;
import lombok.Data;

/**
 * @author Duansg
 * @date 2019-09-03
 * @dec 用户实体
 */
@Data
public class User extends BaseEntity {

    private static final long serialVersionUID = 8153576140930022796L;
    /**
     * 用户姓名
     */
    private String userName;
    /**
     * 用户编码
     */
    private String userCode;
    /**
     * 用户封面图片
     */
    private String userImgUrl;
    /**
     * 用户投票总数
     */
    private String userVoteCount;
    /**
     * 用户描述
     */
    private String userDec;
    /**
     * 投票编码
     */
    private String voteCode;
}
