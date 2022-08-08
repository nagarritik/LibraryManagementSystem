<%
Session ssn = factoryProvider.getSessionFactory().openSession();
Transaction transaction = ssn.beginTransaction();
%>

<%@page import="com.ud.lms.controller.factoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="com.ud.lms.model.student"%>
<%@page import="com.ud.lms.model.book"%>

<%
String studentName="";
List<book> issuedBooks = null;
int counter = 0;
int id = Integer.parseInt(request.getParameter("id"));
if (request.getParameter("id")!=null){
    student student = ssn.load(student.class,id);
    studentName = student.getName();
    issuedBooks = student.getIssuedBooks();
}
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
        th,td{
            border: 1px solid white;
            padding: 5px 7px;
        }
    </style>
</head>

<body>
    <div class="main">
        <h1><%=studentName%></h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Actions</th>
            </tr>
            <%
            for (book item:issuedBooks){
                %>
                    <tr>
                        <td><%=counter+1%></td>
                        <td><%=item.getName()%></td>
                        <td>
                            <a href="returnBook?id=<%=id%>&return=<%=counter%>">Return</a>
                        </td>
                    </tr>
                <%
                counter++;
            }
            %>
        </table>
    </div>
</body>

</html>

<%
transaction.commit();
ssn.close();
%>