
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>
     <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f3f4f6, #e9ebee);
            margin: 0;
            padding: 0;
        }

        .navbar {
            background: linear-gradient(135deg, #2c3e50, #16a085);
            color: white;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #ffffff;
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

        .main-content {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            animation: scaleIn 0.8s ease-in-out;
        }

        @keyframes scaleIn {
            0% {
                transform: scale(0.9);
                opacity: 0.8;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        h2 {
            color: #333;
            font-size: 1.75rem;
            margin-bottom: 20px;
            text-align: center;
            border-bottom: 2px solid #4CAF50;
            display: inline-block;
            padding-bottom: 5px;
        }

        .table th {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            border: none;
        }

        .table th, .table td {
            vertical-align: middle;
            padding: 15px;
            border-bottom: 1px solid #eaeaea;
        }

        input[type="text"], input[type="email"], textarea {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 10px;
            font-size: 1rem;
            width: 100%;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="email"]:focus, textarea:focus {
            border-color: #4CAF50;
            outline: none;
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
        }

        .readonly {
            background-color: #f9f9f9;
            color: #777;
            pointer-events: none;
        }

        .btn-primary {
            background-color: #4CAF50;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #087f23;
        }

        .list-group-item {
            font-size: 1.2rem;
            padding: 10px 15px;
            display: flex;
            align-items: center;
            background-color: #f9f9f9;
            margin-bottom: 5px;
            border-radius: 8px;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .list-group-item:hover {
            transform: translateX(10px);
            background-color: #e8f5e9;
        }

        .list-group-item i {
            margin-right: 10px;
            color: #4CAF50;
        }

        .success-message, .error-message {
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .success-message {
            background-color: #d4edda;
            color: #155724;
        }

        .error-message {
            background-color: #f8d7da;
            color: #721c24;
        }
        .save-button {
    display: flex;
    justify-content: center; /* Centers horizontally */
    align-items: center;    /* Centers vertically */
    margin-top: 20px;
    color: green;
}
        
    </style>
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Student Profile</a>
    </div>
</nav>

<div class="main-content">
    <!-- Display Success Message -->
    <c:if test="${not empty successMessage}">
        <div class="success-message">${successMessage}</div>
    </c:if>

    <!-- Display Error Message if any -->
    <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
    </c:if>

    <h2>Student Details</h2>
    <form action="/student/update" method="post" enctype="multipart/form-data">
    <input type="hidden" name="studentId" value="${student.studentId}" />
        <table class="table table-borderless">
            
           <!-- <table class="table table-bordered"> -->
    <tr>
        <th>Student ID</th>
        <td><input type="text" name="studentId" class="form-control" value="${student.studentId}" readonly /></td>
    </tr>
    <tr>
        <th>Name</th>
        <td><input type="text" name="studentName" class="form-control" value="${student.studentName}" /></td>
    </tr>
    <tr>
        <th>Email</th>
        <td><input type="email" name="email" class="form-control" value="${student.email}" /></td>
    </tr>
    <tr>
        <th>Phone</th>
        <td><input type="text" name="phone" class="form-control" value="${student.phone}" /></td>
    </tr>
    <tr>
        <th>Date of Birth</th>
        <td><input type="date" name="dateOfBirth" class="form-control" value="${student.dateOfBirth}" /></td>
    </tr>
    <tr>
        <th>Gender</th>
        <td><input type="text" name="gender" class="form-control" value="${student.gender}" /></td>
    </tr>
    <tr>
        <th>Department</th>
        <td><input type="text" name="department" class="form-control" value="${student.department}" /></td>
    </tr>
    <tr>
        <th>Profile Image</th>
        <td>
            <img src="data:image/png;base64,${student.base64Image}" 
                 alt="Student Image" 
                 style="width: 150px; height: 150px; border-radius: 50%; object-fit: cover;">
            <br>
            
            <input type="file" name="image" class="form-control mt-2">
        </td>
    </tr>
</table>

		 <div class="save-button">
            <button type="submit" align="center">Save</button>
        </div>

    </form>

    
</div>
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

