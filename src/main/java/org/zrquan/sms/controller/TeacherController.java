package org.zrquan.sms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zrquan.sms.entity.Teacher;
import org.zrquan.sms.entity.User;
import org.zrquan.sms.service.TeacherServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;

@Controller
@RequestMapping("teacher")
public class TeacherController {
	@Autowired
	TeacherServiceImpl teacherService;

    @Autowired
    TeacherServiceImpl teacherService;
	/**
	 * 设置用户基本信息
	 */
	@ModelAttribute
	public void setUserInfo(Model model,
							HttpSession session) {

		User user = (User) session.getAttribute("user");

		model.addAttribute("name", user.getUserName());
		model.addAttribute("number", user.getAccountNumber());
	}

    /**
     * 教师教学课程查看
     * 添加成绩
     */
    @RequestMapping(value = {"course", "main"})
    public String getTeacherCourse(Model model,
                                  HttpSession session) {
        User user = (User) session.getAttribute("user");
        String number = user.getAccountNumber();
        String courseInfo = teacherService.getCourseInfo(number);

        model.addAttribute("course", courseInfo);

        return "teacher/teacherCourse";
    }
//    public String setTeacherScore(HttpServletRequest request,
//                                  @RequestParam("File") File score){
//
//        return "teacher/teacherCourse";
//    }

    /**
     * 成绩查看
     */
    @RequestMapping(value = {"score"})
    public String getTeacherScore(Model model) {

        return "teacher/teacherScore";
    }



	/**
	 * 教师个人信息（主页）
	 */
	@RequestMapping(value = {"profile", "main"})
	public String getTeacherProfile(Model model,
									HttpSession session) {
		User user = (User) session.getAttribute("user");
		String number = user.getAccountNumber();
		Teacher teacher = teacherService.getTeacherInfo(number);

		model.addAttribute("teach", teacher);

		return "teacher/teacherProfile";
	}

}
