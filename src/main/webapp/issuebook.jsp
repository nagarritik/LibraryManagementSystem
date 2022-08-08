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
        form{
            border: 2px solid white;
            height: 300px;
            padding: 0 20px;
            width: max-content;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        input,select{
            width: 100%;
            padding: 7px;
            border-radius: 50px;
            border: 2px solid white;
            background-color: transparent;
            margin:10px 0;
        }
        option{
            color:black;
        }
    </style>
</head>

<body>
    <div class="main">
        <form action="issueBook" method="post">
            <label for="book">Book</label>
            <select name="book" id="book">
            <%
            Query query = ssn.createQuery("from book");
            List<book> bookList = query.list();
            for (book item:bookList){
            %>
                <option value="<%=item.getId()%>"><%=item.getName()%></option>
            <%
            }
            %>
            </select>

            <label for="student">Student</label>
            <select name="student" id="student">
            <%
            Query query2 = ssn.createQuery("from student");
            List<student> studentList = query2.list();
            for (student item:studentList){
            %>
                <option value="<%=item.getId()%>"><%=item.getName()%></option>
            <%
            }
            %>
            </select>

            <input type="submit" value="Issue">
        </form>
    </div>
</body>

</html>

<%
transaction.commit();
ssn.close();
%>