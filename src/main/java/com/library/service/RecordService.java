package com.library.service;


import com.library.bean.Moment;
import com.library.bean.Record;
import com.library.dao.MomentDao;
import com.library.dao.RecordDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

@Service
public class RecordService {
    @Autowired
    private RecordDao recordDao;
    @Autowired
    private MomentDao momentDao;



    public ArrayList<Record> getAllRecords() {
        return recordDao.getAllRecords();
    }

    public boolean addRecord(Record record) {
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
        java.util.Date date=new java.util.Date();
        String str=sdf1.format(date);

        String start = sdf2.format(record.getStart_time());
        String end = sdf2.format(record.getEnd_time());

        start = str + " "+start;
        end = str + " " + end;

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            record.setStart_time(sdf.parse(start));
            record.setEnd_time(sdf.parse(end));
        } catch (ParseException e) {
            e.printStackTrace();
        }


        return recordDao.addRecord(record) > 0;
    }

    public Record getRecord(Long record_id) {
        return recordDao.getRecord(record_id);
    }

    public boolean editRecord(Record record) {
        return recordDao.editRecord(record) > 0;
    }

    public boolean signRecord(Record record) {
        return recordDao.recordSign(record) > 0;
    }

    public boolean deleteRecord(Long record) {
        return recordDao.deleteRecord(record) > 0;
    }

    public ArrayList<Record> myRecordList(Long reader_id){
        return recordDao.myRecordList(reader_id);
    }



    public ArrayList<Moment> usedMoment(long seat_id) {
        ArrayList<Long> recordIds=recordDao.usedSeatRecordId(seat_id);
        Set<Integer> set = new HashSet<>();
        ArrayList<Moment> usedMoment = new ArrayList<>();

        for (long i : recordIds) {
            ArrayList<Moment> arr = momentDao.usedMoment(i);
            for (Moment j : arr) {
                if (!set.contains(j.getMoment_id())) {
                    set.add(j.getMoment_id());
                    usedMoment.add(j);
                }
            }
        }
        return usedMoment;
    }



    public ArrayList<Record> unSignedRecord(Long reader_id) {
        return recordDao.unSignedRecord(reader_id);
    }

    public ArrayList<Record> exceedRecord(Long reader_id){
        return recordDao.exceedRecord(reader_id);
    }

    public ArrayList<Record> allUnSignedRecord() {
        return recordDao.allUnSignedRecord();
    }

    public ArrayList<Record> allExceedRecord(){
        return recordDao.allExceedRecord();
    }

    public ArrayList<Record> allUnSignedTime(){
        return recordDao.allUnSignedTime();
    }
}
