package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.Teacher;

public interface TeacherDao {
    Teacher getTeacherByNumber(@Param("number") String number);

	Teacher getTeacherById(@Param("id") int id);

}
