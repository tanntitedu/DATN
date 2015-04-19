/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.DiscipDAO;
import model.DAO.ExamsDAO;
import model.DAO.ExamsDetailsDAO;
import model.DAO.QuestionsDAO;
import model.DAO.QuizDAO;
import model.DAO.UserDAO;
import model.entity.Disciplines;
import model.entity.Exams;
import model.entity.ExamsDetails;
import model.entity.ExamsDetailsId;
import model.entity.Questions;
import model.entity.Quiz;

/**
 *
 * @author trongtanpanda
 */
public class QuizManager extends HttpServlet {

    QuizDAO QD = QuizDAO.getInstance();
    DiscipDAO DD = DiscipDAO.getInstance();
    QuestionsDAO QTD = QuestionsDAO.getInstance();
    ExamsDetailsDAO EDD = ExamsDetailsDAO.getInstance();
    ExamsDAO ED = ExamsDAO.getInstance();

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
        response.setContentType("text/html;charset=UTF-8");

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
                case "view":
                    doview(request, response);
                    break;
                case "addqus":
                    doAddqus(request, response);
                    break;
                case "editqus":
                    doEditqus(request, response);
                    break;
                case "exam":
                    doexams(request, response);
                    break;
                case "infor":
                    doinfor(request, response);
                    break;
            }
        }
        String p = request.getParameter("p");
        if (p != null) {
            switch (p) {
                case "manage-quiz":
                    List<Quiz> qList = QD.listQuiz();
                    request.setAttribute(util.Constants.Q_LIST, qList);
                    request.setAttribute(util.Constants.PAGE, "manage-quiz");
                    request.removeAttribute(util.Constants.MSG_RESULT);
                    request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);

                    break;

                case "manage":
                    request.setAttribute(util.Constants.PAGE, "manage");
                    request.removeAttribute(util.Constants.MSG_RESULT);
                    request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
                    break;
                case "dt":
                    request.setAttribute(util.Constants.PAGE, "dt");
                    request.removeAttribute(util.Constants.MSG_RESULT);
                    request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
                    break;
                case "list-quiz":
                    List<Quiz> qiList = QD.listQuiz();
                    request.setAttribute(util.Constants.Q_LIST, qiList);
                    request.setAttribute(util.Constants.PAGE, "list-quiz");
                    request.removeAttribute(util.Constants.MSG_RESULT);
                    request.getRequestDispatcher(util.Constants.URL_INDEX).forward(request, response);

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
                editQuiz(request, response);
                break;
            case "Thêm mới":
                addQuiz(request, response);
                break;
            case "Thêm Câu Hỏi":
                addQus(request, response);
                break;
            case "Sửa Câu Hỏi":
                editQus(request, response);
                break;
            case "Nộp bài":
                theexams(request, response);
                break;
//            case "Tìm kiếm":
//                search(request, response);
//                break;
        }
    }

    private void theexams(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int point = 0;
        int quizID = Integer.parseInt(request.getParameter("qid"));
        Quiz quiz = QD.getQuizByID(quizID);
        int t = quiz.getTotalques();
        float tl;
        int dtl;
        int ctl = 0;
        for (int i = 1; i < 4; i++) {
            String a = Integer.toString(i);
            // para stt.index
            String pp = request.getParameter(a);
            //
            String v = a.concat(".id");
            int qusID = Integer.parseInt(request.getParameter(v));
            System.out.println(pp + " " + v + " " + qusID);
            if(pp==null){
                pp="";
            }
            Exams ex = ED.get(1);
            Questions qs = QTD.get(qusID);
            ExamsDetailsId edi = new ExamsDetailsId(quizID, qusID);
            ExamsDetails ed = new ExamsDetails(edi, ex, qs, pp);
            String s = qs.getAnswer();
            System.out.println(pp);
            if (pp.equals(s)) {
                point++;
            }
            if (pp == "") {
                ctl++;
            }
            
            if (EDD.insertExamsDT(ed)) {
                System.out.println("thanh cong");
            } else {
                System.out.println("that bai");
            }
        }
        System.out.println(ctl);
        dtl = t - ctl;
        tl = (float)point / t * 100;
        System.out.println(point);
        System.out.println(tl);
        float diem = (float)point / t * 10;
        request.setAttribute("diem", diem);
        request.setAttribute("ctl", ctl);
        request.setAttribute("dtl", dtl);
        request.setAttribute("tl", tl);
        request.setAttribute("t", t);
        request.setAttribute("point", point);
        request.setAttribute("quiz", quiz);
        request.setAttribute(util.Constants.PAGE, "result");
        request.getRequestDispatcher(util.Constants.URL_INDEX).forward(request, response);

    }

    private void doEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int quizID = Integer.parseInt(request.getParameter("qid"));
        Quiz quiz = QD.getQuizByID(quizID);
        List<Disciplines> ddList = DD.listDisciplines();
        request.setAttribute(util.Constants.DD_LIST, ddList);

        request.setAttribute(util.Constants.QU, quiz);
        request.setAttribute(util.Constants.PAGE, "addquiz");
        request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
    }

    private void doEditqus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int qsid = Integer.parseInt(request.getParameter("qsid"));
        Questions qs = QTD.get(qsid);
        request.setAttribute(util.Constants.QS, qs);
        String p = request.getParameter("qid");
        request.setAttribute("aa", p);
        request.setAttribute(util.Constants.PAGE, "addqus");
        request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
    }

    private void editQuiz(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int quizID = Integer.parseInt(request.getParameter("qid"));
//        String username = request.getParameter("username");
        String content = request.getParameter("content");
        boolean active = true;
        boolean isview = true;
        int discipID = Integer.parseInt(request.getParameter("discip"));
        Disciplines discip = DD.get(discipID);

        if (QD.update(quizID, content, discip, active, isview)) {
            List<Quiz> qList = QD.listQuiz();
            request.setAttribute(util.Constants.Q_LIST, qList);
            request.setAttribute("msgResult", "Bạn đã sửa thông tin tài khoản thành công");
            request.setAttribute(util.Constants.PAGE, "manage-quiz");
            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
        } else {
            request.setAttribute("msgResult", "Sửa thông tin tài khoản thất bại");
            request.setAttribute(util.Constants.PAGE, "addquiz");
            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
        }
    }

    private void doAddnew(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Disciplines> ddList = DD.listDisciplines();
        request.setAttribute(util.Constants.DD_LIST, ddList);
        request.setAttribute(util.Constants.PAGE, "addquiz");

        request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
    }

    private void doAddqus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        List<Disciplines> ddList = DD.listDisciplines();
//        request.setAttribute(util.Constants.DD_LIST, ddList);
//        int quizID = Integer.parseInt(request.getParameter("id"));
//        System.out.println(quizID);
        String p = request.getParameter("qid");
        request.setAttribute("aa", p);
        request.setAttribute(util.Constants.PAGE, "addqus");
        request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
    }

    private void doview(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int quizID = Integer.parseInt(request.getParameter("qid"));
        Quiz q = QD.getQuizByID(quizID);
        List<Questions> qList = QTD.listQTbyQuiz(q);
        request.setAttribute(util.Constants.QU, q);
        request.setAttribute(util.Constants.QT_LIST, qList);
        request.setAttribute(util.Constants.PAGE, "questions");
        request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
    }

    private void doexams(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int quizID = Integer.parseInt(request.getParameter("qid"));
        Quiz q = QD.getQuizByID(quizID);
        List<Questions> qList = QTD.listQTbyQuiz(q);
        request.setAttribute(util.Constants.QU, q);
        request.setAttribute(util.Constants.QT_LIST, qList);
        request.setAttribute(util.Constants.PAGE, "exams");
        request.getRequestDispatcher(util.Constants.URL_INDEX).forward(request, response);
    }
private void doinfor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int quizID = Integer.parseInt(request.getParameter("qid"));
        Quiz q = QD.getQuizByID(quizID);
        List<Questions> qList = QTD.listQTbyQuiz(q);
        request.setAttribute(util.Constants.QU, q);
        request.setAttribute(util.Constants.QT_LIST, qList);
        request.setAttribute(util.Constants.PAGE, "infor");
        request.getRequestDispatcher(util.Constants.URL_INDEX).forward(request, response);
    }
    private void addQuiz(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//       int quizID = Integer.parseInt(request.getParameter("id"));
//        String username = request.getParameter("username");
        String content = request.getParameter("content");
        boolean active = true;
        boolean isview = true;
        int discipID = Integer.parseInt(request.getParameter("discip"));
        Disciplines discip = DD.get(discipID);
        System.out.println(content);

        Quiz q = new Quiz( discip, content, active, isview, 1, 1);
        if (QD.insertQuiz(q)) {
            List<Quiz> qList = QD.listQuiz();
            request.setAttribute(util.Constants.Q_LIST, qList);
            request.setAttribute("msgResult", "Bạn đã sửa thông tin tài khoản thành công");
            request.setAttribute(util.Constants.PAGE, "manage-quiz");
            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
        } else {
            request.setAttribute("msgResult", "Sửa thông tin tài khoản thất bại");
            request.setAttribute(util.Constants.PAGE, "addquiz");
            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
        }
    }

    private void addQus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int p = Integer.parseInt(request.getParameter("quiz"));
        String content = request.getParameter("content");
        String C1 = request.getParameter("choose1");
        String C2 = request.getParameter("choose2");
        String C3 = request.getParameter("choose3");
        String C4 = request.getParameter("choose4");
        String as = request.getParameter("answer");
        Quiz q = QD.getQuizByID(p);
        Questions qs = new Questions(q, content, C1, C2, C3, C4, as, null);

//        Quiz q = new Quiz(4, discip, content, active, isview, null, null);
        if (QTD.insertQuestions(qs)) {
            List<Questions> qList = QTD.listQTbyQuiz(q);
            request.setAttribute(util.Constants.QU, q);
            request.setAttribute("msgResult", "Thêm câu hỏi thành công");
            request.setAttribute(util.Constants.QT_LIST, qList);
            request.setAttribute(util.Constants.PAGE, "questions");
            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
        } else {
            request.setAttribute("msgResult", "Sửa thông tin tài khoản thất bại");
            request.setAttribute(util.Constants.PAGE, "questions");
            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
        }
    }

    private void editQus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int b = Integer.parseInt(request.getParameter("qsid"));
        int p = Integer.parseInt(request.getParameter("quiz"));
        String content = request.getParameter("content");
        String C1 = request.getParameter("choose1");
        String C2 = request.getParameter("choose2");
        String C3 = request.getParameter("choose3");
        String C4 = request.getParameter("choose4");
        String as = request.getParameter("answer");
        Quiz q = QD.getQuizByID(p);

//        Quiz q = new Quiz(4, discip, content, active, isview, null, null);
        if (QTD.update(b, content, C1, C2, C3, C4, as)) {
            List<Questions> qList = QTD.listQTbyQuiz(q);
            request.setAttribute(util.Constants.QU, q);
            request.setAttribute("msgResult", "Thêm câu hỏi thành công");
            request.setAttribute(util.Constants.QT_LIST, qList);
            request.setAttribute(util.Constants.PAGE, "questions");
            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
        } else {
            request.setAttribute("msgResult", "Sửa thông tin tài khoản thất bại");
            request.setAttribute(util.Constants.PAGE, "questions");
            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
        }
    }

    private void doDel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int questionID = Integer.parseInt(request.getParameter("qsid"));
        int quizID = Integer.parseInt(request.getParameter("qid"));
        Quiz q = QD.getQuizByID(quizID);
        if (QTD.delete(questionID)) {
            List<Questions> qList = QTD.listQTbyQuiz(q);
            request.setAttribute(util.Constants.QU, q);
            request.setAttribute("msgResult", "Xóa câu hỏi thành công");
            request.setAttribute(util.Constants.QT_LIST, qList);
            request.setAttribute(util.Constants.PAGE, "questions");
            request.getRequestDispatcher(util.Constants.URL_TEACHER).forward(request, response);
        } else {
            request.setAttribute(util.Constants.PAGE, "questions");
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
