<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Account</title>
    <script>
        function validateForm() {
            var pwd = document.getElementById("password").value;
            var repwd = document.getElementById("repassword").value;
            if (pwd !== repwd) {
                alert("Passwords do not match!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <h2>Create New Account</h2>
    <form action="CreateServlet" method="post" onsubmit="return validateForm()">
        <div>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div><br>

        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div><br>

        <div>
            <label for="repassword">Re-enter Password:</label>
            <input type="password" id="repassword" name="repassword" required>
        </div><br>

        <div>
            <label for="amount">Initial Deposit Amount:</label>
            <input type="number" id="amount" name="amount" step="0.01" min="0" required>
        </div><br>

        <div>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
        </div><br>

        <div>
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" required>
        </div><br>

        <input type="submit" value="Create Account">
    </form>
</body>
</html>
