package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.Score;

public interface TempScoreDao {
	int addTempScore(@Param("score") Score score);

	int deleteTempScore(@Param("score") Score score);

	int getCourseStudentCount(@Param("courseId") int courseId);
}
