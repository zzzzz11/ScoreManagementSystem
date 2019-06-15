package org.zrquan.sms.service;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zrquan.sms.dao.CourseDao;
import org.zrquan.sms.dao.ScoreDao;
import org.zrquan.sms.dao.TeacherDao;
import org.zrquan.sms.entity.Course;
import org.zrquan.sms.entity.Score;
import org.zrquan.sms.entity.Teacher;
import org.zrquan.sms.service.interfaces.TeacherService;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    TeacherDao teacherDao;
    @Autowired
    ScoreDao scoreDao;
    @Autowired
    CourseDao courseDao;

    @Override
    public Teacher getTeacherInfo(String number) {
        Teacher teacher = teacherDao.getTeacherByNumber(number);

        return teacher;
    }

    @Override
    public String getCourseInfo(String number) {


        List<Course> course = courseDao.getCourseByTeacherNumber(number);

        String result = JSON.toJSONString(course);

        return result;
    }
}
