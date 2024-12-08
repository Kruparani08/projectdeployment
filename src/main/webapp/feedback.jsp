<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #f5f7fa;
            font-family: 'Roboto', sans-serif;
        }
        .container {
            max-width: 700px;
            margin: auto;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        h1, h2 {
            color: #333333;
        }
        .btn-primary {
            background-color: #3f51b5;
            border-color: #3f51b5;
        }
        .btn-primary:hover {
            background-color: #303f9f;
            border-color: #303f9f;
        }
        table thead {
            background-color: #3f51b5;
            color: #ffffff;
        }
        table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .form-label {
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Admin Feedback Management</h1>

        <!-- Add New Question -->
        <div class="p-4 mb-4" style="background: #f8f9fa; border: 1px solid #ddd; border-radius: 8px;">
            <form action="${pageContext.request.contextPath}/admin/addFeedbackQuestion" method="post">
                <div class="mb-3">
                    <label for="questionText" class="form-label">Question Text</label>
                    <input type="text" class="form-control" id="questionText" name="questionText" placeholder="Enter the question" required>
                </div>
                <div class="mb-3">
                    <label for="questionType" class="form-label">Question Type</label>
                    <select id="questionType" name="questionType" class="form-select" required>
                        <option value="text">Text</option>
                        <option value="radio">Multiple Choice (Single Option)</option>
                        <option value="checkbox">Multiple Choice (Multiple Options)</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="options" class="form-label">Options (comma-separated, for multiple-choice only)</label>
                    <input type="text" class="form-control" id="options" name="options" placeholder="E.g., Excellent, Good, Average, Poor">
                </div>
                <button type="submit" class="btn btn-primary w-100">Add Question</button>
            </form>
        </div>

        <!-- List Existing Questions -->
        <h2>Existing Feedback Questions</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Question</th>
                        <th>Type</th>
                        <th>Options</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Dynamically Added Questions -->
                    <c:forEach var="question" items="${questions}">
                        <tr>
                            <td>${question.id}</td>
                            <td>${question.text}</td>
                            <td>${question.type}</td>
                            <td>${question.options}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/admin/deleteFeedbackQuestion" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${question.id}">
                                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>