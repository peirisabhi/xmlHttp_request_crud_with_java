/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zonebecreations.javawebeecoodingexam.servlet;

import com.zonebecreations.javawebeecoodingexam.model.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.primefaces.json.JSONObject;

/**
 *
 * @author abhi
 */
@WebServlet(name = "updateUser", urlPatterns = {"/updateUser"})
public class updateUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        JSONObject objSend = new JSONObject();

        int status = 200;
        String message = "";

        try {

            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String nic = request.getParameter("nic");
            String mobile = request.getParameter("mobile");
            String id = request.getParameter("id");

            System.out.println(fname);
            System.out.println(lname);
            System.out.println(nic);
            System.out.println(mobile);
            System.out.println(id);

            if (fname == null) {
                status = 500;
                message = "First Name is Empty!";
            } else if (lname == null) {
                status = 500;
                message = "Last Name is Empty!";
            } else if (nic == null) {
                status = 500;
                message = "Nic is Empty!";
            } else if (mobile == null) {
                status = 500;
                message = "Mobile is Empty!";
            } else {

                boolean result = UserModel.updateUser(fname, lname, nic, mobile, id);

                if (result) {
                    status = 200;
                    message = "Successfully Updated!";
                } else {
                    status = 500;
                    message = "Something Went Wrong!";
                }

            }
        } catch (Exception e) {
            status = 500;
            message = "Something Went Wrong!";
            e.printStackTrace();
        }

        objSend.put("status", status);
        objSend.put("message", message);

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
