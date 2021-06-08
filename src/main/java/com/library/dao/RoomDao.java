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

    public final static String NAMESPACE = "com.library.dao.RoomDAO.";

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

    public int deleteRoom(final long roomId) {
        return sqlSessionTemplate.delete(NAMESPACE + "deleteRoom", roomId);
    }

    public Room getRoom(final long roomId) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "addBook", roomId);
    }

}
