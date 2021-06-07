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

    private final static String NAMESPACE = "com.library.dao.SeatDao";

    public int addSeat(final int seat_id, final int room_id) {
        Map<String, Object> map = new HashMap<>();
        map.put("seat_id", seat_id);
        map.put("room_id", room_id);
        return sqlSessionTemplate.insert(NAMESPACE + "addSeat", map);
    }

    public int deleteSeat(final int seat_id) {
        return sqlSessionTemplate.delete(NAMESPACE + "deleteSeat", seat_id);
    }

    public ArrayList<Seat> seatList() {
        List<Seat> result = sqlSessionTemplate.selectList(NAMESPACE + "seatList");
        return (ArrayList<Seat>) result;
    }




}
