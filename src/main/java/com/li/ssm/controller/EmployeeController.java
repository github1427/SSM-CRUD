package com.li.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.li.ssm.bean.Employee;
import com.li.ssm.bean.Msg;
import com.li.ssm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

//    @RequestMapping("/allEmps")
    public String getAllEmps(@RequestParam(value = "pn", defaultValue ="1") Integer pn,
                             Model model) {
        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAllEmps();
        PageInfo pageInfo=new PageInfo(emps,5);
        model.addAttribute("pageInfo",pageInfo);
        return "empsList";
    }

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmps(@RequestParam(value = "pn", defaultValue ="1") Integer pn){
        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAllEmps();
        PageInfo pageInfo=new PageInfo(emps,5);
        return Msg.sucess().add("pageInfo",pageInfo);
    }

    //添加员工
    @RequestMapping(value = "/emps",method = RequestMethod.POST)
    @ResponseBody
    public Msg addEmp(@Valid Employee employee, BindingResult result){
        if (result.hasErrors()){
            Map<String,Object> error=new HashMap<>();
            List<FieldError> fieldErrors=result.getFieldErrors();
            for (FieldError fieldError:fieldErrors){
                error.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("error",error);
        }else {
            employeeService.addEmp(employee);
            return Msg.sucess();
        }
    }

    //根据姓名查询是否重复
    @RequestMapping(value = "/judgeEmpName",method = RequestMethod.POST)
    @ResponseBody
    public Msg judgeEmpName(String empName){
        List<Employee> list=employeeService.selectEmpByName(empName);
        if (list.size()==0){
            return Msg.sucess().add("emp",null);
        }else {
            return Msg.sucess().add("emp",list);
        }
    }

    //根据id查询员工
    @RequestMapping(value ="/emps/{id}" ,method=RequestMethod.GET)
    @ResponseBody
    public Msg getEmpById(@PathVariable("id")Integer id){
        Employee employee=employeeService.getEmpById(id);
        return Msg.sucess().add("emp",employee);
    }

    //根据id更新员工信息
    @RequestMapping(value = "/emps/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmpInfo(@Valid Employee employee,BindingResult result){
        if (result.hasErrors()){
            Map<String,Object> error=new HashMap<>();
            List<FieldError> fieldErrors=result.getFieldErrors();
            for (FieldError fieldError:fieldErrors){
                error.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("error",error);
        }else {
            employeeService.updateEmpInfo(employee);
            return Msg.sucess();
        }
    }

    //删除员工
    @RequestMapping(value = "/emps/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("ids")String ids){
        if (ids.contains("-")){
            List<Integer> list=new ArrayList<>();
            String[] strings=ids.split("-");
            for (String s:strings){
                list.add(Integer.parseInt(s));
            }
            employeeService.deleteEmpBatch(list);
        }else {
            employeeService.deleteEmpById(Integer.parseInt(ids));
        }
        return Msg.sucess();
    }
}
