<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>
    <style>
        *{
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
        input{
            width: 100%;
            padding: 7px;
            border-radius: 50px;
            border: 2px solid white;
            background-color: transparent;
            margin:10px 0;
        }
    </style>
</head>

<body>
    <div class="main">
        <form action="addStudent" method="post">
            <label for="name">Name</label>
            <input type="text" name="name" id="name" placeholder="Enter Name" required>

            <label for="enrollmentno">Enrollment Number</label>
            <input type="text" name="enrollmentno" id="enrollmentno" placeholder="Enter Enrollment Number" required>

            <input type="submit" value="Submit">
        </form>
    </div>
</body>

</html>