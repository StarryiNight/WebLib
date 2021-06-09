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

    public Seat getSeat(long seat_id) {
        return seatDao.getSeat(seat_id);
    }

    public boolean editSeat(Seat seat) {
        return seatDao.eidtSeat(seat) > 0;
    }
}
