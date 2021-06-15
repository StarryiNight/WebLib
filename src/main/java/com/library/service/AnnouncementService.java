package com.library.service;

import com.library.bean.Announcement;
import com.library.dao.AnnouncementDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class AnnouncementService {
    @Autowired
    private AnnouncementDao announcementDao;



    public ArrayList<Announcement> getAllAnnouncements() {
        return announcementDao.getAllAnnouncements();
    }


    public boolean addAnnouncement(Announcement announcement) {
        return announcementDao.addAnnouncement(announcement) > 0;
    }

    public Announcement getAnnouncement(Long announcementId) {
        return announcementDao.getAnnouncement(announcementId);
    }

    public boolean editAnnouncement(Announcement announcement) {
        return announcementDao.editAnnouncement(announcement) > 0;
    }

    public boolean deleteAnnouncement(Long announcementId) {
        return announcementDao.deleteAnnouncement(announcementId) > 0;
    }

}
