package com.library.controller;

import com.library.service.SeatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
public class SeatController {
    @Autowired
    private SeatService seatService;

    @RequestMapping("/deleteseat.html")
    public String deleteBook(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        int seatId = Integer.parseInt(request.getParameter("seatId"));
        if (seatService.deleteSeat(seatId)) {
            redirectAttributes.addFlashAttribute("succ", "座位删除成功");
        } else {
            redirectAttributes.addFlashAttribute("error", "座位删除失败");
        }
        return "redirect:/admin_seat.html";
    }

    @RequestMapping("/addseat.html")
    public String addBook(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        int seatId = Integer.parseInt(request.getParameter("seatId"));
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        if (seatService.addSeat(seatId, roomId)) {
            redirectAttributes.addFlashAttribute("succ", "增加座位成功");
        } else {
            redirectAttributes.addFlashAttribute("error", "增加座位失败");
        }
        return "redirect:/admin_seat.html";
    }

    @RequestMapping("/seatlist.html")
    public ModelAndView seatList(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("admin_seat_list");
        modelAndView.addObject("list", seatService.seatList());
        return modelAndView;
    }
}