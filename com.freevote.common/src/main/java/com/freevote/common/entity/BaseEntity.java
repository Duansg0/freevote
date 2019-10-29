package com.freevote.common.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Duansg
 * @date 2019-09-02
 * @dec 通用DAO实体基类
 */
@Data
public class BaseEntity implements Serializable {

    private static final long serialVersionUID = 407206012766372982L;
    /**
     * 主键
     */
    private long id;
    /**
     * 删除标识
     */
    private String deleted = "F";
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 修改时间
     */
    private Date modifyTime;

}
