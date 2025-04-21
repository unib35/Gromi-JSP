package model;

import java.sql.Connection;

public class ConnectionPool {

    private static ConnectionPool instance;
    private Connection connection;

    private ConnectionPool() {
        this.connection = new ConnectMaria().getConn();
    }

    public static ConnectionPool getInstance() {
        if (instance == null) {
            instance = new ConnectionPool();
        }
        return instance;
    }

    public Connection getConnection() {
        return connection;
    }
}