<%
    if(session.getAttribute("name") == null){
        session.setAttribute("log", "no");
    }else{
        session.setAttribute("log", "yes");
    }
       
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="aboutus.css">
</head>
<body>
    <div class="navbar">
        <ul>
            <li class="logo">
            <img src="logo.png" alt="" height="50px" width="80px"><span class="website-name"><span class="u">U</span>rban<span class="u">U</span>topia</span>
            </li>
            <li class="start"><a href="landing.html">Home</a></li>
            <li class="nav-item"><a href="properties.jsp">Properties</a></li>
            <li class="nav-item"><a href="choice.jsp">Sell</a></li>
            <li class="nav-item" id="active"><a href="aboutus.jsp">About Us</a></li>
            <li class="nav-item"><a href="contactus.jsp">Contact</a></li>
            <li class="nav-item login" id="islogin" value="<%= session.getAttribute("log") %>">
                <a href="login.jsp">Login</a>
            </li>
        </ul>
    </div>
    <div class="main">
        <h1>About Us</h1>
        <div class="content">
            <p>
                Welcome to our real estate website,<br><br>

                <span id="para">At our real estate agency, we are dedicated to helping our clients navigate the complex world of real estate.  Whether you're a first-time buyer, an experienced investor, or looking to sell your home, we have the expertise and resources to guide you through every step of the process. 
                
                Our team of experienced agents are passionate about real estate and are committed to providing the highest level of customer service. We pride ourselves on our ability to listen to our clients' needs and tailor our services to meet their specific goals.                 
                We also offer a wide range of resources and tools to help you make informed decisions about your real estate transactions. From market analysis and property valuation to mortgage calculators and home search tools, we provide everything you need to make the best decisions for you and your family. 
                
                So whether you're buying, selling, or renting a property, we're here to help. Contact us today to learn more about how we can help you achieve your real estate goals. </span>
            </p>
        </div>
    </div>
    <script>

        var checklogin = document.getElementById('islogin');
        console.log("hi",checklogin.value);
        if(checklogin.value=="no")
        {
            checklogin.innerHTML = `<a href="login.jsp">Login</a>`;;

        }
        else if(checklogin.value == "yes")
        {
            checklogin.innerHTML = `<a href="logout"><img src="https://static-00.iconduck.com/assets.00/logout-icon-512x512-2x08s84n.png" 
            class="login" alt="logout" height="40px" width="50px"></a>`;

        }

    </script>
</body>
</html>