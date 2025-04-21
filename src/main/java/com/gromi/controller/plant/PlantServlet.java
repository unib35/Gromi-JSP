package com.gromi.controller.plant;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.gromi.dao.plant.PlantDAO;
import com.gromi.dao.plant.PlantCareDAO;
import com.gromi.dto.plant.PlantDTO;
import com.gromi.dto.plant.PlantCareDTO;

@WebServlet("/plant/*")
public class PlantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private PlantDAO plantDAO;
    private PlantCareDAO plantCareDAO;
    
    public PlantServlet() {
        super();
        plantDAO = new PlantDAO();
        plantCareDAO = new PlantCareDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        try {
            if (pathInfo == null || pathInfo.equals("/") || pathInfo.equals("/list")) {
                // 식물 목록 조회
                listPlants(request, response);
            } else if (pathInfo.equals("/detail")) {
                // 식물 상세 정보 조회
                getPlantDetail(request, response);
            } else if (pathInfo.equals("/search")) {
                // 식물 검색
                searchPlants(request, response);
            } else if (pathInfo.equals("/recommend")) {
                // 식물 추천
                recommendPlants(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/error/error.jsp").forward(request, response);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    
    // 식물 목록 조회
    private void listPlants(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<PlantDTO> plants = plantDAO.findAll();
        request.setAttribute("plants", plants);
        request.getRequestDispatcher("/WEB-INF/views/plant/list.jsp").forward(request, response);
    }
    
    // 식물 상세 정보 조회
    private void getPlantDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int plantId = Integer.parseInt(request.getParameter("id"));
        PlantDTO plant = plantDAO.findById(plantId);
        
        if (plant != null) {
            List<PlantCareDTO> careTips = plantCareDAO.findByPlantId(plantId);
            request.setAttribute("plant", plant);
            request.setAttribute("careTips", careTips);
            request.getRequestDispatcher("/WEB-INF/views/plant/detail.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    // 식물 검색
    private void searchPlants(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String keyword = request.getParameter("keyword");
        
        if (keyword != null && !keyword.trim().isEmpty()) {
            List<PlantDTO> searchResults = plantDAO.searchPlants(keyword);
            request.setAttribute("plants", searchResults);
            request.setAttribute("keyword", keyword);
        } else {
            request.setAttribute("plants", plantDAO.findAll());
        }
        
        request.getRequestDispatcher("/WEB-INF/views/plant/search.jsp").forward(request, response);
    }
    
    // 식물 추천
    private void recommendPlants(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String difficultyParam = request.getParameter("difficulty");
        int difficulty = 3; // 기본값은 중간 난이도
        
        if (difficultyParam != null && !difficultyParam.isEmpty()) {
            try {
                difficulty = Integer.parseInt(difficultyParam);
                // 난이도 범위 체크 (1-5)
                if (difficulty < 1) difficulty = 1;
                if (difficulty > 5) difficulty = 5;
            } catch (NumberFormatException e) {
                // 숫자 변환 실패 시 기본값 사용
            }
        }
        
        List<PlantDTO> recommendedPlants = plantDAO.getPlantsByDifficulty(difficulty);
        request.setAttribute("plants", recommendedPlants);
        request.setAttribute("selectedDifficulty", difficulty);
        request.getRequestDispatcher("/WEB-INF/views/plant/recommend.jsp").forward(request, response);
    }
} 