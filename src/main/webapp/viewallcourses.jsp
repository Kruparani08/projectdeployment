<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Courses List</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    
    <style>
        /* General Body Styling */
        body {
            font-family: Arial, sans-serif;
            display: flex;
            margin: 0;
            padding: 0;
        }

        .sidebar {
            width: 250px; /* Sidebar width */
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
            margin-left: 130px; /* Offset for sidebar */
            padding: 20px;
            flex-grow: 1;
            overflow-y: auto;
             /* Space between table and top of the page */
        }

        /* Heading Styling */
        h2 {
            color: #002244; /* Green color */
            text-align: center; /* Center the heading */
            font-size: 28px;
            margin-top: 50px;
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
<%@ include file="coursehome.jsp" %>
<div class="class-container"><h2>View All Courses</h2>
<div class="table-container">
    <table class="styled-table">
        <thead>
    <tr>
        <th>Course Code</th>
        <th>Course Name</th>
        <th>Credits</th>
        <th>Department</th>
        <th>(L-T-P-S)</th>
        <th>Instructor Name</th> <!-- Added -->
        <th>Student Name</th>
        
    </tr>
</thead>
<tbody>
    <c:forEach items="${courselist}" var="c">
        <tr>
            <td><c:out value="${c.courseCode}" /></td>
            <td><c:out value="${c.courseName}" /></td>
            <td><c:out value="${c.credits}" /></td>
            <td><c:out value="${c.department}" /></td>
            <td><c:out value="${c.lectureHours} - ${c.tutorialHours} - ${c.practicalHours} - ${c.skillHours}" /></td>
            <td>
    <c:choose>
        <c:when test="${not empty c.instructor}">
            <c:out value="${c.instructor.name}" />
        </c:when>
        <c:otherwise>
            Unassigned
        </c:otherwise>
    </c:choose>
</td>

<td>
    <c:choose>
        <c:when test="${not empty course.students}">
            <c:forEach var="student" items="${course.students}">
                <span>${student.studentName}</span><br />
            </c:forEach>
        </c:when>
        <c:otherwise>
            Unassigned
        </c:otherwise>
    </c:choose>
</td>
            
        </tr>
    </c:forEach>
</tbody>
        
    </table>
</div>
</div>
</body>
</html>
