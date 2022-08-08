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
        <!-- <form action="addBook" method="post">
            <label for="name">Name</label>
            <input type="text" name="name" id="name" placeholder="Enter Name" required>

            <label for="unit">Unit</label>
            <input type="number" name="unit" id="unit" placeholder="Enter Unit" required>

            <input type="submit" value="Submit">
        </form> -->
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Unit</th>
                <th>Actions</th>
            </tr>

            <%
            Query query = ssn.createQuery("from book");
            List<book> bookList = query.list();
            int counter=1;

            for (book item:bookList){
            %>
                <tr>
                    <td><%=counter%></td>
                    <td><%=item.getName()%></td>
                    <td><%=item.getUnit()%></td>
                    <td>
                        <a href="?delete=<%=item.getId()%>">Delete</a>
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
if (request.getParameter("delete")!=null){
    int deleteId = Integer.parseInt(request.getParameter("delete"));
    book book = ssn.get(book.class,deleteId);
    ssn.delete(book);
    response.sendRedirect("showbook.jsp");
}
%>

<%
transaction.commit();
ssn.close();
%>