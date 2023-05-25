<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.text.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REMS</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
    <div class="main">
    <form id="mainform" name="mainform" action="login" method="post"> 
        <div class="heading">
            <h1 id="login" onclick="fun1()">LOGIN</h1>
            <h1 id="register" onclick="fun2()">REGISTER</h1>
        </div>
        <div id="content">
            <input type="email" name='username' placeholder="Email" required><br>
            <input type="password" name='password' placeholder="Password" required><br>
            <button><h1 id="submit">LOGIN</h1></button><br>
        </div>
    </form>
    </div>
    <script>
        function fun2(){
            document.getElementById("content").innerHTML=`
                <input type="text" name='name' placeholder="Name" required><br>
                <input type="email" name='username' placeholder="Email" required><br>
                <input type="password" name='password' placeholder="Password" ><br>
                <input type="phone" name='phone' placeholder="Mobile no." required><br>
                <button><h1 id="submit">REGISTER</h1></button><br>`
            document.getElementById("register").style.backgroundColor='rgb(0, 150, 213)';
            document.getElementById("register").style.color='white'
            document.getElementById("login").style.backgroundColor='white';
            document.getElementById("login").style.color='black'
            document.getElementById("mainform").setAttribute("action", "register");
        }
        function fun1(){
            document.getElementById("content").innerHTML=`
                <input type="email" name='username' placeholder="Email" required><br>
                <input type="password" name='password' placeholder="Password" required><br>
                <button><h1 id="submit">LOGIN</h1></button><br>`
            document.getElementById("login").style.backgroundColor='rgb(0, 150, 213)';
            document.getElementById("login").style.color='white'
            document.getElementById("register").style.backgroundColor='white';
            document.getElementById("register").style.color='black'
            document.getElementById("mainform").setAttribute("action", "login");
        }
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    <script>
        var status = document.getElementById("status").value;
        console.log(status);
        if(status == "success")
            swal("Welcome", "Account created!", "success");
        else if(status == "error")
            swal("Oops", "Invalid password or email!", "error");
        else if(status == "already")
            swal("Oops", "Username already exists!", "error");
        else if(status == "notexist")
            swal("Oops", "Username does not exists!", "error");
    </script>
</body>
</html>