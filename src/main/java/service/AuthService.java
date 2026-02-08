package service;

import dao.UserDAO;

public class AuthService {

    private UserDAO userDAO = new UserDAO();

    public boolean login(String username, String password) {

        if(username == null || password == null){
            return false;
        }

        return userDAO.validateLogin(username, password);
    }
}
