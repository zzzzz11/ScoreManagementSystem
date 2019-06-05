package org.zrquan.sms.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.zrquan.sms.BaseTest;
import org.zrquan.sms.entity.Score;

import java.util.List;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

public class ScoreDaoTest extends BaseTest {
	@Autowired
	ScoreDao scoreDao;

	@Test
	public void testGetScoreByStudentNumber() {
		List<Score> scores = scoreDao.getScoreByStudentNumber("16369003");
		assertNotNull(scores);
		assertFalse(scores.isEmpty());
	}
}