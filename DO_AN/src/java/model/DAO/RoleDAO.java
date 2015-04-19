/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.DAO;

import java.util.List;
import model.entity.Role;
import org.eclipse.persistence.sessions.SessionProfiler;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author trongtanpanda
 */
public class RoleDAO {
//     Session session = HibernateUtil.getSessionFactory().openSession();
     
      private static RoleDAO roleDAO;

    public static RoleDAO getInstance() {
        if (roleDAO == null) {
            roleDAO = new RoleDAO();
        }
        return roleDAO;
    }
    private HibernateUtil util;
    private Session session;
    
     public List<Role> listRole() {
        List<Role> roles = null;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String sql = "FROM Role";
            Query query = session.createQuery(sql);
            roles = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return roles;
    }
     
    public Role get(int roleID){
        session = util.getSessionFactory().openSession();
        Role role = null;
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            role = (Role)session.get(Role.class,roleID);
            Hibernate.initialize(role);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return role;
        
    }
    public void insertClss(Role role){
       try {
            session.getTransaction().begin();
            session.save(role);
            session.flush();
            session.getTransaction().commit();
        } catch (Exception e) {
            if(session.getTransaction().isActive()){
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
    }
    public void delete(int roleID){
        try {
            session.getTransaction().begin();
            Role role = (Role)session.get(Role.class,roleID);
            session.delete(role);
            session.flush();
            session.getTransaction().commit();            
        } catch (Exception e) {
            if(session.getTransaction().isActive()){
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        
    }
    public void update(Role role){
        try {
            session.getTransaction().begin();
            session.update(role);
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
