package org.zrquan.sms.dao;

import org.apache.ibatis.annotations.Param;
import org.zrquan.sms.entity.Feedback;

import java.util.List;

public interface FeedbackDao {
	int sendFeedback(@Param("account") String account, @Param("content") String content);

	List<Feedback> retrieve();

	int delete(@Param("id") int id);
}
