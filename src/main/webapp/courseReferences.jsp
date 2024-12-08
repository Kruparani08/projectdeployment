<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course List</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
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
    background: linear-gradient(135deg, #2c3e50, #16a085);
    color: white;
    padding: 0 20px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.navbar h1 {
    font-size: 24px;
    font-weight: 600;
    animation: fadeSlideIn 1s ease-in-out;
    margin-right: auto; /* Ensure the title stays to the left */
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
    margin-left: auto; /* This moves the back button to the right */
}

.back-button:hover {
    background: white;
    color: #2c3e50;
}

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 20px;
        }

        .card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin: 20px;
            width: 250px;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.15);
        }

        .card img {
            width: 100%;
            height: 150px;
            border-radius: 10px 10px 0 0;
        }

        .card-body {
            padding: 15px;
            text-align: center;
        }

        .card-body h3 {
            margin: 0;
            color: #333;
            font-size: 18px;
            font-weight: 500;
        }

        .card-body p {
            font-size: 14px;
            color: #777;
            margin: 10px 0 0;
        }

        .card-body h3, .card-body p {
            transition: color 0.3s ease;
        }

        .card:hover .card-body h3 {
            color: #007BFF;
        }

        .card:hover .card-body p {
            color: #555;
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
        <button class="back-button" onclick="history.back();">Back</button>
    </div>
    <div class="container">
        <div class="card" onclick="window.location.href='https://youtu.be/h7PW4R5ym1Y?si=0BO6NN9AFwWzfg9t'">
            <img src="data:image/png;base64,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" alt="Course 1">
            <div class="card-body">
                <h3>Course 1: HTML Basics</h3>
                <p>Learn the fundamentals of HTML.</p>
            </div>
        </div>

        <div class="card" onclick="window.location.href='https://youtu.be/Fa_zR61I4js?si=RBGYx1D0i_mBmFyq'">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEdJnqNzdGTamq-mSLUs9bOKQBKw8RL9WcPw&s" alt="Course 2">
            <div class="card-body">
                <h3>Course 2: C Programming</h3>
                <p>Explore C Programming </p>
            </div>
        </div>

        <div class="card" onclick="window.location.href='https://youtu.be/uoJ2jGxp9NE?si=0ArNWPj-HeUYSZSB'">
            <img src="data:image/png;base64,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" alt="Course 3">
            <div class="card-body">
                <h3>Course 3: Probability Statistics</h3>
                <p>Introduction to probability and statistics.</p>
            </div>
        </div>

        <div class="card" onclick="window.location.href='https://youtu.be/xJFhp2t2fJA?si=zxiJF6-M9YTBwmrp'">
            <img src="data:image/png;base64,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" alt="Course 4">
            <div class="card-body">
                <h3>Course 4: AWS - CP</h3>
                <p>Start learning AWS with CP.</p>
            </div>
        </div>
        
        <div class="card" onclick="window.location.href='https://youtu.be/1KYx08hdHZ8?si=Z0wP6YgXUwV8ScCo'">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgJp-ENg3WgrIrRSCvDi-R5Ntn2VvQgEdrLQ&s">
            <div class="card-body">
                <h3>Course 4:ATFL</h3>
                <p>Automata Theory and Formal Languages.</p>
            </div>
        </div>
    </div>

</body>
</html>
