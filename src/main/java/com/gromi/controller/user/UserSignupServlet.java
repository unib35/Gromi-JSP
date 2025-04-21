package com.gromi.controller.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.gromi.model.user.User;
import com.gromi.service.user.UserService;
import com.gromi.service.user.UserServiceImpl;

@WebServlet("/user/signup")
public class UserSignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;
    
    public UserSignupServlet() {
        this.userService = new UserServiceImpl();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/user/signup.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String id = request.getParameter("id");
            String pw = request.getParameter("pw");
            String name = request.getParameter("name");
            
            User user = new User(id, pw, name);
            
            userService.registerUser(user);
            
            // 로그인 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/user/signin");
        } catch (IllegalArgumentException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/user/signup.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "회원가입 처리 중 오류가 발생했습니다: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/user/signup.jsp").forward(request, response);
        }
    }
} 