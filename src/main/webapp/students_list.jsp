<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Students</title>
    
    <style>
        /* General Body Styling */
        body {
            font-family: Arial, sans-serif;
            display: flex;
            margin: 0;
            padding: 0;
        }
        .sidebar {
            width: 250px; /* or any specific width you have defined */
            background-color: #333;
            color: white;
            padding: 20px;
            box-sizing: border-box;
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            z-index: 100; /* Ensure it stays on top */
        }

        /* Table Container Styling */
        .table-container {
            margin-left: 101px; /* Offset by the width of the sidebar */
            padding: 20px;
            flex-grow: 1;
            overflow-y: auto;
            margin-top: 20px; /* Space between table and top of the page */
        }

        /* Heading Styling */
        h2 {
            color: #002244; /* Green color */
            text-align: center; /* Center the heading */
            font-size: 28px;
            margin-bottom: 20px;
        }

        /* Table Styling */
        table.styled-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #f9f9f9; /* Light background color */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        table.styled-table th, table.styled-table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table.styled-table th {
            background-color: #5072A7; /* Green background for headers */
            color: white; /* White text color for headers */
        }

        table.styled-table tr:nth-child(even) {
            background-color: #f2f2f2; /* Light gray for alternate rows */
        }

        table.styled-table tr:hover {
            background-color: #ddd; /* Hover effect on rows */
        }

        /* Responsive Layout for smaller screens */
        @media screen and (max-width: 768px) {
            body {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
                position: relative;
            }
            .table-container {
                margin-left: 0;
                margin-top: 60px; /* Space for sidebar */
            }
        }
    </style>

</head>
<body>

<div class="table-container">
    <h2>View All Students</h2>
    <table class="styled-table">
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>DOB</th>
                <th>Department</th>
                <th>Email</th>
                <th>Gender</th>
                <th>Phone</th>
                <th>Username</th>
               
            </tr>
        </thead>
        <tbody>
            <c:forEach var="student" items="${students}">
                <tr>
                    <td>${student.studentId}</td>
                    <td>${student.studentName}</td>
                    <td>${student.dateOfBirth}</td>
                    <td>${student.department}</td>
                    <td>${student.email}</td>
                    <td>${student.gender}</td>
                    <td>${student.phone}</td>
                    <td>${student.username}</td>
                   
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
