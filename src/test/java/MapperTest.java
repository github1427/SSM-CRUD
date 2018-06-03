import com.li.ssm.bean.Employee;
import com.li.ssm.dao.DepartmentMapper;
import com.li.ssm.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath:spring/applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    SqlSession sqlSession;
    @Autowired
    EmployeeMapper employeeMapper;

    @Test
    public void testCRUD(){
        //测试部门表的插入操作
//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));
        //向员工表插入数据
//        EmployeeMapper employeeMapper=sqlSession.getMapper(EmployeeMapper.class);
//        for (int i=1;i<=200;i++){
//            String uid= UUID.randomUUID().toString().substring(0,5);
//            employeeMapper.insertSelective(new Employee(null,"Coder"+uid,"M",uid+"@163.com",1));
//        }
        List<Employee> list=employeeMapper.selectByExampleWithDept(null);
        System.out.println("1111");
    }

}
