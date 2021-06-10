package com.library.controller;


import com.library.bean.Record;
import com.library.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Controller
public class RecordController {
    @Autowired
    private RecordService recordService;

    @RequestMapping("/record_add.html")
    public ModelAndView addRecord() {
        return new ModelAndView("admin_record_add");
    }

    @RequestMapping("/record_add_do.html")
    public String addRecordDo(Record record, RedirectAttributes redirectAttributes) {

        if (recordService.addRecord(record)) {
            redirectAttributes.addFlashAttribute("succ", "记录添加成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "记录添加失败！");
        }
        return "redirect:/admin_record_list.html";
    }

    @RequestMapping("/updaterecord.html")
    public ModelAndView recordEdit(HttpServletRequest request) {
        long record_id = Long.parseLong(request.getParameter("record_id"));
        Record record= recordService.getRecord(record_id);
        ModelAndView modelAndView = new ModelAndView("admin_record_edit");
        modelAndView.addObject("detail", record);
        return modelAndView;
    }

    @RequestMapping("/record_edit_do.html")
    public String recordEditDo( Record record, RedirectAttributes redirectAttributes) {
        if (recordService.editRecord(record)) {
            redirectAttributes.addFlashAttribute("succ", "记录修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "记录修改失败！");
        }
        return "redirect:/admin_record_list.html";
    }

    @RequestMapping("/admin_record_detail.html")
    public ModelAndView adminRecordDetail(HttpServletRequest request) {
        long record_id = Long.parseLong(request.getParameter("record_id"));
        Record record= recordService.getRecord(record_id);
        ModelAndView modelAndView = new ModelAndView("admin_record_detail");
        modelAndView.addObject("detail", record);
        return modelAndView;
    }

    @RequestMapping("/reader_record_detail.html")
    public ModelAndView readerRecordDetail(HttpServletRequest request) {
        long record_id = Long.parseLong(request.getParameter("record_id"));
        Record record= recordService.getRecord(record_id);
        ModelAndView modelAndView = new ModelAndView("reader_record_detail");
        modelAndView.addObject("detail", record);
        return modelAndView;
    }



    @RequestMapping("/admin_record_list.html")
    public ModelAndView adminRecordList() {
        ArrayList<Record> records = recordService.getAllRecords();
        ModelAndView modelAndView = new ModelAndView("admin_room_list");
        modelAndView.addObject("records", records);
        return modelAndView;
    }

/*
    @RequestMapping("/reader_record_list.html")
    public ModelAndView readerRecordList(HttpServletRequest request) {
        ArrayList<Record> records = recordService.getAllRecords();
        ReaderCard readerCard = (ReaderCard) request.getSession().getAttribute("readercard");
        ArrayList<Record> myAllRecordList = recordService.myRecordList(readerCard.getReaderId());
        ArrayList<Record> myLendList = new ArrayList<>();
        for (Lend lend : myAllLendList) {
            // 是否已归还
            if (lend.getBackDate() == null) {
                myLendList.add(lend.getBookId());
            }
        }
        ModelAndView modelAndView = new ModelAndView("reader_books");
        modelAndView.addObject("books", books);
        modelAndView.addObject("myLendList", myLendList);
        return modelAndView;
    }
*/

}
