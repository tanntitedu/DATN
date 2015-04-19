/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.DAO;

import java.util.List;
import model.entity.Exams;
import model.entity.User;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author trongtanpanda
 */
public class ExamsDAO {
    
    private static ExamsDAO examsDAO;

    public static ExamsDAO getInstance() {
        if (examsDAO == null) {
            examsDAO = new ExamsDAO();
        }
        return examsDAO;
    }
    
    private HibernateUtil util;
    private Session session;
        
    public List<Exams> listExams() {
        List<Exams> exams = null;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String sql = "FROM Exams";
            Query query = session.createQuery(sql);
            exams = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
//            session.close();
        }
        return exams;
    }
    public List<Exams> listExamsByUser(User user) {
        List<Exams> exams = null;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();            
            String sql = "FROM Exams as u WHERE u.user = :user";
            Query query = session.createQuery(sql);
            query.setParameter("user", user);
            exams = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
//            session.close();
        }
        return exams;
    }
    public boolean insertExams(Exams exams){
         boolean isCheck= false;
         session = util.getSessionFactory().openSession();       
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(exams);
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
     public Exams get(int examID){
        session = util.getSessionFactory().openSession();
        Exams exam = null;
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            exam = (Exams)session.get(Exams.class,examID);
            Hibernate.initialize(exam);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return exam;
        
    }
}
