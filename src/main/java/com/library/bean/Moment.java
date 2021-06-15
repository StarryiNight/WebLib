package com.library.bean;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

public class Moment implements Serializable {
    private int moment_id;
    private Time start_moment;
    private Time end_moment;

    public int getMoment_id() {
        return moment_id;
    }

    public void setMoment_id(int moment_id) {
        this.moment_id = moment_id;
    }

    public Date getStart_moment() {
        return start_moment;
    }

    public void setStart_moment(Time start_moment) {
        this.start_moment = start_moment;
    }

    public Date getEnd_moment() {
        return end_moment;
    }

    public void setEnd_moment(Time end_moment) {
        this.end_moment = end_moment;
    }


}
