<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Properties</title>
    <link rel="stylesheet" href="property.css">
</head>
<script>
    function change(){
        if(document.getElementById("apartment").style.display=="none")
            document.getElementById("apartment").style.display="block"
        else
            document.getElementById("apartment").style.display="none"
    }


    function hide(x){
        if(document.getElementById("hide"+x).style.display=="none")
        {
            document.getElementById("hide"+x).style.display="inline-block"
            document.getElementById("details"+x).innerHTML="Hide Details"
            
        }
        else
        {
            document.getElementById("details"+x).innerHTML="Show Details"
            document.getElementById("hide"+x).style.display="none"
        }
    }

    function hideown(x){
        console.log(document.getElementById("hideowner"))
        if(document.getElementById("hideowner"+x).style.display=="none")
        {
            console.log("hi");
            document.getElementById("hideowner"+x).style.display="inline-block"    
            document.get        
        }
        else
        {
            // document.getElementById("details").innerHTML="Show Details"
            document.getElementById("hideowner"+x).style.display="none"
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
            <li class="nav-item" id="active"><a href="properties.jsp">Properties</a></li>
            <li class="nav-item"><a href="choice.jsp" >Sell</a></li>
            <li class="nav-item"><a href="aboutus.jsp">About Us</a></li>
            <li class="nav-item"><a href="contactus.jsp">Contact</a></li>
            <li class="nav-item">
                <a href="logout"><img src="https://static-00.iconduck.com/assets.00/logout-icon-512x512-2x08s84n.png" class="login" alt="logout" height="40px" width="50px"></a>
            </li>
        </ul>
    <form action="properties" method="post">
        <div class="search">
            <input type="search" placeholder="Enter Location of property by state, city or pincode" name="search_box" class="search-input" id="" autofocus> 
            <button><img src="search.jpg" class="search-img" width="65px" height="65px" alt=""></button>
        </div>
    </div>
    <div class="main">
        <div class="filter">
            <div class="lookingto">
                <h3>Looking to</h3>
                <input type="text" class="choice" name="null" id="lookingto" value="Rent" readonly>
                <input type="text" class="choice" name="null" id="lookingto" value="Buy" readonly>
            </div>
            <div class="property-type">
                <h3>Property Type</h3>
                <input type="text" class="choice" name="null" id="ptype" value="Induvidual House"  readonly>
                <input type="text" class="choice" name="null" id="ptype" value="Apartments"  readonly>
                <input type="text" class="choice" name="null" id="ptype" value="Villa" readonly>
                <input type="text" class="choice" name="null" id="ptype" value="Plot" onclick="change()" readonly>
            </div>


            <div id="apartment">
                <div class="bedroom">
                    <h3>Bedrooms</h3>
                    <input type="text" class="choice" name="null" id="bedroom" value="2BHK" readonly>
                    <input type="text" class="choice" name="null" id="bedroom" value="3BHK" readonly>
                    <input type="text" class="choice" name="null" id="bedroom" value="4BHK" readonly>
                </div>
                <div class="construction">
                    <h3>Construction Status</h3>
                    <input type="text" class="choice" name="null" id="construction" value="Ready to move" readonly>
                    <input type="text" class="choice" name="null" id="construction" value="Under Construction" readonly>
                </div>
                <div class="furnishing">
                    <h3>Furnishing</h3>
                    <input type="text" class="choice" name="null" id="furnishing" value="Furnished" readonly>
                    <input type="text" class="choice" name="null" id="furnishing" value="Semi-Furnished" readonly>
                    <input type="text" class="choice" name="null" id="furnishing" value="Un-Furnished" readonly>
                </div>
            </div>
            <div class="area">
                <h3>Area in sqft</h3>
                <input type="range" name="areaSlider" id="areaSlider" min="0" max="5000" onchange = "updateTextInput(this.value, 1);"><br>
                <span type="text" id="min">0<span>
                <input type="number" name="areaText" min=0 max=5000 pattern="^(?:[0-4]\d{1,3}|5000)$" id="textInput1" class="areaText" placeholder="Area" onchange = updateSlider(this.value)>
                <span type="text" id="max">5000<span>
            </div>

            <div class="price">
                <h3>Budget</h3>
                <input type="text" pattern="^\d+-\d+$" min=0 placeholder="Budget price range (eg: 10000-50000)" name="price" id="price" onchange=checkPrice()><br>
                <label id="invalidprice" hidden>
            </div>

        </div>
        <div class="items" id="items">
        </div>
    </div>
    </form>
    <input type="hidden" id="getData" value="<%= request.getAttribute("data_concat")%>">
    <script>
        // text slider
        function updateTextInput(val, x) {
          document.getElementById('textInput' + x).value = val;
        }
        function updateSlider(val){
            document.getElementById('areaSlider').value  = val;
        }

        // check price if range is valid
        function checkPrice() {
            const price = document.getElementById("price").value;
            const priceRange = price.split("-");
            const emsg = document.getElementById("invalidprice");
            
            if(priceRange[0] == ''){
                emsg.setAttribute("hidden", "hidden");
                return;
            }
            else if (priceRange.length !== 2){
                emsg.innerHTML = "invalid price range!";
                emsg.removeAttribute("hidden");
                return false;
            }
            else
                emsg.setAttribute("hidden", "hidden");

            const n1 = parseInt(priceRange[0]);
            const n2 = parseInt(priceRange[1]);

            if (isNaN(n1) || isNaN(n2) || n1 > n2){
                emsg.innerHTML = "invalid price range!";
                emsg.removeAttribute("hidden");
                return false;
            }
            else
                emsg.setAttribute("hidden", "hidden");
        }

        // color toggle function
        const choice = document.querySelectorAll(".choice");
        choice.forEach(i => {
            i.addEventListener("click", () =>{
                if(i.getAttribute('style','background-color') === null 
                    || i.getAttribute('style','background-color') ==="background-color:null"){
                    i.setAttribute('style','background-color:rgb(16, 117, 164);color:white')
                }
                else{
                    i.setAttribute('style','background-color:null')
                    i.setAttribute('name', '')
                }
            })
        });

        // for looking to
        const lookingto = document.querySelectorAll("#lookingto");
        lookingto.forEach(i =>{
            i.addEventListener("click", () => {
                if(i.getAttribute('name') === "null"){
                    i.setAttribute('name', "lookingto");
                } else{
                    i.setAttribute('name', "null");
                }
            })
        })

        // for property type
        const ptype = document.querySelectorAll("#ptype");
        ptype.forEach(i =>{
            i.addEventListener("click", () => {
                if(i.getAttribute('name') === "null"){
                    i.setAttribute('name', "ptype");
                } else{
                    i.setAttribute('name', "null");
                }
            })
        })

        // for bedroom
        const bedroom = document.querySelectorAll("#bedroom");
        bedroom.forEach(i =>{
            i.addEventListener("click", () => {
                if(i.getAttribute('name') === "null"){
                    i.setAttribute('name', "bedroom");
                } else{
                    i.setAttribute('name', "null");
                }
            })
        })

        // for construction
        const construction = document.querySelectorAll("#construction");
        construction.forEach(i =>{
            i.addEventListener("click", () => {
                if(i.getAttribute('name') === "null"){
                    i.setAttribute('name', "construction");
                } else{
                    i.setAttribute('name', "null");
                }
            })
        })

        // for furnishing
        const furnishing = document.querySelectorAll("#furnishing");
        furnishing.forEach(i =>{
            i.addEventListener("click", () => {
                if(i.getAttribute('name') === "null"){
                    i.setAttribute('name', "furnishing");
                } else{
                    i.setAttribute('name', "null");
                }
            })
        })

        // property data from java 
        const data_concat = document.getElementById("getData");
        const dataArr = data_concat.value.split("\n");
        console.log(dataArr);

        const itemsBox = document.getElementById("items");
    
        for(var i = 0; i < dataArr.length - 1; i++){
            if(dataArr[i] !== "null"){
                var data=dataArr[i].split("~")
                console.log(data)
                const outer = document.createElement('div');
                outer.setAttribute('class', 'item');
                if(data[3]!=4)
                {
                outer.innerHTML=
                "<img src='"+data[3]+".png' class='icon' height='60px' width='60px'>"+
                "<p class='imp-details'>Property Name:"+data[0]+"<br>Address:"+data[4]+" "+data[5]+"<br>Price:"+data[17]+"<br><a href='"+data[23]+"'"+ 
                "class='gdrive' title='Images/Documents'>Images</a></p>"+
                "<p onclick='hide("+i+")' class='details' id='details"+i+"'>Show Details</p>"+
                "<p onclick='hideown("+i+")' class='owner'>Contact</p>"+
                "<div class='hide' id='hide"+i+"'>"+
                    "<p>Looking to:"+data[2]+"<br>Bedrooms:"+data[9]+"<br>Area:"+data[10] +
                    "sq ft<br>Furnishing: "+data[11]+"<br>Floor: "+data[13]+"<br>Availibilty: "+data[16]+"<br>Description: "+data[18]+"</p>"+
                "</div>"+
                "<div class='hideowner' id='hideowner"+i+"'>"+
                    "<p>Email:"+data[20]+"<br>Mobile Number:"+data[1]+"</p>"+
                "</div>"
                }
                else
                {
                    outer.innerHTML=
                    "<img src='"+data[3]+".png' class='icon' height='60px' width='60px'>"+
                    "<p class='imp-details'>Property Name:"+data[0]+"<br>Address:"+data[4]+" "+data[5]+"<br>Price:"+data[17]+"<br><a href='"+data[23]+"'"+ 
                    "class='gdrive' title='Images/Documents'>Images</a></p>"+
                    "<p onclick='hide("+i+")' class='details' id='details"+i+"'>Show Details</p>"+
                    "<p onclick='hideown("+i+")' class='owner'>Contact</p>"+
                    "<div class='hide' id='hide"+i+"'>"+
                        "<p>Looking to:"+data[2]+"<br>Area:"+data[10]+"sq ft<br> Dimensions: "+ data[14]+"x"+data[15]+"<br>Floor: "+data[12]+"<br>Description: "+data[18]+"</p>"+
                    "</div>"+
                    "<div class='hideowner' id='hideowner"+i+"'>"+
                    "<p>Email:"+data[20]+"<br>Mobile Number:"+data[1]+"</p>"+
                "</div>"
                }
                console.log(outer.innerHTML)
                itemsBox.appendChild(outer);
            }
        }

        // input-fit-content

        x=document.getElementsByClassName("choice")
        for(var i=0;i<x.length;i++)
        {
            x[i].setAttribute('size',x[i].value.length);
        }
    </script>
</body>
</html> 