package com.library.controller;

import com.library.bean.ReaderCard;
import com.library.bean.Seat;
import com.library.service.SeatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
        return "redirect:/admin_seat.html";
    }

    @RequestMapping("/addseat.html")
    public String addBook(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        long seatId = Long.parseLong(request.getParameter("seatId"));
        long roomId = Integer.parseInt(request.getParameter("roomId"));
        if (seatService.addSeat(seatId, roomId)) {
            redirectAttributes.addFlashAttribute("succ", "增加座位成功");
        } else {
            redirectAttributes.addFlashAttribute("error", "增加座位失败");
        }
        return "redirect:/admin_seat.html";
    }


    @RequestMapping("/admin_seats.html")
    public ModelAndView seatList() {
        ArrayList<Seat> seats = seatService.seatList();
        ModelAndView modelAndView = new ModelAndView("admin_seats");
        modelAndView.addObject("seat", seats);
        modelAndView.addObject("usedSeat", seats);
        return modelAndView;
    }

    @RequestMapping("/myseat.html")
    public ModelAndView mySeat(HttpServletRequest request) {
        ReaderCard readerCard = (ReaderCard) request.getSession().getAttribute("readercard");
        ModelAndView modelAndView = new ModelAndView("reader_seat_list");
        modelAndView.addObject("seat", seatService.mySeatList(readerCard.getReaderId()));
        return modelAndView;
    }


}