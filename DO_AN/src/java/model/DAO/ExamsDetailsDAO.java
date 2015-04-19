/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.DAO;

import java.util.List;
import model.entity.Exams;
import model.entity.ExamsDetails;
import model.entity.Quiz;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author trongtanpanda
 */
public class ExamsDetailsDAO {
    private static ExamsDetailsDAO examsDetailsDAO;

    public static ExamsDetailsDAO getInstance() {
        if (examsDetailsDAO == null) {
            examsDetailsDAO = new ExamsDetailsDAO();
        }
        return examsDetailsDAO;
    }
    
    private HibernateUtil util;
    private Session session;
    
    public List<ExamsDetails> listExamsDTByEX(Exams exam) {
        List<ExamsDetails> exams = null;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();            
            String sql = "FROM ExamsDetails as u WHERE u.exams = :exam";
            Query query = session.createQuery(sql);
            query.setParameter("exam", exam);
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
    public boolean insertExamsDT(ExamsDetails examsDT){
         boolean isCheck= false;
         session = util.getSessionFactory().openSession();       
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(examsDT);
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
}
