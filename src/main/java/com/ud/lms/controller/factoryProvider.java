package com.ud.lms.controller;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class factoryProvider {
    private static SessionFactory sessionFactory;
    public static SessionFactory getSessionFactory(){
        sessionFactory = new Configuration().configure().buildSessionFactory();
        return sessionFactory;
    }
}
