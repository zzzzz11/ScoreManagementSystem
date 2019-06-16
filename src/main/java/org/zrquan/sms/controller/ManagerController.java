package org.zrquan.sms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zrquan.sms.entity.*;
import org.zrquan.sms.service.CommonServiceImpl;
import org.zrquan.sms.service.ManagerServiceImpl;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("manager")
public class ManagerController {
	@Autowired
	CommonServiceImpl commonService;
	@Autowired
	ManagerServiceImpl managerService;

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
	 * 个人信息页面
	 */
	@RequestMapping(value = {"profile"})
	public String getManagerProfile(Model model,
									HttpSession session) {

		User user = (User) session.getAttribute("user");
		Manager manager = managerService.getPersonalInfo(user.getAccountNumber());

		model.addAttribute("managerInfo", manager);

		return "manager/managerProfile";
	}

	/**
	 * 成绩审核页面
	 */
	@RequestMapping(value = {"score"})
	public String auditScore(Model model) {

		return "manager/managerScore";
	}

	@RequestMapping(value = {"detail"})
	public String getManagerDetail(Model model) {

		return "manager/managerDetail";
	}

	/**
	 * 课程管理页
	 */
	@RequestMapping(value = {"course", "main"})
	public String manageCourseInfo(Model model,
								   @RequestParam(value = "message", required = false) String message) {
		String courseJson = managerService.getCourseInfo();
		model.addAttribute("courses", courseJson);

		return "manager/managerCourse";
	}

	/**
	 * 教师管理页
	 */
	@RequestMapping("teacher")
	public String manageTeacherInfo(Model model,
									@RequestParam(value = "message", required = false) String message) {
		String teacherJson = managerService.getTeacherInfo();
		model.addAttribute("teachers", teacherJson);

		return "manager/managerTeacher";
	}

	/**
	 * 学生管理页
	 */
	@RequestMapping("student")
	public String manageStudentInfo(Model model,
									@RequestParam(value = "message", required = false) String message) {
		String studentJson = managerService.getStudentInfo();
		model.addAttribute("students", studentJson);

		return "manager/managerStudent";
	}

	/**
	 * 查询功能
	 */
	@RequestMapping(value = "search/{key}/{value}")
	public String search(Model model,
						 @PathVariable String key,
						 @PathVariable String value,
						 @RequestParam String content) {

		if (key.equals("course")) {
			String result = managerService.searchCourse(value, content);
			return "manager/managerCourse";
		} else if (key.equals("user")) {
			String result = managerService.searchUser(value, content);
			return "manager/managerUser";
		} else
			return "manager/managerProfile";
	}

	/**
	 * 增加课程
	 */
	@RequestMapping("add/course")
	public String addCourse(Model model,
							@ModelAttribute Course course,
							@RequestParam String teacherName) {

		boolean success = managerService.addCourse(course, teacherName);
		if (success) {
			model.addAttribute("message", "添加成功！");
		} else {
			model.addAttribute("message", "添加失败，务必先完善教师信息。");
		}

		return "redirect:/manager/course";
	}

	/**
	 * 增加教师
	 */
	@RequestMapping("add/teacher")
	public String addTeacher(Model model,
							 @ModelAttribute Teacher teacher,
							 @RequestParam int deptId) {

		boolean success = managerService.addTeacher(teacher, deptId);
		if (success) {
			model.addAttribute("message", "添加成功！");
		} else {
			model.addAttribute("message", "添加失败，务必先完善教师信息。");
		}

		return "redirect:/manager/user";
	}

	/**
	 * 增加学生
	 */
	@RequestMapping("add/student")
	public String addStudent(Model model,
							 @ModelAttribute Student student,
							 @RequestParam int majorId) {

		boolean success = managerService.addStudent(student, majorId);
		if (success) {
			model.addAttribute("message", "添加成功！");
		} else {
			model.addAttribute("message", "添加失败，务必先完善教师信息。");
		}

		return "redirect:/manager/user";
	}

	@RequestMapping("add/manager")
	public String addManager(Model model,
							 @ModelAttribute Manager manager,
							 @RequestParam int deptId,
							 @RequestParam String email,
							 @RequestParam String phone) {

		boolean success = managerService.addManager(manager, deptId, email, phone);
		if (success) {
			model.addAttribute("message", "添加成功！");
		} else {
			model.addAttribute("message", "添加失败，务必先完善教师信息。");
		}

		return "redirect:/manager/user";
	}

	/**
	 * 用户管理页
	 */
	@RequestMapping("user")
	public String manageUserInfo(Model model) {
		String userJson = managerService.getUserInfo();
		String deptJson = commonService.retrieveDept();
		String majorJson = commonService.retrieveMajor();
		model.addAttribute("users", userJson);
		model.addAttribute("depts", deptJson);
		model.addAttribute("majors", majorJson);

		return "manager/managerUser";
	}
}
