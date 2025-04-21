package com.gromi.service.user;

import com.gromi.dao.user.UserDAO;
import com.gromi.dao.user.UserDAOImpl;
import com.gromi.model.user.User;

public class UserServiceImpl implements UserService {
    private UserDAO userDAO;
    
    public UserServiceImpl() {
        this.userDAO = new UserDAOImpl();
    }
    
    @Override
    public void registerUser(User user) throws Exception {
        // 비즈니스 로직: 유효성 검사 등을 추가할 수 있음
        if (user.getId() == null || user.getId().trim().isEmpty()) {
            throw new IllegalArgumentException("아이디는 필수 입력값입니다.");
        }
        if (user.getPw() == null || user.getPw().trim().isEmpty()) {
            throw new IllegalArgumentException("비밀번호는 필수 입력값입니다.");
        }
        if (user.getName() == null || user.getName().trim().isEmpty()) {
            throw new IllegalArgumentException("이름은 필수 입력값입니다.");
        }
        
        User existingUser = userDAO.findById(user.getId());
        if (existingUser != null) {
            throw new IllegalArgumentException("이미 사용 중인 아이디입니다.");
        }
        
        userDAO.insert(user);
    }
    
    @Override
    public User loginUser(String id, String password) throws Exception {
        if (id == null || id.trim().isEmpty()) {
            throw new IllegalArgumentException("아이디는 필수 입력값입니다.");
        }
        if (password == null || password.trim().isEmpty()) {
            throw new IllegalArgumentException("비밀번호는 필수 입력값입니다.");
        }
        
        return userDAO.findByIdAndPassword(id, password);
    }
    
    @Override
    public User getUserById(String id) throws Exception {
        if (id == null || id.trim().isEmpty()) {
            throw new IllegalArgumentException("아이디는 필수 입력값입니다.");
        }
        
        return userDAO.findById(id);
    }
    
    @Override
    public void updateUser(String id, User user) throws Exception {
        if (id == null || id.trim().isEmpty()) {
            throw new IllegalArgumentException("아이디는 필수 입력값입니다.");
        }
        
        User existingUser = userDAO.findById(id);
        if (existingUser == null) {
            throw new IllegalArgumentException("존재하지 않는 사용자입니다.");
        }
        
        userDAO.update(id, user);
    }
    
    @Override
    public void deleteUser(String id) throws Exception {
        if (id == null || id.trim().isEmpty()) {
            throw new IllegalArgumentException("아이디는 필수 입력값입니다.");
        }
        
        userDAO.deleteById(id);
    }
} 