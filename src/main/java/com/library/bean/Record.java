package com.library.bean;

import java.util.Date;

public class Record {
    long record_id;
    long seat_id;
    long recorder_id;
    Date start_time;
    Date end_time;

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

    public long getRecorder_id() {
        return recorder_id;
    }

    public void setRecorder_id(long recorder_id) {
        this.recorder_id = recorder_id;
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }
}
