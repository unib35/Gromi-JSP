package model.userdata;

import java.sql.*;
import java.util.*;
import model.ConnectionPool;

public class UserDAO {
	protected Connection conn;
    protected Statement stat = null;
    protected ResultSet rs = null;

    public UserDAO() {
        conn = ConnectionPool.getInstance().getConnection();
        try {
            stat = conn.createStatement();
        } catch (SQLException ex) {
        }
    }
	public void insert(User user) {
        try {
            String format = "INSERT INTO %s VALUES('%s', '%s', '%s')";
            String query = String.format(format, "GROMIUSER", user.getId(), user.getPw(), user.getName());
            stat.executeUpdate(query);
        } catch (SQLException ex) {
        }
    }

    
    public ArrayList<User> findAll() {
        ArrayList<User> users = new ArrayList<User>();
        try {
            String format = "SELECT * FROM %s";
            String query = String.format(format, "GROMIUSER");
            rs = stat.executeQuery(query);
            while (rs.next()) {
                users.add(new User(
                        rs.getString("id"),
                        rs.getString("pw"),
                        rs.getString("name")
                ));
            }
        } catch (SQLException ex) {
        }
        return users;
    }

    
    public User findById(String id) {
        User user = null;
        try {
            String format = "SELECT * FROM %s WHERE id = '%s'";
            String query = String.format(format, "GROMIUSER", id);
            rs = stat.executeQuery(query);
            while (rs.next()) {
                user = new User(
                        rs.getString("id"),
                        rs.getString("pw"),
                        rs.getString("name")
                );
            }
        } catch (SQLException ex) {
        }
        return user;
    }

    
    public void update(String id, User user) {
        User u = findById(id);
        if (u != null) {
            try {
                String format = "UPDATE %s SET pw = '%s', name ='%s' WHERE id = '%s'";
                String query = String.format(format, "GROMIUSER", user.getPw(), user.getName(), user.getId());
                stat.executeUpdate(query);
            } catch (SQLException ex) {
            }
        }
    }

    
    public void delete(User user) {
        deleteById(user.getId());
    }

    
    public void deleteById(String id) {
        try {
            String format = "DELETE FROM %s WHERE id = '%s'";
            String query = String.format(format, "GROMIUSER", id);
            stat.executeUpdate(query);
        } catch (SQLException ex) {
        }
    }
}
