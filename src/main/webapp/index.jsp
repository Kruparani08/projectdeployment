<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Learning Management System</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background: linear-gradient(135deg, #2c3e50, #16a085);
        color: #fff;
    }

    .container {
        text-align: center;
        padding: 40px;
        background-color: #ffffff;
        color: #2c3e50;
        border-radius: 12px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        width: 100%;
        max-width: 400px;
    }

    h1 {
        font-size: 24px;
        margin-bottom: 20px;
        font-weight: bold;
        color: #2c3e50;
    }

    .button {
        display: inline-block;
        width: 100%;
        max-width: 320px;
        padding: 15px;
        margin: 12px 0;
        font-size: 16px;
        font-weight: bold;
        color: #ffffff;
        background: linear-gradient(135deg, #16a085, #1abc9c);
        border: none;
        border-radius: 8px;
        cursor: pointer;
        text-decoration: none;
        text-align: center;
        transition: background 0.3s ease, transform 0.2s;
    }

    .button:hover {
        background: linear-gradient(135deg, #1abc9c, #16a085);
        transform: translateY(-3px);
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
    }

    @media (max-width: 480px) {
        .container {
            padding: 30px;
        }

        h1 {
            font-size: 20px;
        }

        .button {
            font-size: 14px;
            padding: 12px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Welcome to the Learning Management System</h1>
        <a href="admin/login" class="button">Admin Login</a>
        <a href="instructor/login" class="button">Instructor Login</a>
        <a href="student/login" class="button">Student Login</a>
    </div>
</body>
</html>
