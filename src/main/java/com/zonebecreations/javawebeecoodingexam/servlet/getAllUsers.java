/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zonebecreations.javawebeecoodingexam.servlet;

import com.zonebecreations.javawebeecoodingexam.dto.User;
import com.zonebecreations.javawebeecoodingexam.model.UserModel;
import org.json.simple.JSONArray;
import org.primefaces.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author abhi
 */
@WebServlet(name = "getAllUsers", urlPatterns = {"/getAllUsers"})
public class getAllUsers extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        JSONObject objSend = new JSONObject();
        JSONArray data = new JSONArray();

        int status = 200;


        try {
            List<User> allUsers = UserModel.getAllUsers();

            for (User user : allUsers){
                JSONObject u = new JSONObject();
                u.put("id", user.getId());
                u.put("fname", user.getFname());
                u.put("lname", user.getLname());
                u.put("nic", user.getNic());
                u.put("mobile", user.getMobile());

                data.add(u);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            status = 500;
        }


        objSend.put("status", status);
        objSend.put("data", data);

        System.out.println(objSend.toString());

        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.print(objSend);
        } finally {
            out.close();
        }

    }

    
}
