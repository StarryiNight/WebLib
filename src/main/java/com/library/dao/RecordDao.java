package com.library.dao;

import com.library.bean.Moment;
import com.library.bean.Record;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class RecordDao {
    private final static String NAMESPACE = "com.library.dao.RecordDao.";

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public ArrayList<Record> getAllRecords() {
        List<Record> result = sqlSessionTemplate.selectList(NAMESPACE + "getAllRecords");
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

    public ArrayList<Record> myRecordList(final long reader_id) {
        List<Record> result = sqlSessionTemplate.selectList(NAMESPACE + "myRecordList", reader_id);
        return (ArrayList < Record >) result;
    }



    public ArrayList<Long> usedSeatRecordId(final long seat_id) {
        List<Long> result = sqlSessionTemplate.selectList(NAMESPACE + "usedSeatRecordId", seat_id);
        return (ArrayList<Long>) result;
    }

    public int recordSign(final Record record) {
        return sqlSessionTemplate.update(NAMESPACE + "recordSign", record);
    }

    public ArrayList<Record> unSignedRecord(final long reader_id) {
        List<Record> result = sqlSessionTemplate.selectList(NAMESPACE + "unSignedRecord", reader_id);
        return (ArrayList<Record>) result;
    }

    public ArrayList<Record> allUnSignedRecord() {
        List<Record> result = sqlSessionTemplate.selectList(NAMESPACE + "allUnSignedRecord");
        return (ArrayList<Record>) result;
    }

    public ArrayList<Record> exceedRecord(final long reader_id) {
        List<Record> result = sqlSessionTemplate.selectList(NAMESPACE + "exceedRecord", reader_id);
        return (ArrayList < Record >) result;
    }

    public ArrayList<Record> allExceedRecord() {
        List<Record> result = sqlSessionTemplate.selectList(NAMESPACE + "allExceedRecord");
        return (ArrayList < Record >) result;
    }


}