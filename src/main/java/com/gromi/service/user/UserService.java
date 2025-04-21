package com.gromi.service.user;

import com.gromi.model.user.User;

public interface UserService {
    void registerUser(User user) throws Exception;
    User loginUser(String id, String password) throws Exception;
    User getUserById(String id) throws Exception;
    void updateUser(String id, User user) throws Exception;
    void deleteUser(String id) throws Exception;
} 