/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author shinq
 */
public class SQLServerProvider {
    Connection connection = null;
    Statement statement;
    ResultSet resultset;
    
     public void open() {
        String Server = "DESKTOP-6R0LBSM\\SQLEXPRESS";
        String Database = "KyTucXa";
        String User = "sa";
        String Pass = "123";
        
        try {
            String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            Class.forName(driver);
            String cnURL = "jdbc:sqlserver://" + Server + ":1433;databaseName=" + Database + ";user=" + User + ";password=" + Pass
                    + ";encrypt=true;trustServerCertificate=true";
            connection = DriverManager.getConnection(cnURL);
            if (connection != null) {
                System.out.println("Connected CSDL");
            } else {
                System.out.println("Failed to connect to the database");
            }
        } catch (Exception e) {
        }
    
    }
    
    public void close()
    {
        try {
            this.connection.close();
        } catch (Exception e) {
        }
    }
    
    public ResultSet executeQuery (String sql)
    {
         ResultSet resultset = null;
        try 
        {
            statement = connection.createStatement();
            resultset = statement.executeQuery(sql);
        } catch (Exception e) {
        }
        return resultset;
    }
    
    public int executeUpdate (String sql)
    {
       int n=-1;
        try {
            statement = connection.createStatement();
            n=statement.executeUpdate(sql);
        } catch (Exception e) {
        }
        return n;
    }
    
    public Connection getConnection() {
        if (connection == null) {
            open();
        }
        return connection;
    }
    
}
    

