package com.library.controller;

import com.library.bean.Room;
import com.library.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class RoomController {
    @Autowired
    private RoomService roomService;

    @RequestMapping("/roomlist.html")
    private ModelAndView roomList() {
        ModelAndView modelAndView = new ModelAndView("admin_room_list");
        modelAndView.addObject("rooms", roomService.roomList());
        return modelAndView;
    }

    @RequestMapping("/updateroom.html")
    public ModelAndView roomEdit(HttpServletRequest request) {
        long roomId = Long.parseLong(request.getParameter("roomId"));
        Room room = roomService.getRoom(roomId);
        ModelAndView modelAndView = new ModelAndView("admin_room_edit");
        modelAndView.addObject("detail", room);
        return modelAndView;
    }


}
