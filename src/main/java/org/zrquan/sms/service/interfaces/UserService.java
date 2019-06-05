package org.zrquan.sms.service.interfaces;

import org.zrquan.sms.entity.User;

public interface UserService {

	boolean verify(String accountNumber, String password);

	User getUer(String accountNumber);
}
