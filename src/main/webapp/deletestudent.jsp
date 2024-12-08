<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .table-container {
            margin: 30px auto;
            width: 95%;
            max-width: 1200px;
            background-color: #ffffff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
            padding: 20px;
        }

        .styled-table {
            border-collapse: collapse;
            width: 100%;
            margin: 20px 0;
            font-size: 16px;
            text-align: left;
        }

        .styled-table thead tr {
            background-color: #3498db;
            color: white;
        }

        .styled-table th, .styled-table td {
            padding: 12px 18px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .styled-table tbody tr:nth-of-type(even) {
            background-color: #f9f9f9;
        }

        .styled-table tbody tr:hover {
            background-color: #f1f1f1;
            cursor: pointer;
        }

        .delete-icon {
            color: #e74c3c;
            font-size: 18px;
            cursor: pointer;
        }
    </style>
    <script>
        function confirmDelete(id) {
            if (confirm("Are you sure you want to delete this student?")) {
                window.location.href = '/admin/deleteStudent/' + id;
            }
        }
    </script>
</head>
<body>
<%@ include file="admin_studenthome.jsp" %>
    <div class="table-container">
        <h2>Student List</h2>
        <table class="styled-table">
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}">
			    <tr>
			        <td>${student.studentId}</td> <!-- Use 'studentId' -->
			        <td>${student.studentName}</td>
			        <td>
			            <i class="fas fa-trash delete-icon" onclick="confirmDelete(${student.studentId})"></i> <!-- Use 'studentId' -->
			        </td>
			    </tr>
			</c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
