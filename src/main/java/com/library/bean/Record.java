package com.library.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Record {
    long record_id;
    long seat_id;
    long reader_id;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    Date start_time;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    Date end_time;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    Date sign_time;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getSign_time() {
        return sign_time;
    }

    public void setSign_time(Date sign_time) {
        this.sign_time = sign_time;
    }

    public long getRecord_id() {
        return record_id;
    }

    public void setRecord_id(long record_id) {
        this.record_id = record_id;
    }

    public long getSeat_id() {
        return seat_id;
    }

    public void setSeat_id(long seat_id) {
        this.seat_id = seat_id;
    }

    public long getReader_id() {
        return reader_id;
    }

    public void setReader_id(long reader_id) {
        this.reader_id = reader_id;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }
}
