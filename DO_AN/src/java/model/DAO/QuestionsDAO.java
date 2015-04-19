/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.DAO;

import java.util.List;
import model.entity.Questions;
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
public class QuestionsDAO {
    
 private static QuestionsDAO questionsDAO;

    public static QuestionsDAO getInstance() {
        if (questionsDAO == null) {
            questionsDAO = new QuestionsDAO();
        }
        return questionsDAO;
    }
    private HibernateUtil util;
    private Session session;
    
     public List<Questions> listQuestions() {
        List<Questions> questions = null;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String sql = "FROM Questions";
            Query query = session.createQuery(sql);
            questions = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return questions;
    }
     
    public Questions get(int questionID){
        session = util.getSessionFactory().openSession();
        Questions question = null;
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            question = (Questions)session.get(Questions.class,questionID);
            Hibernate.initialize(question);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return question;
        
    }
    public boolean insertQuestions(Questions ques){
         boolean isCheck= false;
         session = util.getSessionFactory().openSession();       
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(ques);
            session.flush();
            tx.commit();
            isCheck = true;
        } catch (HibernateException e) {
            if(session.getTransaction().isActive()){
                session.getTransaction().rollback();
            }
            e.printStackTrace();
            isCheck = false;
                    
        }
        return isCheck;
    }
    public boolean delete(int questionID){
        boolean isCheck= false;
        try {
            session.getTransaction().begin();
            Questions qs = (Questions)session.get(Questions.class,questionID);
            session.delete(qs);
            session.flush();
            session.getTransaction().commit();
            isCheck= true;
        } catch (Exception e) {
            if(session.getTransaction().isActive()){
                session.getTransaction().rollback();
            }
            e.printStackTrace();
            isCheck = false;
        }
        return isCheck;
        
    }
    public boolean update(int questionsId, String content, String c1, String c2, String c3, String c4, String as){
        boolean isCheck = false;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx =session.getTransaction();
            tx.begin();
            Questions qs = (Questions)session.get(Questions.class, questionsId); 
            
            qs.setContent(content);
            qs.setChooseA(c1);
            qs.setChooseB(c2);
            qs.setChooseC(c3);
            qs.setChooseD(c4);
            qs.setAnswer(as);
            session.update(qs); 
            tx.commit();
            isCheck = true;
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return isCheck;
    }
    public List<Questions> listQTbyQuiz(Quiz quiz) {
        List<Questions> lquest = null;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();            
            String sql = "FROM Questions as q WHERE q.quiz = :uiz";
            Query query = session.createQuery(sql);
            query.setParameter("uiz", quiz);
            lquest = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
//            session.close();
        }
        return lquest;
    }
}
