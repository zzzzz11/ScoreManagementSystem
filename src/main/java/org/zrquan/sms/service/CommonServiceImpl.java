package org.zrquan.sms.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zrquan.sms.dao.DepartmentDao;
import org.zrquan.sms.dao.MajorDao;
import org.zrquan.sms.entity.Department;
import org.zrquan.sms.entity.Major;
import org.zrquan.sms.service.interfaces.CommonService;

import java.util.List;

@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	DepartmentDao departmentDao;
	@Autowired
	MajorDao majorDao;

	@Override
	public String retrieveDept() {
		List<Department> depts = departmentDao.retrieveDept();
		String result = JSON.toJSONString(depts, SerializerFeature.DisableCircularReferenceDetect);

		return result;
	}

	@Override
	public String retrieveMajor() {
		List<Major> majors = majorDao.retrieveMajor();
		String result = JSON.toJSONString(majors, SerializerFeature.DisableCircularReferenceDetect);

		return result;
	}
}
