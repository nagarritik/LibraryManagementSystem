package com.ud.lms.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class student {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String name;
    private String enrollmentNo;
    @OneToMany
    private List<book> issuedBooks;

    public student(String name, String enrollmentNo, List<book> issuedBooks) {
        this.name = name;
        this.enrollmentNo = enrollmentNo;
        this.issuedBooks = issuedBooks;
    }

    public student() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEnrollmentNo() {
        return enrollmentNo;
    }

    public void setEnrollmentNo(String enrollmentNo) {
        this.enrollmentNo = enrollmentNo;
    }

    public List<book> getIssuedBooks() {
        return issuedBooks;
    }

    public void setIssuedBooks(List<book> issuedBooks) {
        this.issuedBooks = issuedBooks;
    }

    @Override
    public String toString() {
        return "student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", enrollmentNo='" + enrollmentNo + '\'' +
                ", issuedBooks=" + issuedBooks +
                '}';
    }
}
