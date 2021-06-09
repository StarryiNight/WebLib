package com.library.service;

import com.library.bean.Book;
import com.library.bean.Record;
import com.library.dao.RecordDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class RecordService {
    @Autowired
    private RecordDao recordDao;

    public ArrayList<Record> getAllRecords() {
        return recordDao.getAllRecords();
    }

    public boolean addRecord(Record record) {
        return recordDao.addRecord(record) > 0;
    }

    public Record getRecord(Long record_id) {
        return recordDao.getRecord(record_id);
    }

    public boolean editRecord(Record record) {
        return recordDao.editRecord(record) > 0;
    }

    public boolean deleteRecord(Long bookId) {
        return recordDao.deleteBook(bookId) > 0;
    }

}
