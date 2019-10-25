package com.freevote.dao;

import org.apache.ibatis.session.SqlSession;

import javax.annotation.Resource;
import java.util.List;

public abstract class SqlSessionDao {
    @Resource
    private SqlSession sqlSession;

    protected String getMethodName() {
        return Thread.currentThread().getStackTrace()[2].getMethodName();
    }
    protected <E> E selectOne(String id, Object parameter) {
        String statement = buildStatNameById(id);
        return (E)this.sqlSession.selectOne(statement, parameter);
    }
    protected int insert(String id, Object parameter) {
        String statement = buildStatNameById(id);
        return this.sqlSession.insert(statement, parameter);
    }
    protected int delete(String id, Object parameter) {
        String statement = buildStatNameById(id);
        return this.sqlSession.delete(statement, parameter);
    }
    protected int update(String id, Object parameter) {
        String statement = buildStatNameById(id);
        return this.sqlSession.update(statement, parameter);
    }
    protected <E> List<E> selectList(String id, Object parameter) {
        String statement = buildStatNameById(id);
        return this.sqlSession.selectList(statement, parameter);
    }
    protected String buildStatNameById(String id) {
        String namespace = getClass().getName();
        return String.valueOf(namespace) + "." + id;
    }
}
