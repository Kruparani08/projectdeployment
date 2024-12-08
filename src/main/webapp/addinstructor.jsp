<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Instructor</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
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
        .form-group select,
        .form-group textarea {
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
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: #3182ce;
            box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.3);
            outline: none;
        }

        .form-group input[type="file"] {
            padding: 10px;
            background-color: #e6eff8;
            border: 1px dashed #90cdf4;
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

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-container {
                width: 80%;
            }
            .form-container h2 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>
<%@ include file="admin_instructorhome.jsp" %>
<div style="text-align: center; margin-top: 20px;">
    <c:if test="${not empty message}">
        <div style="color: green; font-weight: bold;">${message}</div>
    </c:if>
</div>

<div class="form-container">
    <h2>Add Instructor</h2>
    <form action="/admin/insertinstructor" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="id">Instructor ID:</label>
            <input type="number" id="id" name="id" required>
        </div>
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="" disabled selected>Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <div class="form-group">
            <label for="joiningDate">Joining Date:</label>
            <input type="date" id="joiningDate" name="joiningDate" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="contact">Contact:</label>
            <input type="tel" id="contact" name="contact" required>
        </div>
        <div class="form-group">
            <label for="department">Department:</label>
            <input type="text" id="department" name="department" required>
        </div>
        <div class="form-group">
            <label for="designation">Designation:</label>
            <input type="text" id="designation" name="designation" required>
        </div>
        <div class="form-group">
            <label for="salary">Salary:</label>
            <input type="number" step="0.01" id="salary" name="salary" required>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <textarea id="address" name="address" rows="3" required></textarea>
        </div>
        <div class="form-group">
            <button type="submit">Add Instructor</button>
        </div>
    </form>
</div>
</body>
</html>
