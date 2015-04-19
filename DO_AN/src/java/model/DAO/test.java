/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import java.util.List;
import model.entity.Clss;
import model.entity.Exams;
import model.entity.ExamsDetails;
import model.entity.ExamsDetailsId;
import model.entity.Questions;
import model.entity.Quiz;
import model.entity.Role;
import model.entity.User;

/**
 *
 * @author trongtanpanda
 */
public class test {

    public static void main(String[] args) {
        QuizDAO QD = QuizDAO.getInstance();
        DiscipDAO DD = DiscipDAO.getInstance();
        QuestionsDAO QTD = QuestionsDAO.getInstance();
        ExamsDetailsDAO EDD = ExamsDetailsDAO.getInstance();
        ExamsDAO ED = ExamsDAO.getInstance();
//        UserDAO us= new     UserDAO();
        RoleDAO rd = new RoleDAO();
        Role aa = rd.get(3);
        System.out.println(aa.getRolename());
//        
//        List<User> li= us.listUserByRole(rd.get(1));
//        for(int i=1;i<=li.size();i++){
//            System.out.println(i);
//        }
//        QuizDAO qd = QuizDAO.getInstance();
//        Quiz a =qd.getQuizByID(1);
//        System.out.println("anh trai" + a.getQuizId());
//       
//      List<Questions> li = QuestionsDAO.getInstance().listQTbyQuiz(a);
//       for(int i=1;i<=li.size();i++){
//            System.out.println("nao"+i);
//        }

//        Exams ex = ED.get(1);
//        Questions qs = QTD.get(2);
//        ExamsDetailsId edi = new ExamsDetailsId(1, 2);
//        ExamsDetails ed = new ExamsDetails(edi, ex, qs, "123");
//        if (EDD.insertExamsDT(ed)) {
//            System.out.println("thanh cong");
//        } else {
//            System.out.println("that bai");
//        }
//        System.out.println(a.getContent());
//      UserDAO us= new UserDAO();
////      us.getUserByName("admin");
//        System.out.println(us.getUserByName("admin").getPassword());
//      
//      if(us.authenticate("admin", "aa")){
//          System.out.println("thanh cong");
//      }else{
//          System.out.println("that bai");
//      }
//      int userID= 7;
//      RoleDAO rl = new RoleDAO();
//      Role r = rl.get(3);
//        System.out.println(r.getRolename());
//      ClssDAO cl = new ClssDAO();
//        System.out.println(cl.get(1).getClssname());

//      String un= "admin";
//      String p="admin";
//      String fn="fn";
//      String ln = "ln";
//      if(us.update(userID, p, fn, ln, null, c, r, true)){
//          System.out.println("thanh cong");
//      }else{
//          System.out.println("that bai");
//      }
//        User us = new User(null, null, "panda", "123", null, null, null, Boolean.TRUE, null);
    }
}
