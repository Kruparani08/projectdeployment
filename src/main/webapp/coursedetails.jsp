<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Course Details</title>
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
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Navbar Styling */
        .navbar {
            width: 100%;
            background: linear-gradient(135deg, #16a085, #1abc9c);
            color: #fff;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .navbar h1 {
            font-size: 22px;
            font-weight: 600;
            margin: 0;
        }

        .back-button {
            background: none;
            border: 2px solid #fff;
            color: #fff;
            padding: 8px 16px;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease, color 0.3s ease;
        }

        .back-button:hover {
            background: #fff;
            color: #1abc9c;
        }

        /* Container Styling */
        .container {
            background: #fff;
            width: 90%;
            max-width: 600px;
            margin: 120px auto 0; /* Adjust margin for fixed navbar */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            font-size: 28px;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            color: #555;
            margin-bottom: 30px;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .button {
            flex: 1;
            text-align: center;
            padding: 10px 10px;
            font-size: 16px;
            font-weight: 500;
            text-decoration: none;
            color: #fff;
            background: linear-gradient(135deg, #3498db, #2ecc71);
            border-radius: 8px;
            transition: all 0.3s ease-in-out;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.15);
        }

        .button:hover {
            background: linear-gradient(135deg, #2980b9, #27ae60);
            transform: scale(1.05);
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2);
        }

        .button:active {
            transform: scale(0.95);
        }

        @media (max-width: 500px) {
            .button-group {
                flex-direction: column;
            }

            .button {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h1>Learning Management System</h1>
        <button class="back-button" onclick="history.back();">Back</button>
    </div>

    <!-- Course Details Container -->
    <div class="container">
        <h1>${course.courseName}</h1>
        <p>Welcome to the course: ${course.courseName} (${course.courseCode})</p>
        <div class="button-group">
            <a href="submitassignment?courseCode=${course.courseCode}" class="button">Submit Assignment</a>
            <a href="quizzes?courseCode=${course.courseCode}" class="button">Quizzes</a>
            <a href="learningmaterials?courseCode=${course.courseCode}" class="button">Learning Materials</a>
        </div>
    </div>
</body>
</html>
