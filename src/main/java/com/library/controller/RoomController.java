package com.library.controller;

import com.library.bean.Room;
import com.library.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
public class RoomController {
    @Autowired
    private RoomService roomService;

    @RequestMapping("/admin_room_list.html")
    private ModelAndView AdminRoomList() {
        ModelAndView modelAndView = new ModelAndView("admin_room_list");
        modelAndView.addObject("rooms", roomService.roomList());
        return modelAndView;
    }

    @RequestMapping("/updateroom.html")
    public ModelAndView roomEdit(HttpServletRequest request) {
        long roomId = Long.parseLong(request.getParameter("room_id"));
        Room room = roomService.getRoom(roomId);
        ModelAndView modelAndView = new ModelAndView("admin_room_edit");
        modelAndView.addObject("detail", room);
        return modelAndView;
    }

    @RequestMapping("/room_edit_do.html")
    public String roomEditDo(Room room, RedirectAttributes redirectAttributes) {
        if (roomService.editRoom(room)) {
            redirectAttributes.addFlashAttribute("succ", "阅览室修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "阅览室修改失败！");
        }
        return "redirect:/admin_room_list.html";
    }

    @RequestMapping("/reader_room_list.html")
    private ModelAndView ReaderRoomList() {
        ModelAndView modelAndView = new ModelAndView("reader_room_list");
        modelAndView.addObject("rooms", roomService.roomList());
        return modelAndView;
    }

    @RequestMapping("/room_add.html")
    public ModelAndView addBook() {
        return new ModelAndView("admin_room_add");
    }

    @RequestMapping("/room_add_do.html")
    public String addBookDo(Room room , RedirectAttributes redirectAttributes) {
        if (roomService.addRoom(room)) {
            redirectAttributes.addFlashAttribute("succ", "阅览室添加成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "阅览室添加失败！");
        }
        return "redirect:/admin_room_list.html";
    }



    @RequestMapping("/reader_room_seats.html")
    public ModelAndView RoomDetail(HttpServletRequest request) {
        long roomId = Long.parseLong(request.getParameter("room_id"));
        Room room = roomService.getRoom(roomId);
        ModelAndView modelAndView = new ModelAndView("reader_room_seats");
        modelAndView.addObject("detail", room);
        return modelAndView;
    }

    @RequestMapping("/deleteroom.html")
    public String deleteRoom(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        long roomId = Long.parseLong(request.getParameter("room_id"));
        if (roomService.deleteRoom(roomId)) {
            redirectAttributes.addFlashAttribute("succ", "阅览室删除成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "阅览室删除失败！");
        }
        return "redirect:/admin_room_list.html";
    }

}
