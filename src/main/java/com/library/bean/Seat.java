package com.library.bean;

import java.io.Serializable;

public class Seat implements Serializable {
    private long seat_id;
    private long room_id;


    public long getSeat_id() {
        return seat_id;
    }

    public void setSeat_id(long seat_id) {
        this.seat_id = seat_id;
    }

    public long getRoom_id() {
        return room_id;
    }

    public void setRoom_id(long room_id) {
        this.room_id = room_id;
    }

}
