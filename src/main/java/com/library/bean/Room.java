package com.library.bean;

public class Room {
    long room_id;
    String location;
    long seat_sum;
    long seat_available;

    public long getRoom_id() {
        return room_id;
    }

    public void setRoom_id(long room_id) {
        this.room_id = room_id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public long getSeat_sum() {
        return seat_sum;
    }

    public void setSeat_sum(long seat_sum) {
        this.seat_sum = seat_sum;
    }

    public long getSeat_available() {
        return seat_available;
    }

    public void setSeat_available(long seat_available) {
        this.seat_available = seat_available;
    }
}
