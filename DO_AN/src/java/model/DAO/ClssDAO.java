/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.DAO;

import java.util.Date;
import java.util.List;
import model.entity.Clss;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author trongtanpanda
 */
public class ClssDAO {
//    private Session session = HibernateUtil.getSessionFactory().openSession();
    
     private static ClssDAO clssDAO;

    public static ClssDAO getInstance() {
        if (clssDAO == null) {
            clssDAO = new ClssDAO();
        }
        return clssDAO;
    }
    
    private HibernateUtil util;
    private Session session;
    
     public List<Clss> listClss() {
        List<Clss> clss = null;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String sql = "FROM Clss";
            Query query = session.createQuery(sql);
            clss = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return clss;
    }
    public Clss get(int clssID){
        session = util.getSessionFactory().openSession();
        Clss clss = null;
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            clss = (Clss)session.get(Clss.class,clssID);
            Hibernate.initialize(clss);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return clss;
        
    }
    public boolean insertClss(Clss clss){
        boolean isCheck= false;
         session = util.getSessionFactory().openSession();       
        Transaction tx = null;
       try {
            tx = session.beginTransaction();
            session.save(clss);
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
    public boolean delete(int clssID){
       boolean isCheck= false;
       session = util.getSessionFactory().openSession();       
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Clss clss = (Clss)session.get(Clss.class,clssID);
            session.delete(clss);
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
    public boolean update(int ClssID, String clssname, int ys, int yf, String note){
        boolean isCheck = false;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx =session.getTransaction();
            tx.begin();
            Clss clss = (Clss)session.get(Clss.class, ClssID); 
            
            clss.setClssname(clssname);
            clss.setYearStart(ys);
            clss.setYearfinish(yf);
            clss.setNotes(note);
            session.update(clss); 
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
}
