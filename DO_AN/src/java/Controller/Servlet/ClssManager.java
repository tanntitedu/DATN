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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.ClssDAO;
import model.DAO.RoleDAO;
import model.entity.Clss;
import model.entity.Role;
import model.entity.User;

/**
 *
 * @author trongtanpanda
 */
public class ClssManager extends HttpServlet {
    
    ClssDAO CLD = ClssDAO.getInstance();
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
//            out.println("<title>Servlet RoleManager</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet RoleManager at " + request.getContextPath() + "</h1>");
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
                case "manage-clss":
                    List<Clss> clList = CLD.listClss();
                    request.setAttribute(util.Constants.CL_LIST, clList);
                    request.setAttribute(util.Constants.PAGE, "manage-clss");
                    request.removeAttribute(util.Constants.MSG_RESULT);
                    request.getRequestDispatcher(util.Constants.URL_ADMIN).forward(request, response);
                    
                    break;
                case "manage":
                    request.setAttribute(util.Constants.PAGE, "manage");
                    request.removeAttribute(util.Constants.MSG_RESULT);
                    request.getRequestDispatcher(util.Constants.URL_ADMIN).forward(request, response);
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
                editClss(request, response);
                break;
            case "Thêm mới":
                addClss(request, response);
                break;
////            case "Tìm kiếm":
////                search(request, response);
////                break;
        }
    }

    private void doEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int clssID = Integer.parseInt(request.getParameter("id"));
        Clss clss = CLD.get(clssID);        
        request.setAttribute(util.Constants.CL, clss);
        request.setAttribute(util.Constants.PAGE, "addclss");
        request.getRequestDispatcher(util.Constants.URL_ADMIN).forward(request, response);
    }

//    private void search(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String userName = request.getParameter("userName");
//        List<User> usList = USR.getUserByName(userName);
//        request.setAttribute(util.Constants.USR_LIST, usList);
//        request.setAttribute(util.Constants.PAGE, "manage-user");
//        request.removeAttribute(util.Constants.MSG_RESULT);
//        request.getRequestDispatcher(util.Constants.URL_ADMIN).forward(request, response);
//    }
    private void editClss(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int clssID = Integer.parseInt(request.getParameter("id"));
        String clssname = request.getParameter("clssname");
        int yearStart = Integer.parseInt(request.getParameter("yearStart"));
        int yearfinish = Integer.parseInt(request.getParameter("yearfinish"));
        String notes = request.getParameter("notes");       

        if (CLD.update(clssID, clssname, yearStart, yearfinish, notes)) {
            List<Clss> clList = CLD.listClss();
            request.setAttribute(util.Constants.CL_LIST, clList);
            request.setAttribute("msgSuccess", "Bạn đã sửa thông tin lớp thành công");
            request.setAttribute(util.Constants.PAGE, "manage-clss");
            request.getRequestDispatcher(util.Constants.URL_ADMIN).forward(request, response);
        } else {
            request.setAttribute("msgResult", "Sửa thông tin lớp thất bại");
            request.setAttribute(util.Constants.PAGE, "addclss");
            request.getRequestDispatcher(util.Constants.URL_ADMIN).forward(request, response);
        }
    }

    private void doAddnew(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        request.setAttribute(util.Constants.PAGE, "addclss");        
        request.getRequestDispatcher(util.Constants.URL_ADMIN).forward(request, response);
    }

    private void addClss(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String clssname = request.getParameter("clssname");
        int yearStart = Integer.parseInt(request.getParameter("yearStart"));
        int yearfinish = Integer.parseInt(request.getParameter("yearfinish"));
        String notes = request.getParameter("notes");   
        
        Clss cl = new Clss(clssname, yearStart, yearfinish, notes, Boolean.TRUE, null);
//        if (!TK_SERVICE.checkUser(tenTK)) {
        if (CLD.insertClss(cl)) {
            List<Clss> clList = CLD.listClss();
            request.setAttribute(util.Constants.CL_LIST, clList);
            request.setAttribute(util.Constants.PAGE, "manage-clss");
            request.setAttribute("msgSuccess", "Bạn đã thêm lớp mới thành công");
            request.getRequestDispatcher(util.Constants.URL_ADMIN).forward(request, response);
        } else {
            request.setAttribute("msgResult", "Có lỗi xảy ra, thêm mới lớp thất bại!");
            request.setAttribute(util.Constants.PAGE, "addclss");
            request.getRequestDispatcher(util.Constants.URL_ADMIN).forward(request, response);
        }
//        } else {
//            request.setAttribute("msgResult", "Tên đăng nhập đã tồn tại!");
//            request.setAttribute(util.Constants.PAGE, "adduser");
//            request.getRequestDispatcher(util.Constants.URL_ADMIN).forward(request, response);
//        }
    }

    private void doDel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int clssID = Integer.parseInt(request.getParameter("id"));
        if (CLD.delete(clssID)) {
            request.setAttribute("msgSuccess", "Bạn đã xóa lớp thành công");
            List<Clss> clList = CLD.listClss();
            request.setAttribute(util.Constants.CL_LIST, clList);
            request.setAttribute(util.Constants.PAGE, "manage-clss");
            request.getRequestDispatcher(util.Constants.URL_ADMIN).forward(request, response);
        } else {
            request.setAttribute(util.Constants.PAGE, "manage-clss");
            request.getRequestDispatcher(util.Constants.URL_ADMIN).forward(request, response);
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
