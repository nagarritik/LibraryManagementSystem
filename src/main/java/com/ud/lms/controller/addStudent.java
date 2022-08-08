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
import java.util.ArrayList;
import java.util.List;

public class addStudent extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String enrollmentNo = req.getParameter("enrollmentno");
        List<book> issuedBooks = new ArrayList<>();

        Session session = factoryProvider.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        student student = new student(name,enrollmentNo,issuedBooks);

        session.save(student);

        transaction.commit();
        session.close();

        resp.sendRedirect("showstudent.jsp");
    }
}
