package com.ud.lms;

import com.ud.lms.controller.factoryProvider;
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

public class Main {
    public static void main(String[] args) {
        Session ssn = factoryProvider.getSessionFactory().openSession();
        Transaction transaction = ssn.beginTransaction();

        student student = ssn.get(com.ud.lms.model.student.class,11);
        List<book> issuedBooks = student.getIssuedBooks();

        for (book item:issuedBooks){
            System.out.println(item.getName());
        }

        transaction.commit();
        ssn.close();
    }
}

class servlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Session ssn = factoryProvider.getSessionFactory().openSession();
        Transaction transaction = ssn.beginTransaction();

        String studentName;
        List<book> issuedBooks = null;
        int counter = 0;
        if (request.getParameter("id")!=null){
            int id = Integer.parseInt(request.getParameter("id"));
            student student = ssn.load(student.class,id);
            studentName = student.getName();
            issuedBooks = student.getIssuedBooks();
        }
        
        for (book item:issuedBooks){
            System.out.println(counter);
            counter++;

        }

        transaction.commit();
        ssn.close();
    }
}