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

public class addBook extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        int unit = Integer.parseInt(req.getParameter("unit"));

        Session session = factoryProvider.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        book book = new book(name,unit);
        session.save(book);

        transaction.commit();
        session.close();

        resp.sendRedirect("showbook.jsp");

    }
}
