package com.freevote.dao.impl;

import com.freevote.dao.BaseDao;
import com.freevote.dao.SqlSessionDao;
import com.freevote.entity.BaseEntity;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BaseDaoImpl<T extends BaseEntity,PK extends Serializable>  extends SqlSessionDao implements BaseDao<T,PK> {

    @Override
    public T get(PK id) {
        Map<String, Object> params = new HashMap<String,Object>();
        params.put("id", id);
        return selectOne(getMethodName(), params);
    }
    @Override
    public int insert(T t) {
        return insert(getMethodName(), t);
    }

    @Override
    public int delete(PK id) {
        Map<String, Object> params = new HashMap<String,Object>();
        params.put("id", id);
        return delete(getMethodName(), params);
    }
    @Override
    public int update(T t) {
        return update(getMethodName(), t);
    }

    @Override
    public T selectOne(T t) {
        return selectOne(getMethodName(), t);
    }

    @Override
    public List<T> findAll(T t) {
        return selectList(getMethodName(), t);
    }
}
