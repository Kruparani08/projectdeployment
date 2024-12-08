<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: #e3f2fd;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .navbar {
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: linear-gradient(135deg, #34495e, #1abc9c);
            color: white;
            padding: 0 20px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            z-index: 10;
        }

        .navbar h1 {
            font-size: 24px;
            font-weight: 600;
        }

        .sidebar {
            position: fixed;
            top: 60px;
            left: 0;
            height: calc(100% - 60px);
            width: 220px;
            background: linear-gradient(135deg, #34495e, #1abc9c);
            color: white;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
            z-index: 10;
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
            background-color: #16a085;
            padding-left: 30px;
        }

        .main-content {
            margin-left: 220px;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 60px);
            overflow: hidden;
        }

        .main-content img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            position: absolute;
            z-index: 1;
            filter: blur(4px);
        }

        .main-content .overlay-text {
            position: absolute;
            z-index: 2;
            color: black; 
            text-align: center;
            background-color: rgba(255, 255, 255, 0.7); 
            padding: 20px 40px;
            border-radius: 10px; 
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.3); 
        }

        .main-content h2 {
            font-size: 48px;
            margin-bottom: 20px;
            font-weight: 700; 
        }

        .main-content p {
            font-size: 24px;
        }

        @media screen and (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                flex-direction: row;
                justify-content: space-around;
                box-shadow: none;
            }

            .main-content {
                margin-left: 0;
                height: calc(100vh - 120px);
            }

            .main-content h2 {
                font-size: 32px;
            }

            .main-content p {
                font-size: 18px;
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
        <a href="feedback"><i class="fas fa-comment"></i> Feedback</a>
        <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
    <div class="main-content">
        <img src="https://media.istockphoto.com/id/1451316016/photo/lms-learning-management-system-for-lesson-and-online-education-course-application-study-e.jpg?s=612x612&w=0&k=20&c=fRH0AanVP3IkjZtYNwJiyALkAvN3plLtrcPd1L2MrJo=" alt="Learning Management System">
        <div class="overlay-text">
            <h2>Welcome to the Admin Home Page</h2>
            <p>Manage the system efficiently, view courses, and access student details.</p>
        </div>
    </div>
</body>
</html>
