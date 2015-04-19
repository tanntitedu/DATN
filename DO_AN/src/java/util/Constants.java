/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import model.DAO.RoleDAO;
import model.entity.Role;

/**
 *
 * @author Admin
 */
public class Constants {

    /**
     * Admin's Email receive
     */
    public static final String TO_EMAIL = "cong.09s@gmail.com";

    /**
     * Admin's Email sent
     */
    public static final String FROM_EMAIL = "king.vandalism@gmail.com";
    /**
     * Password of Admin's Email
     */
    public static final String PASSWORD_EMAIL = "congtrinh";

    public static final String URL_TEACHER = "teacher.jsp";
    public static final String URL_ADMIN = "admin.jsp";
    public static final String URL_INDEX = "home.jsp";
    public static final String MSG_SUCCESS ="msgSuccess";
    public static final String MSG_RESULT = "msgResult";
    public static final String PAGE = "p";

    public static final String CURRENT_USER = "currentUser";
    RoleDAO rl = new RoleDAO();
    Role ROLE = rl.get(3);
    
    public static final String US_LIST = "usList";
    public static final String CL_LIST = "clList";
    public static final String RL_LIST = "rlList";
    public static final String Q_LIST = "qList";    
    public static final String DD_LIST = "ddList";    
    public static final String QT_LIST = "qtList";
    
    public static final String US = "us";
    public static final String CL= "cl";
    public static final String QU = "qu";
    public static final String QS = "qs";
}
