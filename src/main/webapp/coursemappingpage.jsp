<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Course Mapping</title>
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

        .container h1 {
            font-size: 32px;
            color: #333;
            margin-bottom: 30px;
            text-align: center;
        }

        .button-group {
            display: flex;
            gap: 20px;
        }

        .button {
            display: inline-block;
            padding: 15px 30px;
            font-size: 18px;
            color: white;
            text-decoration: none;
            background-color: #16a085;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .button:hover {
            background-color: #12876f;
            transform: scale(1.05);
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
    <a href="#"><i class="fas fa-home"></i> Home</a>
    <a href="instructorhome"><i class="fas fa-chalkboard-teacher"></i> Instructor</a>
    <a href="studenthome"><i class="fas fa-user-graduate"></i> Student</a>
    <a href="coursehome"><i class="fas fa-book"></i> Courses</a>
    <a href="coursemappinghome"><i class="fas fa-project-diagram"></i> Course Mappings</a>
    <a href="#"><i class="fas fa-comment"></i> Feedback</a>
    <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>
<div class="container">
    <h1>Select Mapping Type</h1>
    <div class="button-group">
        <a href="assigncourses" class="button">Instructor Course Mapping</a>
        <a href="#" class="button">Student Course Mapping</a>
    </div>
</div>
</body>
</html>
