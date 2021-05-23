/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zonebecreations.javawebeecoodingexam.model;

import com.zonebecreations.javawebeecoodingexam.db.DBConnection;
import com.zonebecreations.javawebeecoodingexam.dto.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * @author abhi
 */
public class UserModel {

    public static int saveUser(String fname, String lname, String nic, String mobile) {

        Connection connection = null;
        int userId = 0;

        try {

            connection = DBConnection.getConnection();

            System.out.println(connection);

            PreparedStatement preparedStatement1 = connection.prepareStatement("INSERT INTO user  (`fname`, `lname`, `nic`, `mobile`, `status`) VALUES(?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            preparedStatement1.setString(1, fname);
            preparedStatement1.setString(2, lname);
            preparedStatement1.setString(3, nic);
            preparedStatement1.setString(4, mobile);
            preparedStatement1.setInt(5, 1);

            preparedStatement1.executeUpdate();

            ResultSet rs = preparedStatement1.getGeneratedKeys();

            if (rs.next()) {
                userId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return userId;
    }

    public static boolean updateUser(String fname, String lname, String nic, String mobile, String id) {

        Connection connection = null;
        boolean status = true;

        try {

            connection = DBConnection.getConnection();

            System.out.println(connection);

            String sql = "UPDATE user SET `fname`=?, `lname`=?, `nic`=?, `mobile`=? WHERE `id`='" + id + "'";

            PreparedStatement preparedStatement1 = connection.prepareStatement(sql);
            preparedStatement1.setString(1, fname);
            preparedStatement1.setString(2, lname);
            preparedStatement1.setString(3, nic);
            preparedStatement1.setString(4, mobile);

            preparedStatement1.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();
            status = false;
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return status;
    }

    public static boolean deleteUser(String id) {

        Connection connection = null;
        boolean status = true;

        try {

            connection = DBConnection.getConnection();

            System.out.println(connection);

            String sql = "UPDATE user SET `status`= 0 WHERE `id`='" + id + "'";

            PreparedStatement preparedStatement1 = connection.prepareStatement(sql);

            preparedStatement1.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();
            status = false;
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return status;
    }

    public static List<User> getAllUsers() throws SQLException {
        List<User> all = new ArrayList<User>();

        Connection connection = DBConnection.getConnection();

        String sql = "SELECT * FROM user WHERE status = 1";
        PreparedStatement pstmt = connection.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));

            all.add(user);
        }
        rs.close();
        pstmt.close();
        return all;
    }

    public static User getAllUserById(String id) throws SQLException {

        Connection connection = DBConnection.getConnection();

        User user = null;

        String sql = "SELECT * FROM user WHERE id = '" + id + "' ";
        PreparedStatement pstmt = connection.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));

        }
        rs.close();
        pstmt.close();
        return user;
    }

}
