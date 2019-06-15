package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.Score;
import org.zrquan.sms.entity.User;

import java.util.List;

public interface ScoreDao {
    List<Score> getScoreByStudentNumber(@Param("stuNumber") String stuNumber);

    List<Score> getScoreByTeacherNumber(@Param("teacherNumber") String teacherNumber);

    void addUpdateScore(@Param("score") Score score);

    void deleteUpdateStudent(@Param("score") Score score);
}


