package com.library.controller;

import com.library.bean.ReaderCard;
import com.library.bean.Seat;
import com.library.service.SeatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

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
        return "redirect:/admin_seats.html";
    }

    @RequestMapping("/seat_add.html")
    public ModelAndView addSeat() {
        return new ModelAndView("admin_seat_add");
    }

    @RequestMapping("/seat_add_do.html")
    public String addSeatDo(long num,long seat_id,long room_id, RedirectAttributes redirectAttributes) {
        if (seatService.addSeat(num, seat_id, room_id)) {
            redirectAttributes.addFlashAttribute("succ", "增加座位成功");
        } else {
            redirectAttributes.addFlashAttribute("error", "增加座位失败");
        }
        return "redirect:/admin_seats.html";
    }


        @RequestMapping("/admin_seats.html")
    public ModelAndView seatList() {
        ArrayList<Seat> seats = seatService.seatList();
        ModelAndView modelAndView = new ModelAndView("admin_seats");
        modelAndView.addObject("seat", seats);
        //modelAndView.addObject("usedSeat", seats);
        return modelAndView;
    }

    @RequestMapping("/updateseat.html")
    public ModelAndView seatEdit(HttpServletRequest request) {
        long seat_id = Long.parseLong(request.getParameter("seat_id"));
        Seat seat = seatService.getSeat(seat_id);
        ModelAndView modelAndView = new ModelAndView("admin_seat_edit");
        modelAndView.addObject("detail", seat);
        return modelAndView;
    }

    public String seatEditDo(Seat seat, RedirectAttributes redirectAttributes) {
        if (seatService.editSeat(seat)) {
            redirectAttributes.addFlashAttribute("succ", "座位修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "座位修改失败！");
        }
        return "redirect:/admin_seats.html";
    }



}