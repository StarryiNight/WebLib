package com.library.dao;


import com.library.bean.Book;
import com.library.bean.Record;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class RecordDao {
    private final static String NAMESPACE = "com.library.dao.RecoderDao";

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public ArrayList<Record> getAllRecords() {
        List<Record> result = sqlSessionTemplate.selectList(NAMESPACE + "getAllRrcord");
        return (ArrayList<Record>) result;
    }

    public int addRecord(final Record record) {
        return sqlSessionTemplate.insert(NAMESPACE + "addRecord", record);
    }

    public Record getRecord(final long record_id) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getRecord", record_id);
    }

    public int editRecord(final Record record) {
        return sqlSessionTemplate.update(NAMESPACE + "editRecord", record);
    }

    public int deleteRecord(final long record_id) {
        return sqlSessionTemplate.delete(NAMESPACE + "deleteRecord", record_id);
    }
}