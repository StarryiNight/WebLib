package com.library.dao;

import com.library.bean.Seat;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class SeatDao {
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    private final static String NAMESPACE = "com.library.dao.SeatDao.";


    public int addSeat(long num,long  seat_id,long room_id) {
        Map<String, Object> map = new HashMap<>();
        map.put("room_id", room_id);
        int count = 0;
        for (int i = 0; i < num; i++) {
            map.put("seat_id", seat_id+i);
            count+= sqlSessionTemplate.insert(NAMESPACE + "autoAddSeatNum", map);
        }
        return count;
    }

    public int deleteSeat(final long seat_id) {
        return sqlSessionTemplate.delete(NAMESPACE + "deleteSeat", seat_id);
    }

    public ArrayList<Seat> seatList() {
        List<Seat> result = sqlSessionTemplate.selectList(NAMESPACE + "seatList");
        return (ArrayList<Seat>) result;
    }

    public int editSeat(final Seat seat) {
        return sqlSessionTemplate.update(NAMESPACE + "editSeat", seat);
    }

    public Seat getSeat(final long seat_id) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getSeat", seat_id);
    }

}
