package org.zrquan.sms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zrquan.sms.entity.User;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("manager")
public class ManagerController {


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
     * 个人信息页面（主页）
     */
    @RequestMapping(value={"profile"})
    public String getManagerProfile(Model model) {

        return "manager/managerProfile";
    }

	/**
	 * 待审核信息管理页面
	 */
	@RequestMapping(value = {"page","main"})
	public String getManagerPage(Model model) {

		return "manager/managerPage";
	}

    @RequestMapping(value = {"detail"})
    public String getManagerDetail(Model model) {

        return "manager/managerDetail";
    }

	/**
	 * 没什么用的页面
	 */
	@RequestMapping("temp")
	public String showTempPage(Model model) {

		return "manager/managerTemp";

	}
}
