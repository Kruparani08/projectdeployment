<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        display: flex;
        min-height: 100vh;
        background: #dfe9f3; /* Complementary body gradient */
        color: #333;
    }

    .sidebar {
        width: 120px;
        background: linear-gradient(135deg, #2c3e50, #16a085); /* Sidebar gradient remains */
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px 0;
        box-shadow: 2px 0 12px rgba(0, 0, 0, 0.3);
        border-radius: 0 15px 15px 0;
        position: fixed;
        top: 0;
        bottom: 0;
    }

    .sidebar-icon {
        width: 100px;
        padding: 12px;
        margin: 10px 0;
        text-align: center;
        color: #ffffff;
        background-color: transparent;
        border: none;
        font-size: 14px;
        font-weight: 600;
        border-radius: 12px;
        cursor: pointer;
        text-decoration: none;
        display: flex;
        flex-direction: column;
        align-items: center;
        transition: all 0.3s ease;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .sidebar-icon i {
        font-size: 20px;
        margin-bottom: 8px;
    }

    .sidebar-icon:hover {
        background-color: #1abc9c; /* Consistent hover color from body gradient */
        color: #ffffff;
        transform: scale(1.1);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    }

    .back-button {
        width: 100px;
        padding: 12px;
        margin-top: 30px;
        text-align: center;
        color: #ffffff;
        background-color: transparent;
        border: none;
        font-size: 16px;
        font-weight: 600;
        border-radius: 12px;
        cursor: pointer;
        text-decoration: none;
        display: flex;
        flex-direction: column;
        align-items: center;
        transition: all 0.3s ease;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .back-button i {
        font-size: 24px;
        margin-bottom: 8px;
    }

    .back-button:hover {
        background-color: #1abc9c; /* Consistent hover color */
        color: #ffffff;
        transform: scale(1.1);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    }

    /* Smooth transition for all hover effects */
    .sidebar-icon, .back-button {
        transition: transform 0.3s ease, background-color 0.3s ease, color 0.3s ease, box-shadow 0.3s ease;
    }

    /* Mobile responsiveness */
    @media (max-width: 768px) {
        .sidebar {
            width: 80px; /* Adjust for mobile */
        }

        .sidebar-icon {
            width: 70px;
            font-size: 12px;
        }

        .sidebar-icon i {
            font-size: 16px;
        }

        .back-button {
            width: 70px;
            font-size: 14px;
        }

        .back-button i {
            font-size: 18px;
        }
    }
</style>

</head>
<body>
    <div class="sidebar">
        <a href="addcourses" class="sidebar-icon">
            <i class="fas fa-plus-circle"></i>
            Add Course
        </a>
        <a href="viewallcourses" class="sidebar-icon">
            <i class="fas fa-eye"></i>
            View Courses
        </a>
        <a href="updatecourse" class="sidebar-icon">
            <i class="fas fa-edit"></i>
            Update Course
        </a>
        <a href="deletecourse" class="sidebar-icon">
            <i class="fas fa-trash-alt"></i>
            Delete Course
        </a>

        <a href="adminhome" class="back-button">
            <i class="fas fa-arrow-left"></i>
            Back
        </a>
    </div>
    
</body>
</html>
