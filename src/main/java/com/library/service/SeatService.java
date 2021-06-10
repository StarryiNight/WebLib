package com.library.service;

import com.library.bean.Seat;
import com.library.dao.SeatDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class SeatService {
    @Autowired
    private SeatDao seatDao;

    public boolean deleteSeat(long seatId) {
        return seatDao.deleteSeat(seatId) > 0;
    }

    public boolean addSeat(long num,long seat_id,long room_id) {
        return seatDao.addSeat(num,seat_id,room_id)==num;
    }

    public ArrayList<Seat> seatList() {
        return seatDao.seatList();
    }

    public Seat getSeat(final long seat_id) {
        return seatDao.getSeat(seat_id);
    }

    public boolean editSeat(Seat seat) {
        return seatDao.editSeat(seat) > 0;
    }

    public ArrayList<Seat> roomSeatAvailable(final long room_id) {
        return seatDao.roomSeatAvailable(room_id);
    }

    public ArrayList<Seat> roomSeatList(final long room_id) {
        return seatDao.roomSeatList(room_id);
    }
}
