<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Courses</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        /* Navbar */
        .navbar {
            width: 100%;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: flex-start; /* Align to the left */
            background: linear-gradient(135deg, #34495e, #16a085);
            color: white;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 0 20px; /* Add padding for spacing */
        }

        .navbar h1 {
            font-size: 24px;
            font-weight: 600;
        }

        /* Main Content */
        .main-content {
            margin-top: 30px;
            text-align: center;
            width: 100%;
            max-width: 1000px;
        }

        .main-content h2 {
            font-size: 28px;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        thead {
            background: linear-gradient(135deg, #16a085, #1abc9c);
            color: #fff;
        }

        thead tr {
            height: 50px;
        }

        th, td {
            text-align: center; /* Center alignment for both headings and data */
            padding: 8px; /* Reduced padding for a more compact layout */
            font-size: 14px;
        }

        tbody tr {
            height: 40px;
            transition: background-color 0.2s ease-in-out;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #f1f7f9;
        }

        a {
            text-decoration: none;
            color: #16a085;
            font-weight: bold;
            transition: color 0.2s ease-in-out;
        }

        a:hover {
            color: #1abc9c;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            th, td {
                font-size: 14px;
                padding: 8px;
            }

            .navbar h1 {
                font-size: 20px;
            }

            .main-content h2 {
                font-size: 22px;
            }
        }

        @media (max-width: 500px) {
            body {
                padding: 10px;
            }

            table {
                font-size: 12px;
            }

            th, td {
                padding: 6px;
            }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Learning Management System</h1>
    </div>

    <div class="main-content">
        <h2>Available Courses</h2>
        <table>
            <thead>
                <tr>
                    <th>Course Code</th>
                    <th>Course Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="course" items="${courses}">
                    <tr>
                        <td>${course.courseCode}</td>
                        <td>
                            <a href="coursedetails?courseCode=${course.courseCode}">
                                ${course.courseName}
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
