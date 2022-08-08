package com.ud.lms.controller;

import com.ud.lms.model.book;
import com.ud.lms.model.student;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class issueBook extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Session ssn = factoryProvider.getSessionFactory().openSession();
        Transaction transaction = ssn.beginTransaction();

        int studentId = Integer.parseInt(req.getParameter("student"));
        int bookId = Integer.parseInt(req.getParameter("book"));

        student student = ssn.get(com.ud.lms.model.student.class,studentId);
        book book = ssn.get(com.ud.lms.model.book.class,bookId);

        student.getIssuedBooks().add(book);

        resp.sendRedirect("index.jsp");

        transaction.commit();
        ssn.close();
    }
}
