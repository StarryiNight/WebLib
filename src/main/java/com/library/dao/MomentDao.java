package com.library.dao;

import com.library.bean.Moment;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class MomentDao {
    private final static String NAMESPACE = "com.library.dao.MomentDao.";

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public int addMoment(final Moment moment) {
        return sqlSessionTemplate.insert(NAMESPACE + "addMoment", moment);
    }

    public ArrayList<Moment> getAllMoments() {
        List<Moment> result = sqlSessionTemplate.selectList(NAMESPACE + "getAllMoments");
        return (ArrayList<Moment>) result;
    }

    public int editMoment(final Moment moment) {
        return sqlSessionTemplate.update(NAMESPACE + "editMoment", moment);
    }

    public Moment getMoment(final int  MomentId) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getMoment", MomentId);
    }

    public int deleteMoment(final long MomentId) {
        return sqlSessionTemplate.delete(NAMESPACE + "deleteMoment", MomentId);
    }

    public int getMomentCount() {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getMomentCount");
    }

    public ArrayList<Moment> usedMoment(final long record_id) {
        List<Moment> result = sqlSessionTemplate.selectList(NAMESPACE + "usedMoment", record_id);
        return (ArrayList<Moment>) result;
    }
}
