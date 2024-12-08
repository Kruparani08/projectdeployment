<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
            height: 100vh;
        }
        .background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url("https://media.istockphoto.com/id/1451316016/photo/lms-learning-management-system-for-lesson-and-online-education-course-application-study-e.jpg?s=612x612&w=0&k=20&c=fRH0AanVP3IkjZtYNwJiyALkAvN3plLtrcPd1L2MrJo=");
            background-size: cover;
            background-position: center;
            filter: blur(4px);
            z-index: -1;
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
            z-index: 10;
        }

        .navbar h1 {
            font-size: 26px;
            font-weight: 700;
        }

        .back-button {
            font-size: 14px;
            color: white;
            background: none;
            border: 1px solid white;
            padding: 6px 18px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .back-button:hover {
            background: white;
            color: #2c3e50;
        }

        .dashboard-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 60px);
            padding: 20px;
            z-index: 1;
        }

        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 30px;
            width: 100%;
            max-width: 1200px;
            z-index: 2;
        }

        .dashboard-card {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.12);
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .dashboard-card:hover {
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
            transform: translateY(-6px);
        }

        .dashboard-card i {
            font-size: 3.5rem;
            margin-bottom: 15px;
            color: white;
            transition: color 0.3s ease;
        }

        .dashboard-card:hover i {
            color: #16a085;
        }

        .dashboard-card h3 {
            margin: 0;
            font-size: 2.4rem;
            color: black;
            font-weight: 600;
        }

        .dashboard-card p {
            font-size: 1.2rem;
            color: black;
            font-weight: 500;
        }

        .students {
            background-color: #ff5722;
        }

        .instructors {
            background-color: #4caf50;
        }

        .courses {
            background-color: #2196f3;
        }

        .dashboard-card:hover {
            transform: translateY(-6px) scale(1.05);
        }
    </style>
</head>
<body>

    <div class="background"></div>

    <div class="navbar">
        <h1>Learning Management System</h1>
        <button class="back-button" onclick="history.back();">Back</button>
    </div>

    <div class="dashboard-container">
        <div class="dashboard">
            <div class="dashboard-card students">
                <i class="fas fa-user-graduate"></i>
                <h3>${studentsCount}</h3>
                <p>Students</p>
            </div>
            <div class="dashboard-card instructors">
                <i class="fas fa-chalkboard-teacher"></i>
                <h3>${instructorsCount}</h3>
                <p>Instructors</p>
            </div>
            <div class="dashboard-card courses">
                <i class="fas fa-book-open"></i>
                <h3>${coursesCount}</h3>
                <p>Courses</p>
            </div>
        </div>
    </div>

</body>
</html>
