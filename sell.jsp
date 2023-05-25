<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sell</title>
    <link rel="stylesheet" href="sell.css">
</head>
<script>
    function choice(x) {
        console.log("hi");
        if(x==1 || x==3)
        {
            document.getElementById("deets").innerHTML=`<br>
                <div class="bedroom">
                    <label for="">No. of bedrooms</label><br>
                    <input type="radio" name="bed" value="1">1
                    <input type="radio" name="bed" value="2">2
                    <input type="radio" name="bed" value="3">3
                    <input type="radio" name="bed" value="4">4<br>
                </div>

                <div class="area">
                    <label for="">Area of plot</label><br>
                    <input type="number" name="area" placeholder="Plot Area in sqft."><br>
                </div>
                
                <div class="furnishing">
                    <label for="">Furnishing</label><br>
                    <input type="radio" name="furnished" value="Furnished">Furnished
                    <input type="radio" name="furnished" value="Semi-Furnished">Semi-Furnished
                    <input type="radio" name="furnished" value="Un-Furnished">Un-Furnished<br>
                </div>

                <div class="floor">
                    <label for="">Floor Details</label><br>
                    <input type="number" name="floor" placeholder="Total Floors"><br>
                </div>
                
                <div class="available">
                    <label for="">Availability</label><br>
                    <input type="radio" name="availibility" value="Ready to move">Ready to move
                    <input type="radio" name="availibility" value="Under Construction">Under Construction
                </div>
            `
        }
        else if(x==2)
        {
            document.getElementById("deets").innerHTML=`<br>
                <div class="bedroom">
                    <label for="">No. of bedrooms</label><br>
                    <input type="radio" name="bed" value="2">2BHK
                    <input type="radio" name="bed" value="3">3BHK
                    <input type="radio" name="bed" onclick="fun()" value="4">Other
                    <input type="number" name="beds" id="others" placeholder="Enter bedroom count"><br>
                </div>
                <div class="area">
                    <label for="">Area of plot</label><br>
                    <input type="number" name="area" placeholder="Area in sqft."><br>
                </div>
                <div class="furnishing">
                    <label for="">Furnishing</label><br>
                    <input type="radio" name="furnished" value="Furnished">Furnished
                    <input type="radio" name="furnished" value="Semi-Furnished">Semi-Furnished
                    <input type="radio" name="furnished" value="Un-Furnished">Un-Furnished<br>
                </div>
                <div class="floor">
                    <label for="">Floor Details</label><br>
                    <input type="number" name="floor" placeholder="Total Floors">
                    <input type="number" name="propertyonfloor" placeholder="Property on Floor"><br>
                </div>
                <div class="availability">
                    <label for="">Availability</label><br>
                    <input type="radio" name="availability" value="Ready to move">Ready to move
                    <input type="radio" name="availability" value="Under Construction">Under Construction
                </div>
            `
        }
        else if(x==4)
        {
            document.getElementById("deets").innerHTML=`<br>
                <div class="area">
                    <label for="area">Area of plot</label><br>
                    <input type="number" name="area" placeholder="Plot Area in sqft."><br><br>

                    <label for="property">Property Dimensions</label><br>
                    <input type="number" name="length" placeholder="Length of plot(in sqft)">
                    <input type="number" name="breadth" placeholder="Breadth of plot(in sqft)"><br>
                </div>
                <div class="floor-plot">
                    <label for="floor">Floor Details</label><br>
                    <input type="text" name="floor" class="floors-allowed" placeholder="Floors allowed for construction">
                </div>
            `
        }
    }
</script>   
<body>
    <div class="navbar">
        <ul>
            <li class="logo">
            <img src="logo.png" alt="" height="50px" width="80px"><span class="website-name"><span class="u">U</span>rban<span class="u">U</span>topia</span>
            </li>
            <li class="start"><a href="account.jsp">Home</a></li>
            <li class="nav-item"><a href="properties.jsp">Properties</a></li>
            <li class="nav-item" id="active"><a href="sell.jsp" >Sell</a></li>
            <li class="nav-item"><a href="aboutus.jsp">About Us</a></li>
            <li class="nav-item"><a href="contactus.jsp">Contact</a></li>
            <li class="nav-item">
                <a href="logout"><img src="https://static-00.iconduck.com/assets.00/logout-icon-512x512-2x08s84n.png" class="login" alt="logout" height="40px" width="50px"></a>
            </li>
        </ul>
    </div>
    <input type="hidden" id="newp" value="<%= request.getAttribute("new_property") %>">
    <div class="main">
        <form action="sell" method= "post">
            <div class="personal">
                <label for="Name">Name</label><br>
                <input type="text" name="name" placeholder="Name"><br><br>
                <label for="">Mobile number</label><br>
                <input type="tel" name="phone" pattern="[1-9]{1}[0-9]{9}" placeholder="Mobile no."><br>  
            </div>
            
            <div class="lookingto">
                <label for="">Looking to</label><br>
                <input type="radio" name="looking" value="sell">Sell
                <input type="radio" name="looking" value="rent">Rent<br>
            </div>
            
            <div class="property-type">
                <label for="">Type of property</label><br>
                <input type="radio" name="type" id="type" value="1" onclick="choice(1)">Induvidual House
                <input type="radio" name="type" id="type" value="2" onclick="choice(2)">Apartment
                <input type="radio" name="type" id="type" value="3" onclick="choice(3)">Villa
                <input type="radio" name="type" id="type" value="4" onclick="choice(4)">Plot<br>
            </div>
            <legend>Location Details</legend><br>
            <fieldset><br>
                <label for="">Door number</label><br>
                <input type="text" name="door" placeholder="Door no."><br><br>
                <label for="">Address of property</label><br>
                <input type="textarea" name="address" id="address" placeholder="Enter full address">
                
                <div class="location-label">
                    <label for="">City</label>
                    <label for="" id="state-label">State</label>
                    <label for="" id="pincode-label">Pincode</label>
                    </div>
                <div class="location">
                    <input type="text" name="city" id="city" placeholder="City">
                    <input type="text" name="state" id="state" placeholder="State">
                    <input type="number" name="pincode" id="pincode" pattern="[0-9]{6}" placeholder="Pincode">
                    </div>
            </fieldset>

            <legend>Property Details</legend><br>
            <fieldset id="deets"><br>
                <div class="bedroom">
                    <label for="">No. of bedrooms</label><br>
                    <input type="radio" name="bed" value="1">1
                    <input type="radio" name="bed" value="2">2
                    <input type="radio" name="bed" value="3">3
                    <input type="radio" name="bed" value="4">4<br>
                </div>

                <div class="area">
                    <label for="">Area of plot</label><br>
                    <input type="number" name="area" placeholder="Plot Area in sqft."><br>
                </div>
                
                <div class="furnishing">
                    <label for="">Furnishing</label><br>
                    <input type="radio" name="furnished" value="Furnished">Furnished
                    <input type="radio" name="furnished" value="Semi-Furnished">Semi-Furnished
                    <input type="radio" name="furnished" value="Un-Furnished">Un-Furnished<br>
                </div>

                <div class="floor">
                    <label for="">Floor Details</label><br>
                    <input type="number" name="floor" placeholder="Total Floors"><br>
                </div>
                
                <div class="available">
                    <label for="">Availability</label><br>
                    <input type="radio" name="availibility" value="Ready to move">Ready to move
                    <input type="radio" name="availibility" value="Under Construction">Under Construction
                </div>
            </fieldset>

            <legend>Property Images and Documents</legend><br>
            <fieldset>
                <input type="link" placeholder="G-drive link">Upload google drive link containing the property images and documents
            </fieldset>

            <legend>Property Price</legend><br>
            <fieldset>
                <br><label for="">Pricing</label><br>
                <input type="number" name="expectedprice" placeholder="Expected Price">
                <!-- <input type="number" name="pricepersqft" placeholder="Price per sqft"><br><br>
                <label for="">Prices Negotiable</label><br>
                <input type="radio" name="negotiable" value="Yes">Yes
                <input type="radio" name="negotiable" value="No">No -->
            </fieldset>

            <legend>What makes your property unique?</legend><br>
            <textarea id="spl" name="description" placeholder="Describe other features of your property for better reach"></textarea><br>
            <button type="submit">SUBMIT</button>
            
        </form>
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    <script>

        function fun(){
            document.getElementById('others').style.display="inline-block";
        }

        var newp = document.getElementById("newp").value;
        
        if(newp == "success")
            swal("Success!", "Property added!", "success");
        else if(newp == "failed")
            swal("Oops", "Failed to add property!", "error");
    </script>
</body>
</html>