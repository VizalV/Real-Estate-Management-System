<%
    if(session.getAttribute("name")==null){
        request.setAttribute("login", "no");
    }else{
        request.setAttribute("login", "yes");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="contactus.css">
</head>
<body>
    <div class="navbar">
        <ul>
            <li class="logo">
            <img src="logo.png" alt="" height="50px" width="80px"><span class="website-name"><span class="u">U</span>rban<span class="u">U</span>topia</span>
            </li>
            <li class="start"><a href="landing.html">Home</a></li>
            <li class="nav-item"><a href="properties.jsp">Properties</a></li>
            <li class="nav-item"><a href="jsp.jsp">Sell</a></li>
            <li class="nav-item" ><a href="aboutus.jsp">About Us</a></li>
            <li class="nav-item" id="active"><a href="contactus.jsp">Contact</a></li>
            <li class="nav-item login" id="islogin" value="yes">
                <a href="login.jsp">Login</a>
            </li>
        </ul>
    </div>
    <div class="main">
        <h1>Contact Us</h1>
            <p>Questions not answered yet? We are here to help</p>
            <div class="foot">
                <div class="phno">
                    <span>Mobile Number</span>
                    <span>+917654892836</span>
                </div>
                <div class="email">
                    <span>Email Address</span>
                    <span>UrbanUtopia@gmail.com</span>
                </div>
                <div class="social">
                    <span>Social Media Handle</span>
                    <span><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png" alt="" height="30px" id="insta" width="30px">UrbanUtopia</span>
                </div>
            </div>
    </div>
    <script>

        const checklogin = document.getElementById('islogin');
        if(checklogin.value == "no"){
            const log = `<a href="login.jsp">Login</a>`;
            checklogin.innerHTML=log;
        }else if(checklogin.value == "yes"){
            const log= `<a href="logout"><img src="https://static-00.iconduck.com/assets.00/logout-icon-512x512-2x08s84n.png" 
            class="login" alt="logout" height="40px" width="50px"></a>`;
        }
        checklogin.innerHTML = log;
        
    </script>
</body>
</html>