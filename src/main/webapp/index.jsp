<%
Session ssn = factoryProvider.getSessionFactory().openSession();
Transaction transaction = ssn.beginTransaction();
%>

<%@page import="com.ud.lms.controller.factoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.ud.lms.model.book"%>
<%@page import="com.ud.lms.model.student"%>

<%
Query query = ssn.createQuery("from student");
List<student> studentList = query.list();

Query query2 = ssn.createQuery("from book");
List<book> bookList = query2.list();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>
    <style>
        *{
            text-decoration: none;
            color: white;
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        }
        body{
            background-image: linear-gradient(to top right,rgb(66, 36, 147),rgb(9, 191, 185));
            width: 100vw;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .main{
            display: flex;
        }
        .student, .book{
            background-color: gray;
            border-bottom:2px solid white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 100px;
            height: 130px;
            border-radius: 10px;
            margin: 10px;
        }
        header{
            width: 100%;
            position: absolute;
            top: 0;
            display: flex;
        }
        nav{
            top: 10px;
            position: absolute;
            right: 5px;
        }
        nav a{
            border: 2px solid gray;
            padding: 5px 7px;
            border-radius: 10px;
        }
    </style>
</head>

<body>
    <header>
        <h1>Library Management System</h1>
        <nav>
            <a href="issuebook.jsp">Issue Book</a>
            <a href="addstudent.jsp">Add Student</a>
            <a href="addbook.jsp">Add Book</a>
            <a href="showstudent.jsp">Show Student</a>
            <a href="showbook.jsp">Show Book</a>
        </nav>
    </header>
    <div class="main">
        <div class="student">
            <span>Student</span>
            <h1><%=studentList.size()%></h1>
        </div>
        <div class="book">
            <span>Book</span>
            <h1><%=bookList.size()%></h1>
        </div>
    </div>
</body>

</html>

<%
transaction.commit();
ssn.close();
%>