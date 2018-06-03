package com.li.ssm.service;

import com.li.ssm.bean.Employee;
import com.li.ssm.bean.EmployeeExample;
import com.li.ssm.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;
    //查询员工信息
    public List<Employee> getAllEmps(){
        List<Employee> list=employeeMapper.selectByExampleWithDept(null);
        return list;
    }

    //添加员工
    public void addEmp(Employee employee){
        employeeMapper.insertSelective(employee);
    }

    //根据姓名查询员工
    public List<Employee> selectEmpByName(String empName){
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria=example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        List<Employee> list =employeeMapper.selectByExample(example);
        return list;
    }

    //根据id查询员工信息
    public Employee getEmpById(Integer id){
        Employee employee=employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    //更新员工信息
    public void updateEmpInfo(Employee employee){
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    //通过员工ID删除员工
    public void deleteEmpById(Integer id){
        employeeMapper.deleteByPrimaryKey(id);
    }

    //批量删除员工
    public void deleteEmpBatch(List<Integer> list){
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria=example.createCriteria();
        criteria.andEmpIdIn(list);
        employeeMapper.deleteByExample(example);
    }
}
