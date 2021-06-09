package com.library.dao;

import com.library.bean.Room;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class RoomDao {

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public final static String NAMESPACE = "com.library.dao.RoomDao.";

    public ArrayList<Room> roomList() {
        List<Room> result = sqlSessionTemplate.selectList(NAMESPACE + "roomList");
        return (ArrayList<Room>) result;
    }

    public int addRoom(final Room room) {
        return sqlSessionTemplate.insert(NAMESPACE + "addRoom", room);
    }

    public int editRoom(final Room room) {
        return sqlSessionTemplate.update(NAMESPACE + "editRoom", room);
    }

    public int deleteRoom(final long room_id) {
        return sqlSessionTemplate.delete(NAMESPACE + "deleteRoom", room_id);
    }

    public Room getRoom(final long room_id) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getRoom", room_id);
    }

}
