<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Details</title>
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
            justify-content: space-between;
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

        .back-button {
            font-size: 14px;
            color: white;
            background: none;
            border: 1px solid white;
            padding: 5px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .back-button:hover {
            background: white;
            color: #2c3e50;
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

        .main-content {
            background: #e3f2fd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 700px;
            text-align: center;
            margin: 30px auto;
        }

        .main-content h2 {
            font-size: 24px;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 15px;
            background: linear-gradient(90deg, #2c3e50, #16a085);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .main-content p {
            font-size: 16px;
            line-height: 1.5;
            color: #546e7a;
        }

        .cta-button {
            margin-top: 15px;
            padding: 10px 25px;
            font-size: 14px;
            font-weight: bold;
            color: white;
            background: linear-gradient(135deg, #16a085, #2c3e50);
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
        }

        .cta-button:hover {
            background: linear-gradient(135deg, #2c3e50, #16a085);
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Learning Management System</h1>
        <button class="back-button" onclick="history.back();">Back</button>
    </div>
    <div class="main-content">
        <h2>${assignedCourse}</h2>
		<p>
		    Welcome to your assigned course. As an instructor, ensure that quizzes and assignments are thoughtfully assigned and structured 
		    to provide students with precise and productive learning material. Your guidance will help students achieve their academic goals effectively.
		</p>
        <button class="cta-button" onclick="location.href='/instructor/${instructorId}/quiz/uploads';">Quizes</button>
		<button class="cta-button" onclick="location.href='/instructor/${instructorId}/uploadAssignments';">Assignments</button>
       <button class="cta-button" onclick="location.href='/instructor/learningmaterials';">Learning Materials</button>
    </div>
</body>
</html>