/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.ClssDAO;
import model.DAO.RoleDAO;
import model.DAO.UserDAO;
import model.entity.Clss;
import model.entity.Role;
import model.entity.User;


/**
 *
 * @author trongtanpanda
 */
@WebServlet(name = "StudentManager", urlPatterns = {"/StudentManager"})
public class StudentManager extends HttpServlet {
    UserDAO USR = UserDAO.getInstance();
    ClssDAO CLD = ClssDAO.getInstance();
    RoleDAO RLD = RoleDAO.getInstance();
    Role ROLE= RLD.get(3);

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet StudentManager</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet StudentManager at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("do");
        if (action != null) {
            switch (action) {
                case "edit":
                    doEdit(request, response);
                    break;
                case "add":
                    doAddnew(request, response);
                    break;
                case "del":
                    doDel(request, response);
                    break;
            }
        }
        String p = request.getParameter("p");
        if (p != null) {
            switch (p) {
                case "manage-user":
                    List<User> usList = USR.listUserByRole(ROLE);
                    request.setAttribute(util.Constants.US_LIST, usList);
                    request.setAttribute(util.Constants.PAGE, "manage-user");
                    request.removeAttribute(util.Constants.MSG_RESULT);
                    request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
                    
                    break;
                case "manage":
                    request.setAttribute(util.Constants.PAGE, "manage");
                    request.removeAttribute(util.Constants.MSG_RESULT);
                    request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
                    break;
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String submit = request.getParameter("submit");
        switch (submit) {
            case "Sửa":
                editUser(request, response);
                break;
            case "Thêm mới":
                addUser(request, response);
                break;
//            case "Tìm kiếm":
//                search(request, response);
//                break;
        }
    }

    private void doEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("id"));
        User user = USR.getUserByID(userID);
        List<Role> rlList = RLD.listRole();
        request.setAttribute(util.Constants.RL_LIST, rlList);
        List<Clss> clList = CLD.listClss();
        request.setAttribute(util.Constants.CL_LIST, clList);
        request.setAttribute(util.Constants.US, user);
        request.setAttribute(util.Constants.PAGE, "adduser");
        request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
    }

//    private void search(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String userName = request.getParameter("userName");
//        List<User> usList = USR.getUserByName(userName);
//        request.setAttribute(util.Constants.USR_LIST, usList);
//        request.setAttribute(util.Constants.PAGE, "manage-user");
//        request.removeAttribute(util.Constants.MSG_RESULT);
//        request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
//    }
    private void editUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("id"));
//        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        int clssId= Integer.parseInt(request.getParameter("clss"));
        
        boolean active = true;
        Date birthday = java.sql.Date.valueOf(request.getParameter("date"));
        ClssDAO cl = new ClssDAO();
        Clss s = cl.get(clssId);
        if (USR.update(userID, pass, firstname, lastname, birthday, s, ROLE, active)) {
            List<User> usList = USR.listUserByRole(ROLE);
            request.setAttribute(util.Constants.US_LIST, usList);
            request.setAttribute("msgResult", "Bạn đã sửa thông tin tài khoản thành công");
            request.setAttribute(util.Constants.PAGE, "manage-user");
            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
        } else {
            request.setAttribute("msgResult", "Sửa thông tin tài khoản thất bại");
            request.setAttribute(util.Constants.PAGE, "adduser");
            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
        }
    }

    private void doAddnew(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Role> rlList = RLD.listRole();
        request.setAttribute(util.Constants.RL_LIST, rlList);
        List<Clss> clList = CLD.listClss();
        request.setAttribute(util.Constants.CL_LIST, clList);
        request.setAttribute(util.Constants.PAGE, "adduser");
        
        request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        int clssId= Integer.parseInt(request.getParameter("clss"));        
        boolean active = true;        
        Date birthday = java.sql.Date.valueOf(request.getParameter("date"));
        ClssDAO cl = new ClssDAO();
        Clss s = cl.get(clssId);       
        
        User user = new User(s, ROLE, username, pass, firstname, lastname, birthday, active, null);
//        if (!TK_SERVICE.checkUser(tenTK)) {
        if (USR.insertUser(user)) {
            List<User> usList = USR.listUserByRole(ROLE);
            request.setAttribute(util.Constants.US_LIST, usList);
            request.setAttribute(util.Constants.PAGE, "manage-user");
            request.setAttribute("msgResult", "Bạn đã thêm tài khoản thành công");
            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
        } else {
            request.setAttribute("msgResult", "Có lỗi xảy ra, thêm tài khoản thất bại!");
            request.setAttribute(util.Constants.PAGE, "adduser");
            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
        }
//        } else {
//            request.setAttribute("msgResult", "Tên đăng nhập đã tồn tại!");
//            request.setAttribute(util.Constants.PAGE, "adduser");
//            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
//        }
    }

    private void doDel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("id"));
        if (USR.delete(userID)) {
            request.setAttribute("msgResult", "Bạn đã xóa tài khoản thành công");
            List<User> usList = USR.listUserByRole(ROLE);
            request.setAttribute(util.Constants.US_LIST, usList);
            request.setAttribute(util.Constants.PAGE, "manage-user");
            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
        } else {
            request.setAttribute(util.Constants.PAGE, "manage-user");
            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
