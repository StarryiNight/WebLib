package com.library.service;

import com.library.bean.Room;
import com.library.dao.RoomDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class RoomService {
    @Autowired
    private RoomDao roomDao;

    public ArrayList<Room> roomList() {
        return roomDao.roomList();
    }

    public boolean editRoom(Room room) {
        return roomDao.editRoom(room) > 0;
    }

    public boolean deleteRoom(long roomId) {
        return roomDao.deleteRoom(roomId)>0;
    }

    public boolean addRoom(Room room) {
        return roomDao.addRoom(room) > 0;
    }

    public Room getRoom(long roomId) {
        return roomDao.getRoom(roomId);
    }
}
