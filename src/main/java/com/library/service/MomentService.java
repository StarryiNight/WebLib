package com.library.service;

import com.library.bean.Moment;
import com.library.dao.MomentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class MomentService {
    @Autowired
    private MomentDao momentDao;

    public ArrayList<Moment> getAllMoments() {
        return momentDao.getAllMoments();
    }
    

    public boolean addMoment(Moment moment) {
        return momentDao.addMoment(moment) > 0;
    }

    public Moment getMoment(int momentId) {
        return momentDao.getMoment(momentId);
    }

    public boolean editMoment(Moment moment) {
        return momentDao.editMoment(moment) > 0;
    }

    public boolean deleteMoment(int momentId) {
        return momentDao.deleteMoment(momentId) > 0;
    }




}
