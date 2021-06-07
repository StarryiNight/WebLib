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

    public boolean deleteSeat(int seatId) {
        return seatDao.deleteSeat(seatId) > 0;
    }

    public boolean addSeat(int seatId, int roomId) {
        return seatDao.addSeat(seatId, roomId) > 0;
    }

    public ArrayList<Seat> seatList() {
        return seatDao.seatList();
    }
}
