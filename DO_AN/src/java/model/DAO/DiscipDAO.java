/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.DAO;

import java.util.List;
import model.entity.Disciplines;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author trongtanpanda
 */
public class DiscipDAO {
    

//     Session session = HibernateUtil.getSessionFactory().openSession();
     
      private static DiscipDAO discipDAO;

    public static DiscipDAO getInstance() {
        if (discipDAO == null) {
            discipDAO = new DiscipDAO();
        }
        return discipDAO;
    }
    private HibernateUtil util;
    private Session session;
    
     public List<Disciplines> listDisciplines() {
        List<Disciplines> discips = null;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String sql = "FROM Disciplines";
            Query query = session.createQuery(sql);
            discips = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return discips;
    }
     
    public Disciplines get(int discipID){
        session = util.getSessionFactory().openSession();
        Disciplines discip = null;
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            discip = (Disciplines)session.get(Disciplines.class, discipID);
            Hibernate.initialize(discip);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } 
        return discip;
        
    }
    public void insertDicip(Disciplines discip){
       try {
            session.getTransaction().begin();
            session.save(discip);
            session.flush();
            session.getTransaction().commit();
        } catch (Exception e) {
            if(session.getTransaction().isActive()){
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
    }
    public void delete(int discipID){
        try {
            session.getTransaction().begin();
            Disciplines discip = (Disciplines)session.get(Disciplines.class,discipID);
            session.delete(discip);
            session.flush();
            session.getTransaction().commit();            
        } catch (Exception e) {
            if(session.getTransaction().isActive()){
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        
    }
    public void update(Disciplines discip){
        try {
            session.getTransaction().begin();
            session.update(discip);
            session.flush();
            session.getTransaction().commit();
        } catch (Exception e) {
            if(session.getTransaction().isActive()){
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
    }
}
