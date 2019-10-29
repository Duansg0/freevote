package com.freevote.common.base;

import com.freevote.common.entity.BaseEntity;
import java.io.Serializable;
import java.util.List;

/**
 * @author Duansg
 * @param <T>
 * @date 2019-09-02
 */
public interface BaseDao<T extends BaseEntity,PK extends Serializable> {
    /**
     * 根据id获取实体
     * @param id
     * @return
     */
    T get(PK id);
    /**
     * 插入实体
     * @param t
     * @return
     */
    int insert(T t);

    /**
     * 删除实体
     * @param id
     * @return
     */
    int delete(PK id);

    /**
     * 更新实体
     * @param t
     * @return
     */
    int update(T t);

    /**
     * 查询一条
     * @param t
     * @return
     */
    T selectOne(T t);

    /**
     * 根据条件查询全部
     * @param t
     * @return
     */
    List<T> findAll(T t);
}
