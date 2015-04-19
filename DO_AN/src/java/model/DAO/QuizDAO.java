/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.DAO;

import java.util.List;
import model.entity.Disciplines;
import model.entity.Quiz;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author trongtanpanda
 */
public class QuizDAO {
 private static QuizDAO quizDAO;

    public static QuizDAO getInstance() {
        if (quizDAO == null) {
            quizDAO = new QuizDAO();
        }
        return quizDAO;
    }
        private HibernateUtil util;
        private Session session;
        
   public List<Quiz> listQuiz() {
        List<Quiz> quiz = null;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String sql = "FROM Quiz";
            Query query = session.createQuery(sql);
            quiz = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
//            session.close();
        }
        return quiz;
    }
//   public List<Quiz> listQuizByRole(Role role) {
//        List<Quiz> quiz = null;
//        session = util.getSessionFactory().openSession();
//        Transaction tx = null;
//        try {
//            tx = session.beginTransaction();            
//            String sql = "FROM Quiz as u WHERE u.role = :role";
//            Query query = session.createQuery(sql);
//            query.setParameter("role", role);
//            quiz = query.list();
//            tx.commit();
//        } catch (HibernateException e) {
//            if (tx != null) {
//                tx.rollback();
//            }
//            e.printStackTrace();
//        } finally {
////            session.close();
//        }
//        return quiz;
//    }
    public boolean insertQuiz(Quiz quiz){
         boolean isCheck= false;
         session = util.getSessionFactory().openSession();       
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(quiz);
            session.flush();
            tx.commit();
            isCheck = true;
        } catch (HibernateException e) {
            if(session.getTransaction().isActive()){
                session.getTransaction().rollback();
            }
            e.printStackTrace();
            isCheck = false;
                    
        }finally {
            session.close();
        }
        return isCheck;
    }
    public boolean update(int quizID, String content, Disciplines discip,  boolean active, boolean isview){
        boolean isCheck = false;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx =session.getTransaction();
            tx.begin();
            Quiz quiz = (Quiz)session.get(Quiz.class, quizID);  
            
            quiz.setDisciplines(discip);
            quiz.setContent(content);            
            quiz.setIsview(isview);
            quiz.setActive(active);          
            session.update(quiz); 
            tx.commit();
            isCheck = true;
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } 
        return isCheck;
    }
    public boolean delete(int quizID){
       boolean isCheck= false;
        try {
            session.getTransaction().begin();
            Quiz quiz = (Quiz)session.get(Quiz.class,quizID);
            session.delete(quiz);
            session.flush();
            session.getTransaction().commit();
            isCheck= true;
        } catch (HibernateException e) {
            if(session.getTransaction().isActive()){
                session.getTransaction().rollback();
            }
            e.printStackTrace();
            isCheck = false;
        }finally {
            session.close();
        }
        return isCheck;
    }
    public Quiz getQuizByID(int quizID){
         Quiz quiz = null;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String sql = "FROM Quiz as u WHERE u.quizId = :quizID";
            Query query = session.createQuery(sql);
            query.setParameter("quizID", quizID);
            quiz = (Quiz) query.uniqueResult();
           
            
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
//            session.close();
        }
        return quiz;
        }
    
    
    public Quiz getQuizByName(String quizname){
        
       Quiz quiz = null;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String sql = "FROM Quiz as u WHERE u.quizname = :quizName";
            Query query = session.createQuery(sql);
            query.setParameter("quizName", quizname);
            quiz = (Quiz) query.uniqueResult();
           
            
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return quiz;
//        Quiz quiz = null;
//        Transaction tx = null;
//        try {
//            
//            tx = session.getTransaction();
//            tx.begin();
////            String hql =;
//            Query query = session.createQuery("from Quiz where quizname = '"+quizname+"'");
//            quiz = (Quiz)query.uniqueResult();
//            tx.commit();
//        } catch (Exception e) {
//		 if (tx != null) {
//			 tx.rollback();
//		 }
//		 e.printStackTrace();
//	 } 
//		
//	 return quiz;
        
        
    }
    
   
}

