package com.gromi.dao.user;

import com.gromi.dao.common.GenericDAO;
import com.gromi.model.user.User;

public interface UserDAO extends GenericDAO<User, String> {
    // 추가 사용자 특화 메서드
    User findByIdAndPassword(String id, String password) throws Exception;
} 