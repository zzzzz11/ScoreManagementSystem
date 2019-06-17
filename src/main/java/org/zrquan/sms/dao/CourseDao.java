package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.Course;

import java.util.List;

public interface CourseDao {

	Course getCourseById(@Param("id") int id);

	List<Course> retrieveCourse();

	List<Course> getCourseByTeacherNumber(@Param("tNumber") String tnumber);

	int create(@Param("course") Course course);

	int deleteById(@Param("id") int id);

	List<Double> getValueList(@Param("courseId") int courseId);

	List<Course> searchByCondition(@Param("condition") String condition, @Param("keyword") String keyword);
}
