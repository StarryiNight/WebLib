package com.library.controller;

import com.library.bean.Announcement;
import com.library.bean.Book;
import com.library.service.AnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Controller
public class AnnouncementController {
    @Autowired
    private AnnouncementService announcementService;


    @RequestMapping("/deleteannouncement.html")
    public String deleteBook(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        long announcementId = Long.parseLong(request.getParameter("announcementId"));
        if (announcementService.deleteAnnouncement(announcementId)) {
            redirectAttributes.addFlashAttribute("succ", "公告删除成功");
        } else {
            redirectAttributes.addFlashAttribute("error", "公告删除失败");
        }
        return "redirect:/admin_main.html";
    }

    @RequestMapping("/announcement_add.html")
    public ModelAndView addAnnouncement() {
        return new ModelAndView("admin_announcement_add");
    }

    @RequestMapping("/announcement_add_do.html")
    public String addAnnouncementDo(Announcement announcement, RedirectAttributes redirectAttributes) {
        if (announcementService.addAnnouncement(announcement)) {
            redirectAttributes.addFlashAttribute("succ", "增加公告成功");
        } else {
            redirectAttributes.addFlashAttribute("error", "增加公告失败");
        }
        return "redirect:/admin_main.html";
    }

    @RequestMapping("/admin_announcement_detail.html")
    public ModelAndView adminAnnouncementDetail(HttpServletRequest request) {
        long announcementId = Long.parseLong(request.getParameter("announcement_id"));
        Announcement announcement = announcementService.getAnnouncement(announcementId);
        ModelAndView modelAndView = new ModelAndView("admin_announcement_detail");
        modelAndView.addObject("detail", announcement);
        return modelAndView;
    }
    @RequestMapping("/reader_announcement_detail.html")
    public ModelAndView readerAnnouncementDetail(HttpServletRequest request) {
        long announcementId = Long.parseLong(request.getParameter("announcement_id"));
        Announcement announcement = announcementService.getAnnouncement(announcementId);
        ModelAndView modelAndView = new ModelAndView("reader_announcement_detail");
        modelAndView.addObject("detail", announcement);
        return modelAndView;
    }


    @RequestMapping("/updateannouncement.html")
    public ModelAndView announcementEdit(HttpServletRequest request) {
        long announcement_id = Long.parseLong(request.getParameter("announcement_id"));
        Announcement announcement = announcementService.getAnnouncement(announcement_id);
        ModelAndView modelAndView = new ModelAndView("admin_announcement_edit");
        modelAndView.addObject("detail", announcement);
        return modelAndView;
    }

    @RequestMapping("/announcement_edit_do.html")
    public String announcementEditDo(Announcement announcement, RedirectAttributes redirectAttributes) {
        if (announcementService.editAnnouncement(announcement)) {
            redirectAttributes.addFlashAttribute("succ", "公告修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "公告修改失败！");
        }
        return "redirect:/admin_main.html";
    }

}