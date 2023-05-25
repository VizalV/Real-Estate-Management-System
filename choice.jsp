<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sell</title>
    <link rel="stylesheet" href="choice.css">
</head>
<body>
    <input type="hidden" id="newp" value="<%= request.getAttribute("new_property") %>">
    <div class="navbar">
        <ul>
            <li class="logo">
            <img src="logo.png" alt="" height="50px" width="80px"><span class="website-name"><span class="u">U</span>rban<span class="u">U</span>topia</span>
            </li>
            <li class="start"><a href="account.jsp">Home</a></li>
            <li class="nav-item"><a href="properties.jsp">Properties</a></li>
            <li class="nav-item" id="active"><a href="choice.jsp" >Sell</a></li>
            <li class="nav-item"><a href="#">About Us</a></li>
            <li class="nav-item"><a href="#">Contact</a></li>
            <li class="nav-item">
                <a href="landing.html"><img src="https://static-00.iconduck.com/assets.00/logout-icon-512x512-2x08s84n.png" class="login" alt="logout" height="40px" width="50px"></a>
            </li>
        </ul>
    </div>
    <div class="content" id="content">
        <p onclick="add()">Add New Property</p>
        <p onclick="view()">View Existing Property</p>
    </div>
    <div class="main" id="main">
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

    function choice(x) {
        if(x==1 || x==3 || x==2)
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
                    <input type="number" name="floor" placeholder="Total Floors/Property on floor"><br>
                </div>
                
                <div class="available">
                    <label for="">Availability</label><br>
                    <input type="radio" name="availibility" value="Ready to move">Ready to move
                    <input type="radio" name="availibility" value="Under Construction">Under Construction
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

    function back(){
        document.getElementById("main").innerHTML="";
        document.getElementById("content").style.display="block";
    }

    function add(){
        document.getElementById("content").style.display="none";
        document.getElementById("main").innerHTML=`
        <form action="sell" method="post">
            <div class="personal">
                <label for="Name">Property Name</label><br>
                <input type="text" name="name" placeholder="Property Name"><br><br>
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
                    <input type="number" name="floor" placeholder="Total Floors/Property on floor"><br>
                </div>
                
                <div class="available">
                    <label for="">Availability</label><br>
                    <input type="radio" name="availibility" value="Ready to move">Ready to move
                    <input type="radio" name="availibility" value="Under Construction">Under Construction
                </div>
            </fieldset>

            <legend>Property Images and Documents</legend><br>
            <fieldset>
                <input type="link" name="drivelink" placeholder="G-drive link">Upload google drive link containing the property images and documents
             </fieldset>

            <legend>Property Price</legend><br>
            <fieldset>
                <br><label for="">Pricing</label><br>
                <input type="number" name="expectedprice" placeholder="Price">
            </fieldset>

            <legend>What makes your property unique?</legend><br>
            <textarea id="spl" name="description" placeholder="Describe other features of your property for better reach"></textarea><br>
            <button id="general">SUBMIT</button>
        </form>
        <button id="general" onclick='back()'>Back</button>   
        `
    }

    function view(){

        document.getElementById("content").style.display="none";
        const main = document.getElementById("main");
        main.innerHTML=`
        <h1>My Properties</h1>
        <div id="property"><div>
        <button id="general" onclick='back()'>Back</button>`;
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "view");
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                console.log("onload" + xhr.responseText);
                const new_data = xhr.responseText.split("\n");
                addProps(new_data);
            }
        };
        xhr.send();
        const bk = document.createElement('button');
        bk.id = "general";
        bk.innerHTML = "Back";
        bk.addEventListener('click', ()=>{back()});
        main.appendChild(bk);
    }

    function addProps(properties){

        const prop = document.getElementById("property");
        prop.innerHTML = "";
        console.log(properties);
        if(properties[0] === ''){
            var alldone = document.createElement("div");
            alldone.classList="propty";
            var content = document.createElement("p");
            content.classList = "data";
            content.innerHTML = "You have not added any properties!<br>Go back to add properties..";
            prop.appendChild(alldone);
            alldone.appendChild(content);
            return;
        }
        
        for(var i=0; i<properties.length - 1; i++)
        {
            var x=document.createElement("div");
            x.classList="propty";
            var y=document.createElement("div");
            y.classList="data";

            const item = properties[i].split("~");
            y.innerHTML = item[5]+"<br>"+item[0]+"<br>"+item[1]+"<br>"+item[2]+" "+item[17]; // content to be shown
            prop.appendChild(x);

            // for update button
            const u1 = document.createElement("button");
            u1.setAttribute("id", (i+1)+"");
            u1.id = "showboxes";
            u1.innerHTML="Update";
            const propid = (i+1)+"";
            u1.addEventListener("click", ()=>{

                const look = document.createElement('input');
                look.type = "text";
                look.placeholder = "Enter Rent or Sell";
                look.pattern = "Rent|Sell";

                const price = document.createElement('input');
                price.type = "number";
                price.placeholder = "Enter new Price";

                document.getElementById('showboxes').remove();

                const update = document.createElement("button");
                update.classList.add("update");
                update.innerHTML="Update";

                update.addEventListener("click", function() {
                    const xhr = new XMLHttpRequest();
                    xhr.open("POST", "view");
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.onreadystatechange = function() {
                        if (this.readyState == 4 && this.status == 200) {
                            console.log(xhr.responseText);
                            const new_data = xhr.responseText.split("\n");
                            addProps(new_data);
                        }
                    };
                    console.log("action=update&id=" + propid     + "&lookingto=" + look.value + "&price=" + price.value)
                    xhr.send("action=update&id=" + propid+ "&lookingto=" + look.value + "&price=" + price.value);
                });

                x.innerHTML = "";
                x.appendChild(look);
                x.appendChild(price);
                x.appendChild(update);
            });

            // for delete button
            const del = document.createElement("button");
            del.classList.add("delete");
            del.setAttribute("id", (i+1)+"");
            del.innerHTML="Delete";

            del.addEventListener("click", function() {
                const xhr = new XMLHttpRequest();
                xhr.open("POST", "view"); // Servlet path
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onload = function() {
                    if (xhr.status === 200) {
                        console.log(xhr.responseText);
                        const new_data = xhr.responseText.split("\n");
                        addProps(new_data);
                    }
                };
                xhr.send("action=delete&id=" + this.id);
            });

            // append everything in the div
            x.appendChild(y)
            x.appendChild(u1)
            x.appendChild(del)
        }
    }
</script>
</body>
</html>