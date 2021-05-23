/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zonebecreations.javawebeecoodingexam.servlet;

import com.zonebecreations.javawebeecoodingexam.dto.User;
import com.zonebecreations.javawebeecoodingexam.model.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.primefaces.json.JSONObject;

/**
 *
 * @author abhi
 */
@WebServlet(name = "getUserById", urlPatterns = {"/getUserById"})
public class getUserById extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        JSONObject objSend = new JSONObject();
        JSONObject data = new JSONObject();

        int status = 200;
        String id = request.getParameter("id");

        try {
            User user = UserModel.getAllUserById(id);

            if(user != null){
                data.put("id", user.getId());
                data.put("fname", user.getFname());
                data.put("lname", user.getLname());
                data.put("nic", user.getNic());
                data.put("mobile", user.getMobile());

            }else{
                status = 500;
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
