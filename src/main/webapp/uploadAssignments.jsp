<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Assignment</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
         * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f8fa;
        }

        .navbar {
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: space-between;
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

        .back-button {
            font-size: 14px;
            color: white;
            background: none;
            border: 1px solid white;
            padding: 5px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .back-button:hover {
            background: white;
            color: #2c3e50;
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
            padding: 20px;
            background-color: #eef4fa;
            height: calc(100vh - 60px);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .main-content h2 {
            font-size: 28px;
            color: #333;
            margin-bottom: 15px;
        }

        .container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            width: 500px;
            box-sizing: border-box;
            margin-top: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-size: 14px;
            color: #2d3748;
            margin-bottom: 8px;
            display: block;
        }

        input[type="text"], textarea, input[type="file"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #cbd5e0;
            border-radius: 8px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.3s ease, background-color 0.3s ease;
        }

        input[type="text"]:focus, textarea:focus, input[type="file"]:focus {
            border-color: #3182ce;
            outline: none;
            background-color: #ffffff;
        }

        textarea {
            resize: vertical;
        }

        button[type="submit"] {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #3182ce, #63b3ed);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            text-transform: uppercase;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        button[type="submit"]:hover {
            background: linear-gradient(135deg, #2b6cb0, #4299e1);
            transform: translateY(-2px);
        }

        button[type="submit"]:active {
            background: linear-gradient(135deg, #2c5282, #2b6cb0);
            transform: translateY(0);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 80%;
            }

            .main-content h2 {
                font-size: 24px;
            }
        }
         
    </style>
</head>
<body>

    <div class="navbar">
        <h1>Learning Management System</h1>
        <button class="back-button" onclick="history.back();">Back</button>
    </div>
	
    <div class="main-content">
        <h2>Upload Assignment</h2>
        <div class="container">
            <form action="/instructor/${instructorId}/upload" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" id="title" name="title" placeholder="Enter assignment title" required>
                </div>

                <div class="form-group">
                    <label for="description">Description/Instructions:</label>
                    <textarea id="description" name="description" rows="5" placeholder="Enter assignment description" required></textarea>
                </div>

                <div class="form-group">
                    <label for="file">Select PDF File:</label>
                    <input type="file" id="file" name="file" accept="application/pdf" required>
                </div>

                <button type="submit">Upload Assignment</button>
            </form>
        </div>
    </div>

</body>
</html>
