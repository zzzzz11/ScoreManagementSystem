package org.zrquan.sms.service.interfaces;

public interface CommonService {
	/**
	 * 所有学院信息
	 *
	 * @return Json
	 */
	String retrieveDept();

	/**
	 * 所有专业信息
	 *
	 * @return Json
	 */
	String retrieveMajor();
}
