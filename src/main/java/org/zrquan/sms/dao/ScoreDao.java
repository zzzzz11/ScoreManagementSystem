package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.Score;

import java.util.List;

public interface ScoreDao {
	List<Score> getScoreByStudentNumber(@Param("stuNumber") String stuNumber);

	List<Score> getScoreByTeacherNumber(@Param("teacherNumber") String teacherNumber);

	int getCourseStudentCount(@Param("courseId") int courseId);

	List<Score> retrieveScores();

	int addScore(@Param("score") Score score);

	List<Score> getCourseById(@Param("courseId") int courseId);
}
