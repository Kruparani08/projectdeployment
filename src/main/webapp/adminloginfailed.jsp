<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Failed</title>
<style>
    /* General Reset */
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
        background: linear-gradient(135deg, #ff4b5c, #b8001c);
        color: #fff;
    }

    .container {
        text-align: center;
        background: #ffffff;
        color: #2c3e50;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        width: 100%;
        max-width: 400px;
    }

    h1 {
        font-size: 22px;
        margin-bottom: 10px;
        color: #e74c3c;
    }

    p {
        font-size: 16px;
        margin-bottom: 20px;
    }

    .button {
        display: inline-block;
        padding: 12px 20px;
        font-size: 16px;
        font-weight: bold;
        color: #fff;
        background: linear-gradient(135deg, #16a085, #1abc9c);
        border: none;
        border-radius: 6px;
        text-decoration: none;
        cursor: pointer;
        transition: background 0.3s ease, transform 0.2s;
    }

    .button:hover {
        background: linear-gradient(135deg, #1abc9c, #16a085);
        transform: translateY(-3px);
    }

    .message {
        font-size: 16px;
        color: #e74c3c;
        margin-bottom: 20px;
        font-weight: bold;
    }

    @media (max-width: 480px) {
        .container {
            padding: 20px;
        }

        h1 {
            font-size: 20px;
        }

        .button {
            font-size: 14px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Login Failed</h1>
        <p class="message"><c:out value="${message}"></c:out></p>
        <a href="login" class="button">Try Again</a>
    </div>
</body>
</html>
