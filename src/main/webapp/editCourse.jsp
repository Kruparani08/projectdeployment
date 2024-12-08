<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Course</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        /* Use the same styles as your Add Course page */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
        }

        .form-container {
            width: 40%;
            max-width: 700px;
            margin: 50px auto;
            background: linear-gradient(135deg, #ffffff, #f7f9fc);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            border: 1px solid #e3e8f0;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #1a202c;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #2d3748;
            font-size: 15px;
            letter-spacing: 0.3px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e0;
            border-radius: 8px;
            font-size: 15px;
            color: #2d3748;
            background-color: #edf2f7;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #3182ce;
            box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.3);
            outline: none;
        }

        .form-group button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #3182ce, #63b3ed);
            color: white;
            font-size: 16px;
            font-weight: 600;
            text-transform: uppercase;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        .form-group button:hover {
            background: linear-gradient(135deg, #2b6cb0, #4299e1);
            transform: translateY(-2px);
        }

        .form-group button:active {
            background: linear-gradient(135deg, #2c5282, #2b6cb0);
            transform: translateY(0);
        }
        
        @media (max-width: 768px) {
            .form-container {
                width: 80%;
            }

            .form-container h2 {
                font-size: 22px;
            }
        }
    </style>
    <script>
        function calculateCredits() {
            const l = parseFloat(document.getElementById("lectureHours").value) || 0;
            const t = parseFloat(document.getElementById("tutorialHours").value) || 0;
            const p = parseFloat(document.getElementById("practicalHours").value) || 0;
            const s = parseFloat(document.getElementById("skillHours").value) || 0;

            const credits = (1 * l) + (1 * t) + (0.5 * p) + (0.25 * s);
            document.getElementById("credits").value = credits.toFixed(2);
        }
    </script>
</head>
<body>
<%@ include file="coursehome.jsp" %>
<div class="form-container">
    <h2>Update Course</h2>
    <form action="/admin/updateCourse" method="post">
        <input type="hidden" id="courseCode" name="courseCode" value="${course.courseCode}">
        <div class="form-group">
            <label for="courseName">Course Name</label>
            <input type="text" id="courseName" name="courseName" value="${course.courseName}" required>
        </div>
        <div class="form-group">
            <label for="department">Department</label>
            <input type="text" id="department" name="department" value="${course.department}" required>
        </div>
        <div class="form-group">
            <label for="instructorName">Instructor Name</label>
            <input type="text" id="instructorName" name="instructorName" value="${course.instructorName}" required>
        </div>
        <div class="form-group">
            <label for="lectureHours">Lecture Hours (L)</label>
            <input type="number" id="lectureHours" name="lectureHours" value="${course.lectureHours}" oninput="calculateCredits()" required>
        </div>
        <div class="form-group">
            <label for="tutorialHours">Tutorial Hours (T)</label>
            <input type="number" id="tutorialHours" name="tutorialHours" value="${course.tutorialHours}" oninput="calculateCredits()" required>
        </div>
        <div class="form-group">
            <label for="practicalHours">Practical Hours (P)</label>
            <input type="number" id="practicalHours" name="practicalHours" value="${course.practicalHours}" oninput="calculateCredits()" required>
        </div>
        <div class="form-group">
            <label for="skillHours">Skill Hours (S)</label>
            <input type="number" id="skillHours" name="skillHours" value="${course.skillHours}" oninput="calculateCredits()" required>
        </div>
        <div class="form-group">
            <label for="credits">Credits</label>
            <input type="text" id="credits" name="credits" value="${course.credits}" readonly>
        </div>
        <div class="form-group">
            <button type="submit">Update Course</button>
        </div>
    </form>
</div>
</body>
</html>
