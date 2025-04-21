package com.gromi.controller.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.gromi.model.user.User;
import com.gromi.service.user.UserService;
import com.gromi.service.user.UserServiceImpl;

@WebServlet("/user/signin")
public class UserSigninServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;
    
    public UserSigninServlet() {
        this.userService = new UserServiceImpl();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/user/signin.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        
        try {
            User user = userService.loginUser(id, pw);
            
            if (user != null) {
                // 로그인 성공: 세션에 사용자 정보 저장
                HttpSession session = request.getSession();
                session.setAttribute("user_id", user.getId());
                session.setAttribute("user_name", user.getName());
                
                // 메인 페이지로 리다이렉트
                response.sendRedirect(request.getContextPath() + "/");
            } else {
                // 로그인 실패: 오류 메시지와 함께 로그인 페이지로 돌아감
                request.setAttribute("errorMessage", "아이디 또는 비밀번호가 일치하지 않습니다.");
                request.getRequestDispatcher("/WEB-INF/views/user/signin.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "로그인 처리 중 오류가 발생했습니다: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/user/signin.jsp").forward(request, response);
        }
    }
} 