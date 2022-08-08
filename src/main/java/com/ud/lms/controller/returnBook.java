package com.ud.lms.controller;

import com.ud.lms.model.book;
import com.ud.lms.model.student;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class returnBook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int studentId = Integer.parseInt(req.getParameter("id"));
        int returnId = Integer.parseInt(req.getParameter("return"));


        Session ssn = factoryProvider.getSessionFactory().openSession();
        Transaction transaction = ssn.beginTransaction();

        student student = ssn.get(com.ud.lms.model.student.class,studentId);
        student.getIssuedBooks().remove(returnId);

        transaction.commit();
        ssn.close();

        resp.sendRedirect("returnbook.jsp?id="+studentId);
    }
}
