package com.library.controller;

import com.library.bean.Moment;
import com.library.service.MomentService;
import com.library.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Controller
public class MomentController {
    @Autowired
    private RecordService recordService;
    @Autowired
    private MomentService momentService;

    @RequestMapping("/moment_add.html")
    public ModelAndView addMoment() {
        return new ModelAndView("admin_moment_add");
    }

    @RequestMapping("/moment_add_do.html")
    public String addMomentDo(Moment moment, RedirectAttributes redirectAttributes) {

        if (momentService.addMoment(moment)) {
            redirectAttributes.addFlashAttribute("succ", "借阅时刻添加成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "借阅时刻添加失败！");
        }
        return "redirect:/admin_moment_list.html";
    }

    @RequestMapping("/updatemoment.html")
    public ModelAndView momentEdit(HttpServletRequest request) {
        int moment_id = Integer.parseInt(request.getParameter("moment_id"));
        Moment moment = momentService.getMoment(moment_id);
        ModelAndView modelAndView = new ModelAndView("admin_moment_edit");
        modelAndView.addObject("detail", moment);
        return modelAndView;
    }

    @RequestMapping("/moment_edit_do.html")
    public String momentEditDo(Moment moment, RedirectAttributes redirectAttributes) {
        if (momentService.editMoment(moment)) {
            redirectAttributes.addFlashAttribute("succ", "借阅时刻修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "借阅时刻修改失败！");
        }
        return "redirect:/admin_moment_list.html";
    }

    @RequestMapping("/admin_moment_list.html")
    public ModelAndView adminMomentList(HttpServletRequest request) {
        long seat_id = Long.parseLong(request.getParameter("seat_id"));
        ArrayList<Moment> allMoments = momentService.getAllMoments();
        ArrayList<Moment> usedMoments = recordService.usedMoment(seat_id);
        ModelAndView modelAndView = new ModelAndView("admin_moment_list");
        modelAndView.addObject("allMoments", allMoments);
        modelAndView.addObject("usedMoments", usedMoments);
        return modelAndView;
    }

    @RequestMapping("/reader_moment_list.html")
    public ModelAndView readerMomentList(HttpServletRequest request) {
        long seat_id = Long.parseLong(request.getParameter("seat_id"));
        ArrayList<Moment> allMoments = momentService.getAllMoments();
        ArrayList<Moment> usedMoments = recordService.usedMoment(seat_id);
        ArrayList<Moment> exceedMoment = momentService.exceedMoment();
        ModelAndView modelAndView = new ModelAndView("reader_moment_list");
        modelAndView.addObject("exceedMoment", exceedMoment);
        modelAndView.addObject("allMoments", allMoments);
        modelAndView.addObject("usedMoments", usedMoments);
        return modelAndView;
    }

    @RequestMapping("/admin_all_moment_list.html")
    public ModelAndView adminAllMomentList(HttpServletRequest request) {
        ArrayList<Moment> allMoments = momentService.getAllMoments();
        ModelAndView modelAndView = new ModelAndView("admin_all_moment_list");
        modelAndView.addObject("allMoments", allMoments);
        return modelAndView;
    }

}
