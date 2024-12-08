<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assigned Courses</title>
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
	    border-radius: 0px 0px 20px;
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
	
	.main-content {
	    margin-left: 220px;
	    padding: 20px;
	    background-color: #eef4fa;
	    height: calc(100vh - 60px);
	    overflow-y: auto;
	}
	
	.main-content h2 {
	    font-size: 28px;
	    color: #333;
	    margin-bottom: 15px;
	    text-align: center;
	}
	
	.card-container {
	    display: flex;
	    flex-wrap: wrap;
	    gap: 20px;
	    justify-content: flex-start; /* Aligning the courses to the left */
	    margin-left: 10px; /* Optional: Slight margin for spacing */
	}
	
	.course-card {
	    background-color: #f0f4f7; /* New background color */
	    border: 1px solid #ddd;
	    border-radius: 8px;
	    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	    width: 300px;
	    padding: 15px;
	    box-sizing: border-box;
	    transition: transform 0.3s, box-shadow 0.3s;
	}
	
	.course-card:hover {
	    transform: translateY(-5px);
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	}
	
	.course-card h3 {
	    margin: 0;
	    margin-bottom: 10px;
	    color: #2c3e50; /* Darker color for course name */
	    font-size: 20px; /* Increased size */
	    font-weight: 600;
	}
	
	.course-card h3 a {
	    text-decoration: none;
	    color: #2c3e50;
	}
	
	.course-card h3 a:hover {
	    text-decoration: underline;
	    color: #16a085; /* Color change on hover */
	}
	
	.course-card p {
	    margin: 5px 0;
	    color: #555;
	    font-size: 14px;
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
        <a href="/instructor/dashboard"><i class="fas fa-tachometer-alt"></i>Dashboard</a>
        <a href="/instructor/${instructorId}/profile"><i class="fas fa-user"></i> My Profile</a>
         <a href="/instructor/viewallstudents"><i class="fas fa-user-graduate"></i> Student</a>
        <a href="/instructor/${instructorId}/courses"><i class="fas fa-book"></i> Courses</a>
        <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
    <div class="main-content">
        <h2>Assigned Courses</h2>
        <div class="card-container">
            <c:forEach var="course" items="${courses}">
                <div class="course-card">
                    <h3>
                        <a href="assignedcoursedetails?courseCode=${course.courseCode}">
                            <c:out value="${course.courseName}"/>
                        </a>
                    </h3>
                    <p><strong>Course Code:</strong> <c:out value="${course.courseCode}"/></p>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
