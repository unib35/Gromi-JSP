package com.gromi.controller.board;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.gromi.dao.board.BoardDAO;
import com.gromi.dao.board.CommentDAO;
import com.gromi.dto.board.BoardDTO;
import com.gromi.dto.board.CommentDTO;

@WebServlet("/board/*")
public class BoardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private BoardDAO boardDAO;
    private CommentDAO commentDAO;
    
    public BoardServlet() {
        super();
        boardDAO = new BoardDAO();
        commentDAO = new CommentDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        try {
            if (pathInfo == null || pathInfo.equals("/")) {
                // 메인 게시판 페이지로 리다이렉트
                response.sendRedirect(request.getContextPath() + "/board/free/list");
                return;
            }
            
            String[] pathParts = pathInfo.split("/");
            if (pathParts.length < 3) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            
            String boardType = pathParts[1]; // free, qa, sale 중 하나
            String action = pathParts[2]; // list, view, write, edit, delete 등
            
            switch (boardType) {
                case "free":
                    handleFreeBoard(action, request, response);
                    break;
                case "qa":
                    handleQABoard(action, request, response);
                    break;
                case "comment":
                    handleComment(action, request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
            
        } catch (Exception e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/error/error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        doGet(request, response);
    }
    
    // 자유 게시판 처리
    private void handleFreeBoard(String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
        switch (action) {
            case "list":
                // 자유 게시판 목록
                List<BoardDTO> freeboardList = boardDAO.getFreeboardList();
                request.setAttribute("boardList", freeboardList);
                request.getRequestDispatcher("/WEB-INF/views/board/free_list.jsp").forward(request, response);
                break;
            
            case "view":
                // 자유 게시판 게시글 조회
                int postId = Integer.parseInt(request.getParameter("id"));
                BoardDTO freePost = boardDAO.getFreeboardPost(postId);
                
                if (freePost != null) {
                    List<CommentDTO> comments = commentDAO.getCommentsByPost("free", postId);
                    request.setAttribute("post", freePost);
                    request.setAttribute("comments", comments);
                    request.getRequestDispatcher("/WEB-INF/views/board/free_view.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
                break;
                
            case "write":
                // 글 작성 폼 표시 또는 글 등록 처리
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    // 글 등록 처리
                    HttpSession session = request.getSession();
                    String userId = (String) session.getAttribute("userId");
                    
                    if (userId == null) {
                        response.sendRedirect(request.getContextPath() + "/user/login");
                        return;
                    }
                    
                    BoardDTO newPost = new BoardDTO();
                    newPost.setTitle(request.getParameter("title"));
                    newPost.setContent(request.getParameter("content"));
                    newPost.setUserId(userId);
                    
                    boardDAO.insertFreeboardPost(newPost);
                    response.sendRedirect(request.getContextPath() + "/board/free/list");
                } else {
                    // 글 작성 폼 표시
                    request.getRequestDispatcher("/WEB-INF/views/board/free_write.jsp").forward(request, response);
                }
                break;
                
            case "edit":
                // 글 수정 폼 표시 또는 수정 처리
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    // 글 수정 처리
                    HttpSession session = request.getSession();
                    String userId = (String) session.getAttribute("userId");
                    
                    int editPostId = Integer.parseInt(request.getParameter("id"));
                    BoardDTO existingPost = boardDAO.getFreeboardPost(editPostId);
                    
                    if (existingPost == null) {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND);
                        return;
                    }
                    
                    if (!existingPost.getUserId().equals(userId)) {
                        response.sendError(HttpServletResponse.SC_FORBIDDEN);
                        return;
                    }
                    
                    existingPost.setTitle(request.getParameter("title"));
                    existingPost.setContent(request.getParameter("content"));
                    
                    boardDAO.updateFreeboardPost(existingPost);
                    response.sendRedirect(request.getContextPath() + "/board/free/view?id=" + editPostId);
                } else {
                    // 글 수정 폼 표시
                    int editPostId = Integer.parseInt(request.getParameter("id"));
                    BoardDTO post = boardDAO.getFreeboardPost(editPostId);
                    
                    if (post != null) {
                        HttpSession session = request.getSession();
                        String userId = (String) session.getAttribute("userId");
                        
                        if (!post.getUserId().equals(userId)) {
                            response.sendError(HttpServletResponse.SC_FORBIDDEN);
                            return;
                        }
                        
                        request.setAttribute("post", post);
                        request.getRequestDispatcher("/WEB-INF/views/board/free_edit.jsp").forward(request, response);
                    } else {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    }
                }
                break;
                
            case "delete":
                // 글 삭제 처리
                int deletePostId = Integer.parseInt(request.getParameter("id"));
                BoardDTO postToDelete = boardDAO.getFreeboardPost(deletePostId);
                
                if (postToDelete != null) {
                    HttpSession session = request.getSession();
                    String userId = (String) session.getAttribute("userId");
                    
                    if (!postToDelete.getUserId().equals(userId)) {
                        response.sendError(HttpServletResponse.SC_FORBIDDEN);
                        return;
                    }
                    
                    boardDAO.deleteFreeboardPost(deletePostId);
                    response.sendRedirect(request.getContextPath() + "/board/free/list");
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
                break;
                
            case "search":
                // 검색 처리
                String keyword = request.getParameter("keyword");
                
                if (keyword != null && !keyword.trim().isEmpty()) {
                    List<BoardDTO> searchResults = boardDAO.searchBoard("board_free", keyword);
                    request.setAttribute("boardList", searchResults);
                    request.setAttribute("keyword", keyword);
                } else {
                    request.setAttribute("boardList", boardDAO.getFreeboardList());
                }
                
                request.getRequestDispatcher("/WEB-INF/views/board/free_list.jsp").forward(request, response);
                break;
                
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    // Q&A 게시판 처리
    private void handleQABoard(String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
        switch (action) {
            case "list":
                // Q&A 게시판 목록
                List<BoardDTO> qaboardList = boardDAO.getQAboardList();
                request.setAttribute("boardList", qaboardList);
                request.getRequestDispatcher("/WEB-INF/views/board/qa_list.jsp").forward(request, response);
                break;
            
            case "view":
                // Q&A 게시판 게시글 조회
                int postId = Integer.parseInt(request.getParameter("id"));
                BoardDTO qaPost = boardDAO.getQAboardPost(postId);
                
                if (qaPost != null) {
                    List<CommentDTO> comments = commentDAO.getCommentsByPost("qa", postId);
                    request.setAttribute("post", qaPost);
                    request.setAttribute("comments", comments);
                    request.getRequestDispatcher("/WEB-INF/views/board/qa_view.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
                break;
                
            case "write":
                // 글 작성 폼 표시 또는 글 등록 처리
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    // 글 등록 처리
                    HttpSession session = request.getSession();
                    String userId = (String) session.getAttribute("userId");
                    
                    if (userId == null) {
                        response.sendRedirect(request.getContextPath() + "/user/login");
                        return;
                    }
                    
                    BoardDTO newPost = new BoardDTO();
                    newPost.setTitle(request.getParameter("title"));
                    newPost.setContent(request.getParameter("content"));
                    newPost.setUserId(userId);
                    
                    boardDAO.insertQAboardPost(newPost);
                    response.sendRedirect(request.getContextPath() + "/board/qa/list");
                } else {
                    // 글 작성 폼 표시
                    request.getRequestDispatcher("/WEB-INF/views/board/qa_write.jsp").forward(request, response);
                }
                break;
                
            case "edit":
                // 글 수정 폼 표시 또는 수정 처리
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    // 글 수정 처리
                    HttpSession session = request.getSession();
                    String userId = (String) session.getAttribute("userId");
                    
                    int editPostId = Integer.parseInt(request.getParameter("id"));
                    BoardDTO existingPost = boardDAO.getQAboardPost(editPostId);
                    
                    if (existingPost == null) {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND);
                        return;
                    }
                    
                    if (!existingPost.getUserId().equals(userId)) {
                        response.sendError(HttpServletResponse.SC_FORBIDDEN);
                        return;
                    }
                    
                    existingPost.setTitle(request.getParameter("title"));
                    existingPost.setContent(request.getParameter("content"));
                    
                    boardDAO.updateQAboardPost(existingPost);
                    response.sendRedirect(request.getContextPath() + "/board/qa/view?id=" + editPostId);
                } else {
                    // 글 수정 폼 표시
                    int editPostId = Integer.parseInt(request.getParameter("id"));
                    BoardDTO post = boardDAO.getQAboardPost(editPostId);
                    
                    if (post != null) {
                        HttpSession session = request.getSession();
                        String userId = (String) session.getAttribute("userId");
                        
                        if (!post.getUserId().equals(userId)) {
                            response.sendError(HttpServletResponse.SC_FORBIDDEN);
                            return;
                        }
                        
                        request.setAttribute("post", post);
                        request.getRequestDispatcher("/WEB-INF/views/board/qa_edit.jsp").forward(request, response);
                    } else {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    }
                }
                break;
                
            case "delete":
                // 글 삭제 처리
                int deletePostId = Integer.parseInt(request.getParameter("id"));
                BoardDTO postToDelete = boardDAO.getQAboardPost(deletePostId);
                
                if (postToDelete != null) {
                    HttpSession session = request.getSession();
                    String userId = (String) session.getAttribute("userId");
                    
                    if (!postToDelete.getUserId().equals(userId)) {
                        response.sendError(HttpServletResponse.SC_FORBIDDEN);
                        return;
                    }
                    
                    boardDAO.deleteQAboardPost(deletePostId);
                    response.sendRedirect(request.getContextPath() + "/board/qa/list");
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
                break;
                
            case "search":
                // 검색 처리
                String keyword = request.getParameter("keyword");
                
                if (keyword != null && !keyword.trim().isEmpty()) {
                    List<BoardDTO> searchResults = boardDAO.searchBoard("board_qa", keyword);
                    request.setAttribute("boardList", searchResults);
                    request.setAttribute("keyword", keyword);
                } else {
                    request.setAttribute("boardList", boardDAO.getQAboardList());
                }
                
                request.getRequestDispatcher("/WEB-INF/views/board/qa_list.jsp").forward(request, response);
                break;
                
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    // 댓글 처리
    private void handleComment(String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/user/login");
            return;
        }
        
        switch (action) {
            case "add":
                // 댓글 추가
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String boardType = request.getParameter("boardType");
                    int postId = Integer.parseInt(request.getParameter("postId"));
                    String content = request.getParameter("content");
                    
                    CommentDTO comment = new CommentDTO();
                    comment.setBoardType(boardType);
                    comment.setPostId(postId);
                    comment.setUserId(userId);
                    comment.setContent(content);
                    
                    commentDAO.insert(comment);
                    
                    // 댓글 작성 후 원래 게시글로 리다이렉트
                    response.sendRedirect(request.getContextPath() + "/board/" + boardType + "/view?id=" + postId);
                } else {
                    response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
                }
                break;
                
            case "edit":
                // 댓글 수정
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    int commentId = Integer.parseInt(request.getParameter("commentId"));
                    String content = request.getParameter("content");
                    
                    CommentDTO existingComment = commentDAO.findById(commentId);
                    
                    if (existingComment == null) {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND);
                        return;
                    }
                    
                    if (!existingComment.getUserId().equals(userId)) {
                        response.sendError(HttpServletResponse.SC_FORBIDDEN);
                        return;
                    }
                    
                    existingComment.setContent(content);
                    commentDAO.update(commentId, existingComment);
                    
                    // 댓글 수정 후 원래 게시글로 리다이렉트
                    response.sendRedirect(request.getContextPath() + "/board/" + existingComment.getBoardType() + "/view?id=" + existingComment.getPostId());
                } else {
                    response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
                }
                break;
                
            case "delete":
                // 댓글 삭제
                int commentId = Integer.parseInt(request.getParameter("id"));
                CommentDTO commentToDelete = commentDAO.findById(commentId);
                
                if (commentToDelete == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }
                
                if (!commentToDelete.getUserId().equals(userId)) {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN);
                    return;
                }
                
                String boardType = commentToDelete.getBoardType();
                int postId = commentToDelete.getPostId();
                
                commentDAO.deleteById(commentId);
                
                // 댓글 삭제 후 원래 게시글로 리다이렉트
                response.sendRedirect(request.getContextPath() + "/board/" + boardType + "/view?id=" + postId);
                break;
                
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
} 