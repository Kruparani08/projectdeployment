<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Courses</title>
    <link rel="stylesheet" href="styles.css"> <!-- Add your CSS link here -->
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f8fa;
            color: #333;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
        }

        /* Main Content */
        .main-content {
            margin-top: 20px;
            text-align: center;
            width: 100%;
        }

        .main-content h2 {
            font-size: 28px;
            color: #16a085;
            margin-bottom: 20px;
            animation: fadeSlideIn 1.2s ease-in-out;
        }

        /* Card Container */
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        /* Individual Course Card */
        .course-card {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .course-card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .course-card h3 {
            font-size: 20px;
            color: #333;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .course-card a {
            text-decoration: none;
            color: #16a085;
            font-size: 16px;
            font-weight: bold;
        }

        .course-card a:hover {
            color: #1abc9c;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .course-card {
                width: 90%;
            }
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

    <div class="main-content">
        <h2>Available Courses</h2>
        
        <div class="card-container">
            <c:forEach var="course" items="${courses}">
                <div class="course-card">
                    <!-- Update link to assignedcoursesstudent.jsp and pass courseCode as a query parameter -->
                    <h3><a href="assignedcoursesstudent.jsp?courseCode=${course.courseCode}">${course.courseCode} - ${course.courseName}</a></h3>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
