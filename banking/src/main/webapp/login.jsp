<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Bank Login</title>
<style>
body {
	font-family: Arial, sans-serif;
    background-image: url("https://getlegalindia.com/wp-content/uploads/2021/10/what-is-provident-fund.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
	 background-position: center calc(40% - 5px); 
    margin-right: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}


.login-container {
	display: flex;
    flex-direction: column;
    align-items: center;
    
    padding: 30px;
    border-radius: 5px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 4.0);
    background-color: rgba(255, 255, 255, 0.5);
    max-width: 300px;
    width: 100%;
    text-align: center;
    
    margin-top:10px;
}

h2 {
	margin-bottom: 20px;
	color: #333;
}

.form-group {
	margin-bottom: 15px;
	text-align: left;
}

label {
	display: block;
	margin-bottom: 5px;
	color: #666;
}

input {
	width: 100%;
	padding: 10px;
	r̥ border: 1px solid #ccc;
	border-radius: 4px;
}

button {
	 width: 200px;
    height: 50px;
    font-size: 18px;
    color: #fff;
    background-color: #32CD32;
    border: none;
    border-radius: 5px;
    margin: 10px 0;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="background-image"></div>
	<div class="login-container">
		<h2>Bank Login</h2>
		<form action="LoginServlet" method="post">
			<div class="form-group">
				<label for="username">Username</label> <input type="text"
					id="username" name="username" required>
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					id="password" name="password" required>
			</div>
			<a href="error.html">
				<button type="submit">Login</button>
			</a>
		</form>
	</div>
</body>
</html>