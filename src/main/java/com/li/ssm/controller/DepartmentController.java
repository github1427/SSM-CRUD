package com.li.ssm.controller;

import com.li.ssm.bean.Department;
import com.li.ssm.bean.Msg;
import com.li.ssm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;
    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department> depts=departmentService.getDepts();
        return Msg.sucess().add("depts",depts);
    }
}
