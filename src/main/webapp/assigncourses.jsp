<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Assign Courses</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
            * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f8fa;
        }

        .navbar {
            height: 60px;
            display: flex;
            align-items: center;
            background: linear-gradient(135deg, #2c3e50, #16a085);
            color: white;
            padding: 0 20px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar h1 {
            font-size: 24px;
            font-weight: 600;
            animation: fadeSlideIn 1s ease-in-out;
        }

        .sidebar {
            position: fixed;
            top: 60px;
            left: 0;
            height: calc(100% - 60px);
            width: 220px;
            background: linear-gradient(135deg, #2c3e50, #16a085);
            border-radius: 0 20px 20px 0;
            color: white;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar a {
            padding: 15px 20px;
            color: white;
            text-decoration: none;
            font-size: 16px;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: background 0.3s ease, padding-left 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #028a87;
            padding-left: 30px;
        }

        .container {
            margin-left: 240px;
            padding: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #eef4fa;
            min-height: calc(100vh - 60px);
        }

        .container h2 {
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            width: 100%;
            max-width: 400px;
        }

        .form-group label {
            font-size: 16px;
            color: #333;
            margin-bottom: 8px;
        }

        .form-group select {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }

        .form-group select:focus {
            border-color: #16a085;
            outline: none;
        }

        .form-group button {
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #16a085;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-group button:hover {
            background-color: #12876f;
        }

        .message {
            margin-top: 20px;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
        }

        .message.success {
            background-color: #d4edda;
            color: #155724;
        }

        .message.failure {
            background-color: #f8d7da;
            color: #721c24;
        }

        @keyframes fadeSlideIn {
            0% {
                opacity: 0;
                transform: translateX(-50%);
            }
            100% {
                opacity: 1;
                transform: translateX(0);
            }
        }
    
    </style>
</head>
<body>
<div class="navbar">
    <h1>Learning Management System</h1>
</div>
<div class="sidebar">
    <a href="/admin/dashboard"><i class="fas fa-tachometer-alt"></i>Dashboard</a>
    <a href="instructorhome"><i class="fas fa-chalkboard-teacher"></i> Instructor</a>
    <a href="studenthome"><i class="fas fa-user-graduate"></i> Student</a>
    <a href="coursehome"><i class="fas fa-book"></i> Courses</a>
    <a href="coursemappinghome"><i class="fas fa-project-diagram"></i> Course Mappings</a>
    <a href="#"><i class="fas fa-comment"></i> Feedback</a>
    <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>
    <div class="container">
        <h2>Assign Course to Instructor</h2>
        <form action="/admin/assigncourse" method="post">
            <div class="form-group">
                <label for="courseCode">Course Code</label>
                <select id="courseCode" name="courseCode" required>
                <option value="">--Select--</option>
                    <c:forEach items="${courses}" var="course">
                        <option value="${course.courseCode}">${course.courseCode} - ${course.courseName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="instructorId">Instructor</label>
                <select id="instructorId" name="instructorId" required>
                <option value="">--Select--</option>
                    <c:forEach items="${instructors}" var="instructor">
                        <option value="${instructor.id}">${instructor.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <button type="submit">Assign Course</button>
            </div>
        </form>
      <c:if test="${status == 'confirmation'}">
    <div class="message failure">
        ${message}
        <form action="/admin/assigncourse" method="post">
            <input type="hidden" name="courseCode" value="${courseCode}" />
            <input type="hidden" name="instructorId" value="${instructorId}" />
            <input type="hidden" name="confirmUpdate" value="true" />
            <button type="submit">Yes, Reassign</button>
        </form>
        <a href="/admin/assigncourses">No, Go Back</a>
    </div>
</c:if>
      <c:if test="${status == 'failure'}">
    <div class="message failure">
        ${message}
    </div>
</c:if>
      
    </div>
</body>
</html>
