<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Submit Assignment</title>
</head>
<body>
    <h2>Submit Your Assignment</h2>

    <!-- Display Success Message -->
    <c:if test="${not empty successMessage}">
        <div style="color: green;">${successMessage}</div>
    </c:if>

    <!-- Display Error Message -->
    <c:if test="${not empty errorMessage}">
        <div style="color: red;">${errorMessage}</div>
    </c:if>

    <!-- Form to Upload Assignment -->
    
    <form action="/student/submitassignment" method="POST" enctype="multipart/form-data">
    

        <label for="studentassignmentupload">Select Assignment File:</label>
        <input type="file" id="studentassignmentupload" name="studentassignmentupload" required><br><br>
        <input type="submit" value="Submit Assignment">
    </form>
</body>
</html>
