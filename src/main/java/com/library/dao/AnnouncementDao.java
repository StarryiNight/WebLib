package com.library.dao;

import com.library.bean.Announcement;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class AnnouncementDao {

    private final static String NAMESPACE = "com.library.dao.AnnouncementDao.";
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;
    

    public ArrayList<Announcement> getAllAnnouncements() {
        List<Announcement> result = sqlSessionTemplate.selectList(NAMESPACE + "getAllAnnouncements");
        return (ArrayList<Announcement>) result;
    }

    public int addAnnouncement(final Announcement announcement) {
        return sqlSessionTemplate.insert(NAMESPACE + "addAnnouncement", announcement);
    }

    public Announcement getAnnouncement(final long announcementId) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getAnnouncement", announcementId);
    }

    public int editAnnouncement(final Announcement announcement) {
        return sqlSessionTemplate.update(NAMESPACE + "editAnnouncement", announcement);
    }

    public int deleteAnnouncement(final long announcementId) {
        return sqlSessionTemplate.delete(NAMESPACE + "deleteAnnouncement", announcementId);
    }
}
