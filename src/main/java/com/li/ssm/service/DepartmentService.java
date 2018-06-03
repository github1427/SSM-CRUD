package com.li.ssm.service;

import com.li.ssm.bean.Department;
import com.li.ssm.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;
    //查询所有部门信息
    public List<Department> getDepts(){
        return departmentMapper.selectByExample(null);
    }

}
