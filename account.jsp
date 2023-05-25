<%
    if(session.getAttribute("name")==null){
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UrbanUtopia</title>
    <link rel="stylesheet" href="landings.css">
</head>
<body>
    <div class="navbar">
        <ul>
            <li class="logo">
            <img src="logo.png" alt="" height="50px" width="80px"><span class="website-name"><span class="u">U</span>rban<span class="u">U</span>topia</span>
            </li>
            <li class="start" id="active"><a href="">Home</a></li>
            <li class="nav-item"><a href="properties.jsp">Properties</a></li>
            <li class="nav-item"><a href="choice.jsp">Sell</a></li>
            <li class="nav-item"><a href="aboutus.jsp">About Us</a></li>
            <li class="nav-item"><a href="contactus.jsp">Contact</a></li>
            <li class="nav-item">
                <a href="logout"><img src="https://static-00.iconduck.com/assets.00/logout-icon-512x512-2x08s84n.png" class="login" alt="logout" height="40px" width="50px"></a>
            </li>
        </ul>
    </div>
    <div class="main">
        <div class="heading">Find Your Dream Home</div>
        <div class="subheading">Need a perfect place to live right now? Here are the best offers you can get!!<br>The perfect website to nurture the requirements for your perfect house.</div>
        <form action="searchbox" method="post">
        <div class="search">
            <input onchange="console.log(document.getElementById('search_box').value)" type="search" placeholder="Enter Location of property by state, city or pincode" name="search_box" class="search-input" id="search_box" autofocus> 
            <button><img src="search.jpg" class="search-img" width="65px" height="65px" alt=""></button>
        </div>
        </form>
    </div>
    </div>
    <div class="footer">
        <ul >
            <li class="foot"><img src="1.png" alt="" width="75px" height="60px"></li>
            <li class="foot"><img src="2.png" alt="" width="70px" height="60px"></li>
            <li class="foot"><img src="3.png" alt="" width="70px" height="60px"></li>
            <li class="foot"><img src="4.png" alt="" width="70px" height="60px"></li>
        </ul>
        <ul >
            <li class="foot-text house">Induvidual Houses</li>
            <li class="foot-text">Apartments</li>
            <li class="foot-text villa">Villas</li>
            <li class="foot-text land">Plots</li>
        </ul>
    </div>
</body>
<script>
</script>
</html>