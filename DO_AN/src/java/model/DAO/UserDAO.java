/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.DAO;

import java.util.Date;
import java.util.List;
import model.entity.Clss;
import model.entity.Role;
import model.entity.User;
import org.hibernate.*;

/**
 *
 * @author trongtanpanda
 */
public class UserDAO {
//    private final SessionFactory sf = HibernateUtil.getSessionFactory();
//    private Session session = HibernateUtil.getSessionFactory().openSession();
//    
     private static UserDAO userDAO;

    public static UserDAO getInstance() {
        if (userDAO == null) {
            userDAO = new UserDAO();
        }
        return userDAO;
    }
        private HibernateUtil util;
        private Session session;
        
   public List<User> listUser() {
        List<User> user = null;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String sql = "FROM User";
            Query query = session.createQuery(sql);
            user = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
//            session.close();
        }
        return user;
    }
   public List<User> listUserByRole(Role role) {
        List<User> user = null;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();            
            String sql = "FROM User as u WHERE u.role = :role";
            Query query = session.createQuery(sql);
            query.setParameter("role", role);
            user = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
//            session.close();
        }
        return user;
    }
    public boolean insertUser(User user){
         boolean isCheck= false;
         session = util.getSessionFactory().openSession();       
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(user);
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
    public boolean update(int userID, String pass, String fname, String lname, Date bday, Clss cl, Role rl, boolean active){
        boolean isCheck = false;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx =session.getTransaction();
            tx.begin();
            User user = (User)session.get(User.class, userID); 
            
            user.setPassword(pass);
            user.setFirstname(fname);
            user.setLastname(lname);
            user.setBirthday(bday);
            user.setClss(cl);
            user.setRole(rl);
            user.setActive(active);          
            session.update(user); 
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
    public boolean delete(int userID){
       boolean isCheck= false;
        try {
            session.getTransaction().begin();
            User user = (User)session.get(User.class,userID);
            session.delete(user);
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
    public User getUserByID(int userID){
        try {
            session.getTransaction().begin();
            User user = (User)session.get(User.class,userID);
            Hibernate.initialize(user);
            return user;
        } catch (Exception e) {
            return null;
        }
    
    }
    public User getUserByName(String username){
        
       User user = null;
        session = util.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String sql = "FROM User as u WHERE u.username = :userName";
            Query query = session.createQuery(sql);
            query.setParameter("userName", username);
            user = (User) query.uniqueResult();
           
            
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
//            session.close();
        }
        return user;
//        User user = null;
//        Transaction tx = null;
//        try {
//            
//            tx = session.getTransaction();
//            tx.begin();
////            String hql =;
//            Query query = session.createQuery("from User where username = '"+username+"'");
//            user = (User)query.uniqueResult();
//            tx.commit();
//        } catch (Exception e) {
//		 if (tx != null) {
//			 tx.rollback();
//		 }
//		 e.printStackTrace();
//	 } 
//		
//	 return user;
        
        
    }
    
    public boolean authenticate(String username, String password) {
	 User user = getUserByName(username);		
	 if(user!=null && user.getUsername().equals(username) && user.getPassword().equals(password)){
		 return true;
	 }else{
		 return false;
	 }
    }   
}
