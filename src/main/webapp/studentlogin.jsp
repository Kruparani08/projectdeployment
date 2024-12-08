<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student login</title>
<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #2c3e50, #16a085);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #fff;
        }

        .form-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 400px;
        }

        h3 {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
            font-size: 24px;
            font-weight: bold;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px 0;
        }

        label {
            font-size: 14px;
            color: #2c3e50;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            outline: none;
        }

        input[type="submit"], input[type="reset"] {
            width: 48%;
            padding: 10px;
            font-size: 14px;
            font-weight: bold;
            color: #fff;
            background: linear-gradient(135deg, #16a085, #1abc9c);
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background: linear-gradient(135deg, #1abc9c, #16a085);
            transform: translateY(-2px);
        }

        .button-container {
            text-align: center;
            padding-top: 10px;
        }

        @media (max-width: 480px) {
            .form-container {
                padding: 20px;
            }

            h3 {
                font-size: 20px;
            }

            input[type="submit"], input[type="reset"] {
                font-size: 12px;
            }
        }
</style>
</head>
<body>
<div class="form-container">
        <h3><u>Student Login</u></h3>
        <form method="post" action="checkstudentlogin">
            <table>
                <tr>
                    <td colspan="2">
                        <label for="id">Enter Student ID</label>
                        <input type="text" id="id" name="id" required/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label for="pwd">Enter Password</label>
                        <input type="password" id="pwd" name="pwd" required/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Login"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>